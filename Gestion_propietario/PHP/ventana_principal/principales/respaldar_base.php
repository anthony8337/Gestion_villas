<?php
// Configuración de conexión
$host = 'localhost'; // Cambia esto si es necesario
$user = 'root'; // Cambia esto si es necesario
$pass = ''; // Cambia esto si es necesario
$dbname = 'gestion_de_propietario'; // Cambia esto por tu nombre de base de datos

// Conectar a la base de datos
$conn = new mysqli($host, $user, $pass, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Consultar tablas
$tables = [];
$result = $conn->query("SHOW TABLES");
while ($row = $result->fetch_row()) {
    $tables[] = $row[0];
}

$output = '';

// Generar el SQL para cada tabla
foreach ($tables as $table) {
    $output .= "DROP TABLE IF EXISTS `$table`;\n";

    // Obtener la estructura de la tabla
    $result = $conn->query("SHOW CREATE TABLE `$table`");
    $row = $result->fetch_row();
    $output .= $row[1] . ";\n\n";

    // Obtener los datos de la tabla
    $result = $conn->query("SELECT * FROM `$table`");
    while ($row = $result->fetch_assoc()) {
        $output .= "INSERT INTO `$table` (`" . implode("`, `", array_keys($row)) . "`) VALUES ('" . implode("', '", array_map([$conn, 'real_escape_string'], array_values($row))) . "');\n";
    }
    $output .= "\n";
}

// Cerrar conexión
$conn->close();

// Crear un archivo .sql y descargarlo
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename="backup.sql"');
header('Content-Length: ' . strlen($output));
echo $output;
exit;
?>