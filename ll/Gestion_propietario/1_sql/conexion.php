<?php
// Detalles de la conexión a la base de datos
$servername = "localhost"; // Cambia esto si tu base de datos está en un servidor remoto
$username = "root";
$password = "";
$database = "gestion_pro_pg";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} 
else
{
echo "Conexion exitosa";
}

?>
