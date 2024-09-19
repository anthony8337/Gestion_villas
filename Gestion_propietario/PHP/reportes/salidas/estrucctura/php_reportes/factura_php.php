<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codigo_factura = $_POST['txt_cod_reim'];
    $nombre_factura = $_POST['txt_nombre_reim']; 
    $cod_villa_factura = $_POST['txt_villa_reim'];
    $fecha_factura = $_POST['txt_fecha_pago_reim'];
    $txt_tipa_reim = $_POST['txt_tipa_reim'];
    $txt_for_reim = $_POST['txt_for_reim'];
    $hh_contar_cuentas = $_POST['hh_contar_cuentas'];
    $txt_total_abono = $_POST['txt_total_abono'];
    $nombre_usuario = $_POST['nombre_usuario'];
    
}else
{
    $codigo_factura = "";
    $nombre_factura = ""; 
    $cod_villa_factura = "";
    $fecha_factura = "";
    $txt_tipa_reim = "";
    $txt_for_reim = "";
    $hh_contar_cuentas = "";
    $txt_total_abono = "";
    $nombre_usuario = "";
}





$servername ="localhost"; 
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

$sql = "SELECT * FROM factura_completa_reimprimir WHERE codigo_pago ='$codigo_factura';";
$result = $conn->query($sql);

$suma_abono_factura_multi = 0;

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc())
    {
        $concepto_2 = $row["concepto"];
    }
}
?>

