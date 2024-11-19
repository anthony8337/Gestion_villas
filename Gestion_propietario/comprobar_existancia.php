<?php
$host = 'localhost'; // Dirección del servidor MySQL
$usuario = 'root';   // Usuario de MySQL
$contraseña = '';    // Contraseña del usuario
$base_datos = 'gestion_de_propietario'; // Nombre de la base de datos
$archivo_sql = 'bd/backup_gestion_de_propietario.sql'; // Ruta al archivo SQL

// Conexión al servidor MySQL
$conexion = new mysqli($host, $usuario, $contraseña);

// Verifica si la conexión fue exitosa
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Consulta para verificar si la base de datos existe
$consulta = "SHOW DATABASES LIKE '$base_datos'";
$resultado = $conexion->query($consulta);

if ($resultado->num_rows > 0) {
    // Seleccionar la base de datos existente
    if (!$conexion->select_db($base_datos)) {
        die("Error al seleccionar la base de datos: " . $conexion->error);
    }

    // Verificar si existen datos en la vista_usuario
    $sql = "SELECT * FROM vista_usuario";
    $result = $conexion->query($sql);

    if ($result->num_rows === 0) {
        echo "
        <script>
        abrir_bienvinida();
        </script>
        ";
    }
} else {
    echo "
    <script>
    abrir_bienvinida();
    </script>
    ";

    // Crear la base de datos si no existe
    $crear_bd = "CREATE DATABASE IF NOT EXISTS $base_datos";
    if (!$conexion->query($crear_bd)) {
        die("Error al crear la base de datos: " . $conexion->error);
    }

    // Seleccionar la base de datos recién creada
    if (!$conexion->select_db($base_datos)) {
        die("Error al seleccionar la base de datos: " . $conexion->error);
    }

    // Leer el contenido del archivo SQL
    $sql = file_get_contents($archivo_sql);
    if ($sql === false) {
        die("Error al leer el archivo SQL: $archivo_sql");
    }

    // Dividir las consultas basadas en el delimitador `;`
    $consultas = array_filter(explode(';', $sql));

    foreach ($consultas as $consulta) {
        $consulta = trim($consulta); // Eliminar espacios adicionales
        if (!empty($consulta)) { // Verificar que no esté vacía
            if (!$conexion->query($consulta)) {
                echo "Error al ejecutar la consulta: " . $conexion->error . "<br>";
                echo "Consulta fallida: <pre>$consulta</pre><br>";
                die();
            }
        }
    }

    echo "La base de datos se ha importado correctamente.";
}

// Cierra la conexión
$conexion->close();
?>
