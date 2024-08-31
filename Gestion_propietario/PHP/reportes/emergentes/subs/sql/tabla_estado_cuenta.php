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

$id_pro_val = $_POST["id_pro_sc"];
$desde = $_POST["desde"];
$hasta = $_POST["hasta"];
$fecha_rumbo = $_POST["decidir"];

if($fecha_rumbo == "Historial completo")
{
    $sql = "SELECT * FROM cuenta_vista WHERE id_unir = '$id_pro_val';";
}
else
{
    $sql = "SELECT * FROM cuenta_vista WHERE desde BETWEEN '$desde' AND '$hasta'; ";
}




$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) {

        $total = $row["costo"] - $row["abono"];

        echo"
        <tr>
        <td></td>
        <td>",$row["desde"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["codigo"],"</td>
        <td>",$row["costo"],"</td>
        <td>",$row["abono"],"</td>
        <td>",$total,"</td>
        </tr>
        ";
    }

}
else
{
    echo"No se encuentran datos";
}
?>