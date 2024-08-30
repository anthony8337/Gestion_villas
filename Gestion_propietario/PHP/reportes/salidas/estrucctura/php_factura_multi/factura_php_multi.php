<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codigo_factura = $_POST['txt_cod_m'];
    $pripietario_factura = $_POST['txt_mn'];
    $villa_factura = $_POST['codigo_villa_multi'];
    $fecha_factura = $_POST['txt_fecha_m'];
    
}else
{
    $codigo_factura = "";
    $pripietario_factura = "";
    $villa_factura = "";
    $fecha_factura = "";
}
?>