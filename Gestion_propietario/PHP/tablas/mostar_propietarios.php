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


$sql = "SELECT * FROM propietario_principal";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
   while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["villa"],"</td>
        <td>",$row["cont_eeh"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["dni"],"</td>
        <td>",$row["telefono"],"</td>
        <td>",$row["correo"],"</td>
        </tr>
        ";
    }
}
else
{
    echo"No se encuentran datos";
}
?>