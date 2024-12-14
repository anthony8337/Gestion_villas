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

$nn_id = $_POST['nn_id'];

$sql = "SELECT * FROM estado_cuenta  WHERE id_unir = '$nn_id' ORDER BY fecha_aplicada DESC";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    $total = 0;
    while ($row = $result->fetch_assoc()) {

        $total = $row["costo"] - $row["abono"] + $total;

        echo"
        <tr>
        <td></td>
        <td>",$row["fecha_aplicada"],"</td>
        <td>",$row["codigo"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["concepto_2"],"</td>
        <td>$. ",number_format($row["costo"],2),"</td>
        <td>$. ",number_format($row["abono"],2),"</td>
        <td>$. ",number_format($total,2),"</td>

        </tr>
        ";
    }

}
else
{
    echo"No se encuentran datos";
}
?>