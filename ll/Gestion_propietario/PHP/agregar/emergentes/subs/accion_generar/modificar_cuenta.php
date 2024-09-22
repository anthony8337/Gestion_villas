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



$selec_can = $_POST['sl_pro_gc'];


$id_pro = $_POST['id_propi_gc'];
$id_con = $_POST['id_con_gc'];

$co = $_POST['txt_total_gc'];
$costo = substr($co,3);

$abo = $_POST['txt_total_gc'];
$abono = substr($abo,3);

$desde = $_POST['txt_fecha_gc_desde'];
$hasta = $_POST['txt_fecha_gc_hasta'];

$desde_propi = $_POST['desde_propi'];
$hasta_propi = $_POST['hasta_propi'];

$elegir_abono = $_POST['sl_aportacion_gc'];

$id_concepto_abono = $_POST['id_concepto_abono'];

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

$txt_cuenta_modi = $_POST["txt_cuenta_modi"];

if($elegir_abono == "Monto")
{
    $sql = "UPDATE cuentas SET id_unir='$id_pro',
    id_concepto='$id_concepto_abono',costo='$costo',
    abono='0',desde='$desde',hasta='$hasta',
    pagado='No pagado',id_concepto_2='$id_con' WHERE id_cuenta = '$txt_cuenta_modi'";
}
else if($elegir_abono == "Abonar")
{
    $sql = "UPDATE cuentas SET id_unir='$id_pro',
    id_concepto='$id_concepto_abono',costo='0',
    abono='$costo',desde='$desde',hasta='$hasta',
    pagado='No pagado',id_concepto_2='$id_con' WHERE id_cuenta = '$txt_cuenta_modi'";
}

$result = $conn->query($sql);

if($result == true)
{
    echo"
    <script>
    window.alert('Cuenta modificada con éxito.');
    cerrar_crear_cuenta();
    </script>
    ";
}
else
{
    echo"
    <script>
    window.alert('No se pudo realizar la operación",$conn->error,".');
    </script>
    ";
}

?>

