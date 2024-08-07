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

if($selec_can == "Unico")
{

$id_pro = $_POST['id_propi_gc'];
$id_con = $_POST['id_con_gc'];

$co = $_POST['txt_total_gc'];
$costo = substr($co,3);

$abo = $_POST['txt_total_gc'];
$abono = substr($abo,3);

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
    echo"<script>
    confir_cuentas();
    actualizar_cod_cuenta($cod);
    </script>";
}
else
{
    echo"No se encuentran datos";
}
}
else
{
/*ingresa los valores cuando son un rango de propietarios*/

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


$id_pro = $_POST['id_propi_gc'];
$id_con = $_POST['id_con_gc'];

$co = $_POST['txt_total_gc'];
$costo = substr($co,3);

$abo = $_POST['txt_total_gc'];
$abono = substr($abo,3);

$desde = $_POST['txt_fecha_gc_desde'];
$hasta = $_POST['txt_fecha_gc_hasta'];

$elegir_abono = $_POST['sl_aportacion_gc'];



/*Insertar al rango */

/*cadenas*/

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $desde_v = $_POST['desde_propi'];
    list($letra_desde, $numero_desde) = explode('-', $desde_v, 2);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $hasta_v = $_POST['hasta_propi'];
    list($letra_hasta, $numero_hasta) = explode('-', $hasta_v, 2);
}

$sql2 = "SELECT * FROM `tomar_desde_hasta` WHERE (LEFT(villa, 1) > '$letra_desde' OR 
(LEFT(villa, 1) = '$letra_desde' AND CAST(SUBSTRING(villa, 3) AS UNSIGNED) >= $numero_desde)) AND 
(LEFT(villa, 1) < '$letra_hasta' OR (LEFT(villa, 1) = '$letra_hasta' AND CAST(SUBSTRING(villa, 3) AS UNSIGNED) <= $numero_hasta)); ";
$result2 = $conn->query($sql2);

if ($result2->num_rows > 0) {
    
while ($row = $result2->fetch_assoc()) 
{

    $id_elegidos = $row["id_unir"];

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
 ('$id_elegidos','$id_con','$costo','0','$desde','$hasta','No pagado','$cod')";
}
else
{
    $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo)  VALUES
 ('$id_elegidos','$id_con','0','$abono','$desde','$hasta','No pagado','$cod')";
}

$result = $conn->query($sql);
}

if($result == true)
{
    echo"<script>
    confir_cuentas();
    actualizar_cod_cuenta($cod);
    </script>";
}
else
{
    echo"No se encuentran datos";
}

}



}

?>

