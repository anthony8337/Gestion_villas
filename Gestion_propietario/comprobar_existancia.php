<?php
// Datos de la conexión a MySQL (sin seleccionar la base de datos aún)
$host = 'localhost'; // o la dirección del servidor MySQL
$usuario = 'root';
$contraseña = '';
$base_datos = 'gestion_de_propietario';

// Conexión a MySQL sin seleccionar la base de datos
$conexion = new mysqli($host, $usuario, $contraseña);

// Verifica si la conexión tiene errores
if ($conexion->connect_error) {
    die('Error de conexión (' . $conexion->connect_errno . ') ' . $conexion->connect_error);
}

// Verifica si la base de datos existe
$consulta_db = "SHOW DATABASES LIKE '$base_datos'";
$resultado = $conexion->query($consulta_db);

// Si la base de datos no existe, la crea
if ($resultado->num_rows == 0) {
    $crear_db = "CREATE DATABASE $base_datos";
    if ($conexion->query($crear_db) === TRUE) {
        echo "Base de datos '$base_datos' creada exitosamente.<br>";
    } else {
        die("Error al crear la base de datos: " . $conexion->error);
    }
}

// Ahora seleccionamos la base de datos para continuar con la ejecución
$conexion->select_db($base_datos);

// Ruta del archivo SQL
$archivo_sql = 'bd\base_gestion_de_propietario.sql'; 

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
