<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {
$fecha_hoy = $_POST["fecha_saldo"];
$hasta_repo_saldo = $_POST["hasta_repo_saldo"];
$desde_repo_saldo = $_POST["desde_repo_saldo"];
$fecha_saldo_actual = $_POST["fecha_saldo_actual"];
$concep_metodo = $_POST["concep_metodo"];
$concep_saldo = $_POST["concep_saldo"];
$nombre_usuario = $_POST['nombre_usuario'];

if ($concep_metodo == "Concepto completo") {
    $a = "Concepto completo";
}else
{
    $a = "$concep_saldo";
}



}else
{
$fecha_hoy = "";
$concep_saldo = "";
$hasta_repo_saldo = "";
$desde_repo_saldo = "";
$fecha_saldo_actual = "";
$concep_metodo = "";
$nombre_usuario = "";
}




?>