<?php
// Configuración de la base de datos
$host = 'localhost';
$dbname = 'gestion_de_propietario';
$user = 'root';
$password = '';


try {
    // Conexión a la base de datos
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Iniciar la exportación
    $sql = "-- Exportación de la base de datos $dbname\n";
    $sql .= "SET FOREIGN_KEY_CHECKS=0;\n";  // Desactivar las restricciones de clave foránea
    $sql .= "DROP DATABASE IF EXISTS `$dbname`;\n";
    $sql .= "CREATE DATABASE `$dbname`;\n";
    $sql .= "USE `$dbname`;\n\n";

    // Obtener la lista de tablas y vistas
    $tablesAndViews = $pdo->query("SHOW FULL TABLES")->fetchAll(PDO::FETCH_ASSOC);

    $tables = [];
    $views = [];

    foreach ($tablesAndViews as $tableOrView) {
        $name = $tableOrView['Tables_in_' . $dbname];
        $type = $tableOrView['Table_type'];

        if ($type === 'BASE TABLE') {
            $tables[] = $name;
        } elseif ($type === 'VIEW') {
            $views[] = $name;
        }
    }

    // Crear tablas primero
    foreach ($tables as $table) {
        $createTableQuery = $pdo->query("SHOW CREATE TABLE `$table`")->fetch(PDO::FETCH_ASSOC);
        $createTableSQL = $createTableQuery['Create Table'] ?? null;

        if ($createTableSQL) {
            $sql .= $createTableSQL . ";\n\n";
        } else {
            echo "Error al obtener la estructura de la tabla $table\n";
        }
    }

    // Crear vistas después de las tablas
    foreach ($views as $view) {
        $createViewQuery = $pdo->query("SHOW CREATE VIEW `$view`")->fetch(PDO::FETCH_ASSOC);
        $createViewSQL = $createViewQuery['Create View'] ?? null;

        if ($createViewSQL) {
            $sql .= $createViewSQL . ";\n\n";
        } else {
            echo "Error al obtener la estructura de la vista $view\n";
        }
    }

    // Exportar los datos de las tablas
    foreach ($tables as $table) {
        $rows = $pdo->query("SELECT * FROM `$table`")->fetchAll(PDO::FETCH_ASSOC);
        foreach ($rows as $row) {
            $columns = array_keys($row);
            $values = array_map(function($value) use ($pdo) {
                return $pdo->quote($value); // Escapar los valores adecuadamente
            }, array_values($row));

            // Formatear columnas y valores para la sentencia INSERT
            $columnsList = "`" . implode("`, `", $columns) . "`";
            $valuesList = implode(", ", $values);

            // Crear la sentencia INSERT
            $sql .= "INSERT INTO `$table` ($columnsList) VALUES ($valuesList);\n";
        }
        $sql .= "\n";
    }

    // Reactivar las restricciones de clave foránea
    $sql .= "SET FOREIGN_KEY_CHECKS=1;\n";

    // Guardar la exportación en un archivo .sql
   
        // Especificar la ruta donde se guardará el archivo
        $directory = 'backups';  // Cambia esto a la ruta deseada
        if (!is_dir($directory)) {
            mkdir($directory, 0777, true); // Crea el directorio si no existe
        }
        $filename = $directory . '/backup_' . $dbname . '_' . date('Ymd_His') . '.sql';

    file_put_contents($filename, $sql);

    echo "Exportación completada con éxito. Archivo generado: $filename";

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
