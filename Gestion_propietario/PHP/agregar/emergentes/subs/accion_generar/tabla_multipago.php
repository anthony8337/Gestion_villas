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


$sql = "SELECT * FROM cuenta_vista WHERE pagado = 'no pagado'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["concepto"],"</td>
        <td>",$row["codigo"],"</td>
        <td>",$row["costo"],"</td>
        <td>",$row["abono"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["hasta"],"</td>
        <td>",$row["costo"],"</td>
        </tr>
        ";
    }
}
else
{
    echo"No se encuentran datos";
}
?>