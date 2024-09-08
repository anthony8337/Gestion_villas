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



if($ranco_factura == "Historial completo")
{
    $sql = "SELECT * FROM cuenta_vista WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota';";
    $sql2 = "SELECT COUNT(*) AS cantidad_registro FROM cuenta_vista WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota'; ";
}
else
{
    $sql = "SELECT * FROM cuenta_vista WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota' and desde BETWEEN '$desde' AND '$hasta'; ";
    $sql2 = "SELECT COUNT(*) AS cantidad_registro FROM cuenta_vista 
    WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota' and desde BETWEEN '$desde' AND '$hasta';";

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
        
        <td>",$row["desde"],"</td>
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