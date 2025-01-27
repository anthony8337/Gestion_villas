<?php
// Configuración de la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'gestion_de_propietario';

// Conectar a la base de datos
$mysqli = new mysqli($host, $user, $password, $database);

// Comprobar conexión
if ($mysqli->connect_error) {
    die("Error de conexión: " . $mysqli->connect_error);
}

// Configurar cabeceras para la descarga del archivo
header('Content-Type: application/sql');
header('Content-Disposition: attachment; filename="backup_gestion_de_propietario.sql"');
header('Pragma: no-cache');
header('Expires: 0');

// Abrir salida directa
$output = fopen('php://output', 'w');
if (!$output) {
    die("No se puede escribir en la salida.");
}

// Iniciar la transacción
fwrite($output, "SET FOREIGN_KEY_CHECKS = 0;\n");

// Eliminar y crear la base de datos
fwrite($output, "DROP DATABASE IF EXISTS `$database`;\n");
fwrite($output, "CREATE DATABASE `$database`;\n");
fwrite($output, "USE `$database`;\n");

// 1. Exportar tablas (estructura)
$tables = $mysqli->query("SHOW FULL TABLES WHERE Table_type = 'BASE TABLE'");
while ($table = $tables->fetch_row()) {
    $tableName = $table[0];
    $createTable = $mysqli->query("SHOW CREATE TABLE `$tableName`")->fetch_assoc();
    fwrite($output, $createTable['Create Table'] . ";\n\n");
}

// 2. Exportar vistas
$vistas = [];
$views = $mysqli->query("
    SELECT TABLE_NAME, VIEW_DEFINITION 
    FROM INFORMATION_SCHEMA.VIEWS 
    WHERE TABLE_SCHEMA = '$database';
");

while ($view = $views->fetch_assoc()) {
    $vistas[] = [
        'name' => $view['TABLE_NAME'],
        'definition' => $view['VIEW_DEFINITION']
    ];
}

// Separar vistas no relacionadas y relacionadas
$noRelacionadas = [];
$relacionadas = [];

foreach ($vistas as $vista) {
    $esRelacionada = false;
    foreach ($vistas as $otraVista) {
        if ($vista['name'] !== $otraVista['name'] && strpos($vista['definition'], $otraVista['name']) !== false) {
            $esRelacionada = true;
            break;
        }
    }
    if ($esRelacionada) {
        $relacionadas[] = $vista;
    } else {
        $noRelacionadas[] = $vista;
    }
}

// Exportar vistas no relacionadas primero
foreach ($noRelacionadas as $vista) {
    $createView = $mysqli->query("SHOW CREATE VIEW `{$vista['name']}`")->fetch_assoc();
    fwrite($output, $createView['Create View'] . ";\n\n");
}

// Exportar vistas relacionadas después
foreach ($relacionadas as $vista) {
    $createView = $mysqli->query("SHOW CREATE VIEW `{$vista['name']}`")->fetch_assoc();
    fwrite($output, $createView['Create View'] . ";\n\n");
}

// 3. Exportar datos de las tablas
$tables->data_seek(0); // Resetear puntero para reutilizar el resultado
while ($table = $tables->fetch_row()) {
    $tableName = $table[0];
    $result = $mysqli->query("SELECT * FROM `$tableName`");
    while ($row = $result->fetch_assoc()) {
        $values = array_map(function ($value) use ($mysqli) {
            return isset($value) ? "'" . $mysqli->real_escape_string($value) . "'" : 'NULL';
        }, $row);
        fwrite($output, "INSERT INTO `$tableName` VALUES (" . implode(", ", $values) . ");\n");
    }
    fwrite($output, "\n");
}

// 4. Exportar procedimientos almacenados
fwrite($output, "DELIMITER //\n");
$procedures = $mysqli->query("
    SELECT ROUTINE_NAME 
    FROM INFORMATION_SCHEMA.ROUTINES 
    WHERE ROUTINE_SCHEMA = '$database' AND ROUTINE_TYPE = 'PROCEDURE';
");
while ($procedure = $procedures->fetch_assoc()) {
    $procedureName = $procedure['ROUTINE_NAME'];
    $createProcedure = $mysqli->query("SHOW CREATE PROCEDURE `$procedureName`")->fetch_assoc();
    fwrite($output, $createProcedure['Create Procedure'] . " //\n\n");
}
fwrite($output, "DELIMITER ;\n");

// Exportar funciones almacenadas
fwrite($output, "DELIMITER //\n");
$functions = $mysqli->query("
    SELECT ROUTINE_NAME 
    FROM INFORMATION_SCHEMA.ROUTINES 
    WHERE ROUTINE_SCHEMA = '$database' AND ROUTINE_TYPE = 'FUNCTION';
");
while ($function = $functions->fetch_assoc()) {
    $functionName = $function['ROUTINE_NAME'];
    $createFunction = $mysqli->query("SHOW CREATE FUNCTION `$functionName`")->fetch_assoc();
    fwrite($output, $createFunction['Create Function'] . " //\n\n");
}
fwrite($output, "DELIMITER ;\n");

// Exportar eventos
$events = $mysqli->query("
    SELECT EVENT_NAME 
    FROM INFORMATION_SCHEMA.EVENTS 
    WHERE EVENT_SCHEMA = '$database';
");
while ($event = $events->fetch_assoc()) {
    $eventName = $event['EVENT_NAME'];
    $createEvent = $mysqli->query("SHOW CREATE EVENT `$eventName`")->fetch_assoc();
    fwrite($output, $createEvent['Create Event'] . ";\n\n");
}

// Exportar relaciones de claves foráneas al final
$relations = $mysqli->query("
    SELECT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = '$database' AND REFERENCED_TABLE_NAME IS NOT NULL;
");
while ($relation = $relations->fetch_assoc()) {
    $tableName = $relation['TABLE_NAME'];
    $constraintName = $relation['CONSTRAINT_NAME'];
    $columnName = $relation['COLUMN_NAME'];
    $referencedTable = $relation['REFERENCED_TABLE_NAME'];
    $referencedColumn = $relation['REFERENCED_COLUMN_NAME'];

    // Verificar si la clave foránea ya existe
    $existingFK = $mysqli->query("
        SELECT CONSTRAINT_NAME
        FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
        WHERE CONSTRAINT_SCHEMA = '$database' 
          AND TABLE_NAME = '$tableName' 
          AND CONSTRAINT_NAME = '$constraintName';
    ")->num_rows;

    if ($existingFK == 0) {
        // Agregar clave foránea si no existe
        $fkQuery = sprintf(
            "ALTER TABLE `%s` ADD CONSTRAINT `%s` FOREIGN KEY (`%s`) REFERENCES `%s` (`%s`);",
            $tableName,
            $constraintName,
            $columnName,
            $referencedTable,
            $referencedColumn
        );
        fwrite($output, $fkQuery . "\n");
    }
}

fwrite($output, "SET FOREIGN_KEY_CHECKS = 1;\n");

// Cerrar la conexión
fclose($output);
$mysqli->close();
?>
