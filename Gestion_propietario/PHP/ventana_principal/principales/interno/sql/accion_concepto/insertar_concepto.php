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

$nombre_id =['txt_concepto','txt_valor_concepto'];

$txt_nombre = $_POST[$nombre_id[0]];
$txt_valor = $_POST[$nombre_id[1]];

$sql_existe = "SELECT * FROM concepto WHERE concepto='$txt_nombre' AND id_estado = '1';";
$result_existe = $conn->query($sql_existe);

if ($result_existe -> num_rows > 0) {
    echo"
    <script>
    window.alert('Ya existe un usuario con los mismos datos');
    </script>
    ";
}else{


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


$sql = "INSERT INTO concepto(concepto, tipo, valor, referencia, id_estado) 
VALUES ('$txt_nombre','$tipo_seleccionado','$txt_valor','$referencia','1')";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>
    window.alert('Concepto registrado con éxito');
    ingreso_concepto_r_cerrar();
    </script>";
}
else
{
    echo"No se encuentran datos";
}
}
?>