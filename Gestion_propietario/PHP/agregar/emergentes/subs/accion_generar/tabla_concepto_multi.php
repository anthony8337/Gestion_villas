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

$sql = "SELECT * FROM concepto WHERE id_estado = '1' and tipo = 'Cargo'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td class='interno'>",$row["id_concepto"],"</td>
        <td>",$row["concepto"],"</td>
        </tr>
        ";
    }
}
else
{
    echo"No se encuentran datos";
}
?>