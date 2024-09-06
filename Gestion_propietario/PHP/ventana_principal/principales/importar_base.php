<?php
// Datos de la conexión a MySQL (sin seleccionar la base de datos aún)
$host = 'localhost'; // o la dirección del servidor MySQL
$usuario = 'root';
$contraseña = '';
$base_datos = 'gestion_de_propietario';

// Conexión a MySQL
$conexion = new mysqli($host, $usuario, $contraseña, $base_datos);

// Verifica si la conexión tiene errores
if ($conexion->connect_error) {
    die('Error de conexión (' . $conexion->connect_errno . ') ' . $conexion->connect_error);
}

// Ruta del archivo SQL
$archivo_sql = 'C:\Backups_gestion_propietario\backup_gestion_de_propietario.sql'; 

// Lee el contenido del archivo SQL
$queries = file_get_contents($archivo_sql);

// Divide el archivo SQL en múltiples consultas
$sql_array = explode(';', $queries);

// Variable para controlar si todas las consultas se ejecutaron correctamente
$errores = false;

// Ejecuta cada consulta
foreach ($sql_array as $query) {
    $query = trim($query);
    if (!empty($query)) {
        if ($conexion->query($query) !== TRUE) {
            // Si hay un error, se marca como falso
            $errores = true;
            echo "Error al ejecutar la consulta: " . $conexion->error . "<br>";
        }
    }
}

// Mostrar el mensaje al final si no hubo errores
if (!$errores) {
    echo "<script>
            window.alert('Todas las consultas se ejecutaron correctamente');
          </script>";
}

?>
