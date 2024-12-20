<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {
$villa_aper = $_POST["villa_aper"];
$pro_aper = $_POST["pro_aper"];
$id_unir_aper = $_POST['id_unir_aper'];
$nombre_usuario = $_POST["nombre_usuario"];
}
else
{
    $villa_aper = "";
    $pro_aper = "";
    $id_unir_aper = "";
    $nombre_usuario = "";
}

?>