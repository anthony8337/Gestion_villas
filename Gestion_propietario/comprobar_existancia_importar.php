<?php
// Verifica si la conexión tiene errores
if ($conn->connect_error) {
    die('Error de conexión (' . $conn->connect_errno . ') ' . $conn->connect_error);
}

// Ruta del archivo SQL
$archivo_sql = 'PHP/ventana_principal/bd/base_gestion_de_propietario.sql'; 

// Verifica si el archivo existe
if (!file_exists($archivo_sql)) {
    die("El archivo SQL no existe en la ruta especificada.");
}

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
        if ($conn->query($query) !== TRUE) {
            // Si hay un error, se marca como falso
            $errores = true;
            echo "Error al ejecutar la consulta: " . $conn->error . "<br>";
            echo "Consulta: " . htmlspecialchars($query) . "<br><br>";
        }
    }
}

// Mostrar el mensaje al final si no hubo errores
if (!$errores) {
    echo "<script>
            window.alert('Todas las consultas se ejecutaron correctamente');
          </script>";
} else {
    echo "<script>
            window.alert('Hubo errores durante la ejecución de las consultas');
          </script>";
}

?>
