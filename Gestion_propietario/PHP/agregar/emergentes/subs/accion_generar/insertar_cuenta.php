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

$id_pro = $_POST['id_propi_gc'];
$id_con = $_POST['id_con_gc'];
$costo = $_POST['txt_costo_gc'];
$abono = $_POST['txt_costo_gc'];
$desde = $_POST['txt_fecha_gc_desde'];
$hasta = $_POST['txt_fecha_gc_hasta'];

$elegir_abono = $_POST['sl_aportacion_gc'];


if($elegir_abono == "Monto")
{
    $sql = "INSERT INTO cuentas(id_propietario, id_concepto, costo, abono, desde, hasta, pagado, codigo) VALUES
 ('$id_pro','$id_con','$costo','0','$desde','$hasta','No pagado','1')";
}
else
{
    $sql = "INSERT INTO cuentas(id_propietario, id_concepto, costo, abono, desde, hasta, pagado, codigo) VALUES
 ('$id_pro','$id_con','0','$abono','$desde','$hasta','No pagado','1')";
}




$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Cuenta registrada con exito');
    </script>";


}
else
{
    echo"No se encuentran datos";
}

?>