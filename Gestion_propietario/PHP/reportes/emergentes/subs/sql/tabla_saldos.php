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

$concep_saldo = $_POST["concep_saldo"];
$hasta_repo_saldo = $_POST["hasta_repo_saldo"];
$desde_repo_saldo = $_POST["desde_repo_saldo"];
$fecha_saldo_actual = $_POST["fecha_saldo_actual"];


$sql = "SELECT 
    cuenta_vista.concepto AS concepto,
    cuenta_vista.villa AS villa,
    cuenta_vista.nombre AS nombre,
    SUM(cuenta_vista.costo) AS costo_total,
    SUM(cuenta_vista.abono) AS abono_total,
    SUM((cuenta_vista.costo - cuenta_vista.abono)) AS saldo_total
FROM 
    cuenta_vista
WHERE 
    cuenta_vista.desde BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    cuenta_vista.concepto = '$concep_saldo' AND 
    cuenta_vista.villa BETWEEN '$desde_repo_saldo' AND '$hasta_repo_saldo'
GROUP BY 
    cuenta_vista.concepto,
    cuenta_vista.villa,
    cuenta_vista.nombre
ORDER BY 
    SUBSTRING_INDEX(cuenta_vista.villa, '-', 1),
    CAST(SUBSTRING_INDEX(cuenta_vista.villa, '-', -1) AS UNSIGNED);";


$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    $total = 0;

    while ($row = $result->fetch_assoc()) {

        if(number_format($row["saldo_total"],2) < 0)
        {
            echo"
            <tr>
            <td></td>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            <td>$. 0.00</td>
            </tr>
            ";
        }
        else
        {
            echo"
            <tr>
            <td></td>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td>$. 0.00</td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            </tr>
            ";
        }


    }

}
else
{
    echo"No se encuentran datos";
}
?>

<script>
total_credito();
total_pago();
</script>