<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codigo_factura = $_POST['txt_cod_reim'];
    $nombre_factura = $_POST['txt_nombre_reim']; 
    $cod_villa_factura = $_POST['txt_villa_reim'];
    $fecha_factura = $_POST['txt_fecha_pago_reim'];
    $txt_tipa_reim = $_POST['txt_tipa_reim'];
    $txt_for_reim = $_POST['txt_for_reim'];
    
}else
{
    $codigo_factura = "";
    $nombre_factura = ""; 
    $cod_villa_factura = "";
    $fecha_factura = "";
    $txt_tipa_reim = "";
    $txt_for_reim = "";
}
?>