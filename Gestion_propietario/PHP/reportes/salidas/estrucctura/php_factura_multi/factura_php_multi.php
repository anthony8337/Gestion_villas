<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $codigo_factura = $_POST['txt_cod_m'];
    $pripietario_factura = $_POST['txt_mn'];
    $villa_factura = $_POST['codigo_villa_multi'];
    $fecha_factura = $_POST['txt_fecha_m'];
    $hd_grupo = $_POST['hd_grupo'];
    $total_multi = $_POST['total_multi'];
    $devo_multi = $_POST['devo_multi'];
    $nombre_usuario = $_POST['nombre_usuario'];
    $can_multi = $_POST['can_multi'];

   
    
}else
{
    $codigo_factura = "";
    $pripietario_factura = "";
    $villa_factura = "";
    $fecha_factura = "";
    $hd_grupo = "";
    $total_multi = "";
    $devo_multi = "";
    $nombre_usuario = "";
    $can_multi = $_POST['can_multi'];
}


$valor_sobrante = floatval(str_replace('$. ', '', $devo_multi));

if($devo_multi < 0)
{
    $cofir_pago = "Pago parcial realizado";
}
else
{
    $cofir_pago = "Pago completo realizado";
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