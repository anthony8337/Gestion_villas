<?php

$servername = "localhost"; 
$username = "root";
$password = "";
$database = "gestion_de_propietario";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} 
else
{
}

$cod_ver;

// Ejecutar la consulta para obtener el último código
$sql1 = "SELECT * FROM cuentas ORDER BY id_cuenta DESC LIMIT 1;";
$result1 = $conn->query($sql1);

// Verificar si hay resultados
if($result1->num_rows > 0) {
    $row = $result1->fetch_assoc();
    $cod_ver = $row["codigo"] + 1;
}else
{
    $cod_ver = "1000000";
}

// Mostrar el valor de $cod_ver
echo $cod_ver;

?>