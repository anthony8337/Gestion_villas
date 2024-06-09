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

$sql1 = "SELECT * FROM cuentas ORDER BY id_cuenta DESC LIMIT 1;";
$result1 = $conn->query($sql1);
if($result1 -> num_rows > 0)
{
    while ($row = $result1->fetch_assoc()) 
    {
        $cod_ver = $row["codigo"];
    }
}

if($cod_ver == null)
{
    $cod_ver = "0000001";
}
else
{
    $cod_ver = $cod_ver + 1;
}

echo"
$cod_ver
";

?>