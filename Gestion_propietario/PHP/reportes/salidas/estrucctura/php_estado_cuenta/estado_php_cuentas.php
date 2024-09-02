<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $rango_cuota = $_POST['rango_cuota'];
    $ranco_factura = $_POST['ranco_factura'];
    $desde = $_POST['desde_estado'];
    $hasta = $_POST['hasta_estado'];
    $fecha_estado_hoy =  $_POST['fecha_estado_hoy'];
    $txt_cod_estados = $_POST['txt_cod_estados'];
    $txt_propi_estados = $_POST['txt_propi_estados'];
    $id_pro_sc = $_POST['id_pro_sc'];
}else
{
    $rango_cuota = "";
    $ranco_factura ="";
    $desde = "";
    $hasta = "";
    $fecha_estado_hoy = "";
    $txt_cod_estados = "";
    $txt_propi_estados = "";
    $id_pro_sc = "";
}

if($ranco_factura == "Historial completo")
{
$desde_hasta = "";
}else
{
    $desde_hasta = "Desde ".$desde." al ".$hasta."";
}

?>

