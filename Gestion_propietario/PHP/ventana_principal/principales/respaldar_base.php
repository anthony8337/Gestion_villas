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

// Definir el nombre del archivo de respaldo
$outputFile = 'backup_gestion_de_propietario.sql';

// Abrir archivo en modo de escritura
$output = fopen('php://output', 'w');
if (!$output) {
    die("No se puede escribir en el archivo de salida.");
}

// Iniciar la transacción
fwrite($output, "SET FOREIGN_KEY_CHECKS = 0;\n");

// Verificar si existe la base de datos y eliminarla
fwrite($output, "DROP DATABASE IF EXISTS `$database`;\n");
fwrite($output, "CREATE DATABASE `$database`;\n");
fwrite($output, "USE `$database`;\n");

// Exportar tablas
$tables = $mysqli->query("SHOW FULL TABLES WHERE Table_type = 'BASE TABLE'");
while ($table = $tables->fetch_row()) {
    $tableName = $table[0];
    $createTable = $mysqli->query("SHOW CREATE TABLE `$tableName`")->fetch_assoc();
    fwrite($output, $createTable['Create Table'] . ";\n\n");

    // Exportar datos de la tabla
    $result = $mysqli->query("SELECT * FROM `$tableName`");
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $values = array_map(function ($value) use ($mysqli) {
                return isset($value) ? "'" . $mysqli->real_escape_string($value) . "'" : 'NULL';
            }, $row);
            fwrite($output, "INSERT INTO `$tableName` VALUES (" . implode(", ", $values) . ");\n");
        }
        fwrite($output, "\n");
    }
}

// Exportar vistas (respetando dependencias)
$viewDependencies = [];
$views = $mysqli->query("
    SELECT TABLE_NAME, VIEW_DEFINITION 
    FROM INFORMATION_SCHEMA.VIEWS 
    WHERE TABLE_SCHEMA = '$database';
");
while ($view = $views->fetch_assoc()) {
    $viewName = $view['TABLE_NAME'];
    $definition = $view['VIEW_DEFINITION'];

    // Buscar dependencias de otras vistas en la definición
    preg_match_all('/`([^`]+)`\.`([^`]+)`/', $definition, $matches);
    $dependencies = array_unique($matches[2]); // Extraer nombres de vistas relacionadas
    $viewDependencies[$viewName] = $dependencies;
}

// Ordenar vistas en función de dependencias
$sortedViews = [];
while (count($viewDependencies) > 0) {
    foreach ($viewDependencies as $viewName => $dependencies) {
        if (empty(array_intersect($dependencies, array_keys($viewDependencies)))) {
            $sortedViews[] = $viewName;
            unset($viewDependencies[$viewName]);
        }
    }
}

// Crear vistas en el orden correcto
foreach ($sortedViews as $viewName) {
    $createView = $mysqli->query("SHOW CREATE VIEW `$viewName`")->fetch_assoc();
    fwrite($output, $createView['Create View'] . ";\n\n");
}

// Agregar relaciones de claves foráneas al final
$relations = $mysqli->query("
    SELECT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE TABLE_SCHEMA = '$database' AND REFERENCED_TABLE_NAME IS NOT NULL;
");
while ($relation = $relations->fetch_assoc()) {
    // Verificar si la clave foránea ya existe
    $existingConstraints = $mysqli->query("
        SELECT CONSTRAINT_NAME 
        FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
        WHERE TABLE_SCHEMA = '$database' 
        AND TABLE_NAME = '{$relation['TABLE_NAME']}'
        AND CONSTRAINT_NAME = '{$relation['CONSTRAINT_NAME']}';
    ");
    if ($existingConstraints->num_rows == 0) {
        // Agregar la clave foránea si no existe
        $fkQuery = sprintf(
            "ALTER TABLE `%s` ADD CONSTRAINT `%s` FOREIGN KEY (`%s`) REFERENCES `%s` (`%s`);",
            $relation['TABLE_NAME'],
            $relation['CONSTRAINT_NAME'],
            $relation['COLUMN_NAME'],
            $relation['REFERENCED_TABLE_NAME'],
            $relation['REFERENCED_COLUMN_NAME']
        );
        fwrite($output, $fkQuery . "\n");
    }
}

fwrite($output, "SET FOREIGN_KEY_CHECKS = 1;\n");

// Cerrar la conexión
fclose($output);
$mysqli->close();

// Configurar las cabeceras para la descarga del archivo
header('Content-Type: application/sql');
header('Content-Disposition: attachment; filename="backup_gestion_de_propietario.sql"');
header('Pragma: no-cache');
header('Expires: 0');
?>
