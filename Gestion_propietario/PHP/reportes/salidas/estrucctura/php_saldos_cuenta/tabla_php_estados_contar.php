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

if($concep_metodo == "Concepto especifico")
{

$sql2 = "
SELECT COUNT(*) AS total_registros
FROM (
    SELECT 
        villa AS villa,
        nombre AS nombre,
        SUM(costo) AS costo_total,
        SUM(abono) AS abono_total,
        SUM((costo - abono)) AS saldo_total
    FROM estado_cuenta
    WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' 
        AND concepto = '$concep_saldo' 
        AND (SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
            OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
                AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
        AND (SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
            OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
                AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED)))
    GROUP BY villa, nombre
) AS subconsulta;

";
}
else
{
$sql2 = "
SELECT COUNT(*) AS total_registros
FROM (
    SELECT 
        villa AS villa,
        nombre AS nombre,
        SUM(costo) AS costo_total,
        SUM(abono) AS abono_total,
        SUM((costo - abono)) AS saldo_total
    FROM estado_cuenta
    WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual'
        AND (SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
            OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
                AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
        AND (SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
            OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
                AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED)))
    GROUP BY villa, nombre
    ORDER BY SUBSTRING_INDEX(villa, '-', 1), CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED)
) AS subconsulta;

";
}

$result2 = $conn->query($sql2);

if($result2 -> num_rows > 0)
{

    $row = $result2->fetch_assoc();

    $contar_registros_verdad = $row["total_registros"];
}


?>