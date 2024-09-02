<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {
$desde_reportes_villas = $_POST["desde_reportes_villas"];
$hasta_reportes_villas = $_POST["hasta_reportes_villas"];
$estado_villa = $_POST["estado_villa"];
$modelo_villa = $_POST["modelo_villa"];
$dt_villas = $_POST["dt_villas"];
}
else
{
    $desde_reportes_villas = "";
    $hasta_reportes_villas = "";
    $estado_villa = "";
    $modelo_villa = "";
    $dt_villas = "";
}

?>