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

$concep_metodo  = $_POST["concep_metodo"];

if($concep_metodo == "Concepto especifico")
{
    $sql = "SELECT 

    villa AS villa,
    nombre AS nombre,
    SUM(costo) AS costo_total,
    SUM(abono) AS abono_total,
    SUM((costo - abono)) AS saldo_total

FROM estado_cuenta WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    concepto = '$concep_saldo' 
    AND
(SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED))) 
GROUP BY 
    villa,
    nombre
ORDER BY SUBSTRING_INDEX(villa, '-', 1), 
CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";
}
else
{


    $sql = "SELECT 

    villa AS villa,
    nombre AS nombre,
    SUM(costo) AS costo_total,
    SUM(abono) AS abono_total,
    SUM((costo - abono)) AS saldo_total

FROM estado_cuenta WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    
(SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED))) 
GROUP BY 
    villa,
    nombre
ORDER BY SUBSTRING_INDEX(villa, '-', 1), 
CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";



}

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    $total_creedito = 0;
    while ($row = $result->fetch_assoc()) {

        if(number_format($row["saldo_total"],2) >= 0)
        {
            $total_creedito += $row["saldo_total"];
        }

    }

    echo "$. ",number_format($total_creedito,2);

}
else
{
    echo"No se encuentran datos";
}
?>

