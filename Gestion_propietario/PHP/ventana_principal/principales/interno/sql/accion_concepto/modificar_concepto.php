<?php

error_reporting(0); // Desactiva todos los reportes de errores
ini_set('display_errors', 0); // Evita mostrar errores en la salida

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

$nombre_id =['txt_concepto','txt_valor_concepto','id_concepto'];

$txt_nombre = $_POST[$nombre_id[0]];
$txt_valor = $_POST[$nombre_id[1]];
$id_concepto = $_POST[$nombre_id[2]];


if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (isset($_POST['opcion_concepto'])) {
        $tipo_seleccionado = htmlspecialchars($_POST['opcion_concepto']);
    }
}

$referencia;

if($tipo_seleccionado == "Abono")
{
    $referencia = "No";
}
else
{
    $referencia = "Si";
    $txt_valor = "0";
}


$sql = "UPDATE concepto SET concepto='$txt_nombre',tipo='$tipo_seleccionado',valor='$txt_valor',referencia='$referencia' WHERE id_concepto='$id_concepto'";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>
    window.alert('Registro modificado con éxito');
    ingreso_concepto_r_cerrar();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>