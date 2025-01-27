<?php
$host = "localhost";
$user = "root";
$password = "";
$db_name = "gestion_de_propietario";

// Verificar si se envió el archivo
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['sql-file'])) {
    $file_tmp = $_FILES['sql-file']['tmp_name'];

    if (!is_uploaded_file($file_tmp)) {
        http_response_code(400);
        die("Error al cargar el archivo.");
    }

    // Leer el archivo SQL
    $sql_content = file_get_contents($file_tmp);
    if (!$sql_content) {
        http_response_code(400);
        die("No se pudo leer el archivo SQL.");
    }

    // Conectar a la base de datos
    $connection = new mysqli($host, $user, $password, $db_name);
    if ($connection->connect_error) {
        http_response_code(500);
        die("Error de conexión: " . $connection->connect_error);
    }

    // Habilitar el programador de eventos
    if (!$connection->query("SET GLOBAL event_scheduler = ON;")) {
        http_response_code(500);
        die("Error al habilitar el programador de eventos: " . $connection->error);
    }

    // Procesar el archivo SQL
    $delimiter = ";";
    $queries = [];
    $buffer = "";

    foreach (explode("\n", $sql_content) as $line) {
        $trimmedLine = trim($line);

        if (stripos($trimmedLine, "DELIMITER") === 0) {
            $delimiter = substr($trimmedLine, 9);
            continue;
        }

        $buffer .= $line . "\n";
        if (substr(rtrim($line), -strlen($delimiter)) === $delimiter) {
            $queries[] = substr($buffer, 0, -strlen($delimiter));
            $buffer = "";
        }
    }

    // Ejecutar cada bloque SQL
    foreach ($queries as $query) {
        $query = trim($query);
        if (!empty($query)) {
            if (!$connection->multi_query($query)) {
                echo "Error en la consulta: " . $connection->error . "\n";
                echo "Consulta fallida: " . substr($query, 0, 100) . "\n";
            }

            // Liberar resultados si existen
            while ($connection->more_results() && $connection->next_result()) { }
        }
    }

    $sql_1 = "CREATE EVENT Rutina_cuentas ON SCHEDULE EVERY 1 MONTH STARTS '2025-02-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL ejecutar_cuentas()";
$result = $connection ->query($sql_1);

    echo "Archivo SQL importado correctamente.";
    $connection->close();
} else {
    http_response_code(400);
    echo "Por favor, carga un archivo .sql.";
}




?>
