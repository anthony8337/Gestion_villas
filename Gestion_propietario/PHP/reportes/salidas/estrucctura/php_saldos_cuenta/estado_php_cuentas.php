<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fecha_hoy = $_POST["fecha_saldo"];
    $concep_saldo = $_POST["concep_saldo"];
$hasta_repo_saldo = $_POST["hasta_repo_saldo"];
$desde_repo_saldo = $_POST["desde_repo_saldo"];
$fecha_saldo_actual = $_POST["fecha_saldo_actual"];
}else
{
    $fecha_hoy = "";
    $concep_saldo = "";
$hasta_repo_saldo = "";
$desde_repo_saldo = "";
$fecha_saldo_actual = "";
}
?>

