<?php
// Configuración de la base de datos
$host = 'localhost';
$user = 'root';
$password = '';
$database = 'gestion_de_propietario';

// Conectar a la base de datos
$mysqli = new mysqli($host, $user, $password, $database);

// Comprobar la conexión
if ($mysqli->connect_error) {
    die("Error de conexión: " . $mysqli->connect_error);
}

// Verificar si se ha subido un archivo
if ($_FILES['sql-file']['error'] !== UPLOAD_ERR_OK) {
    die("Error al subir el archivo: " . $_FILES['sql-file']['error']);
}

// Obtener el contenido del archivo SQL
$fileContent = file_get_contents($_FILES['sql-file']['tmp_name']);

// Separar las consultas SQL por el delimitador de la base de datos (normalmente ";")
$queries = explode(";", $fileContent);

// Desactivar las comprobaciones de claves foráneas durante la importación
$mysqli->query("SET FOREIGN_KEY_CHECKS = 0;");

// Ejecutar cada consulta SQL
foreach ($queries as $query) {
    $query = trim($query);  // Eliminar espacios en blanco al inicio y final de cada consulta
    if (!empty($query)) {
        if (!$mysqli->query($query)) {
            echo "Error al ejecutar la consulta: " . $mysqli->error;
            exit;
        }
    }
}

// Reactivar las comprobaciones de claves foráneas
$mysqli->query("SET FOREIGN_KEY_CHECKS = 1;");

echo "Base de datos importada con éxito";

// Cerrar la conexión
$mysqli->close();
?>
