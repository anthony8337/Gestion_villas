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



if($ranco_factura == "Historial completo" && $todo_cuota == "Historial completo")
{
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' ORDER BY codigo ASC, costo DESC, fecha_aplicada ASC";
    $sql2 = "SELECT COUNT(*) AS cantidad_registro FROM estado_cuenta WHERE id_unir = '$id_pro_sc'; ";
}
else if($ranco_factura == "Historial completo" && $todo_cuota != "Historial completo")
{
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota' ORDER BY codigo ASC, costo DESC, fecha_aplicada ASC;";
    $sql2 = "SELECT COUNT(*) AS cantidad_registro FROM estado_cuenta WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota'; ";
}
else if($ranco_factura != "Historial completo" && $todo_cuota == "Historial completo")
{
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' and fecha_aplicada BETWEEN '$desde' AND '$hasta' ORDER BY codigo ASC, costo DESC, fecha_aplicada ASC; ";
    $sql2 = "SELECT COUNT(*) AS cantidad_registro FROM estado_cuenta 
    WHERE id_unir = '$id_pro_sc' and fecha_aplicada BETWEEN '$desde' AND '$hasta';";
}
else if($ranco_factura != "Historial completo" && $todo_cuota != "Historial completo")
{
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota' and fecha_aplicada BETWEEN '$desde' AND '$hasta' ORDER BY codigo ASC, costo DESC, fecha_aplicada ASC; ";
    $sql2 = "SELECT COUNT(*) AS cantidad_registro FROM estado_cuenta 
    WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota' and fecha_aplicada BETWEEN '$desde' AND '$hasta';";
}
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    $total = 0;
    

    while ($row = $result->fetch_assoc()) {

        $total = $row["costo"] - $row["abono"] + $total;

        $t_total = number_format($total,2);

        echo"
        <tr>
        
        <td>",$row["fecha_aplicada"],"</td>
        <td>",$row["codigo"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["concepto_2"],"</td>
        
        <td>$. ",number_format($row["costo"],2),"</td>
        <td>$. ",number_format($row["abono"],2),"</td>
        <td>$. ",$t_total,"</td>
        </tr>
        ";
    }

}
else
{
    echo"No se encuentran datos";
}

$result2 = $conn->query($sql2);
if($result2 -> num_rows > 0)
{
    while ($row = $result2->fetch_assoc()) 
    {
        $cantiddes = $row["cantidad_registro"];
    }
}

?>