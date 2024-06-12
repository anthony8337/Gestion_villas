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

$cod;

$sql1 = "SELECT * FROM cuentas ORDER BY id_cuenta DESC LIMIT 1;";
$result1 = $conn->query($sql1);
if($result1->num_rows > 0) {
    $row = $result1->fetch_assoc();
    $cod = $row["codigo"] + 1;
}else
{
    $cod = "1000000";
}



if($elegir_abono == "Monto")
{
    $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo) VALUES
 ('$id_pro','$id_con','$costo','0','$desde','$hasta','No pagado','$cod')";
}
else
{
    $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo)  VALUES
 ('$id_pro','$id_con','0','$abono','$desde','$hasta','No pagado','$cod')";
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