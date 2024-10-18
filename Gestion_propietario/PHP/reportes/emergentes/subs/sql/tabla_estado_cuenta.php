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
$selector = $_POST["selector"];
$todo_cuota = $_POST["todo_cuota"];



if ($todo_cuota == "Historial completo" && $fecha_rumbo == "Historial completo") 
{
    $sql = "SELECT * FROM estado_cuenta  WHERE id_unir = '$id_pro_val'";

}
else if ($todo_cuota != "Historial completo" && $fecha_rumbo == "Historial completo") 
{
    $sql = "SELECT * FROM estado_cuenta  WHERE id_unir = '$id_pro_val' AND concepto = '$selector';";

}
else if ($todo_cuota == "Historial completo" && $fecha_rumbo != "Historial completo") 
{

    $sql = "SELECT * FROM estado_cuenta  WHERE id_unir = '$id_pro_val' AND fecha_aplicada BETWEEN '$desde' AND '$hasta';";
}
else if ($todo_cuota != "Historial completo" && $fecha_rumbo != "Historial completo") 
{

    $sql = "SELECT * FROM estado_cuenta  WHERE id_unir = '$id_pro_val' AND concepto = '$selector' AND fecha_aplicada BETWEEN '$desde' AND '$hasta';";
}


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

