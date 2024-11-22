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

$txt_cuenta_modi = $_POST["txt_cuenta_modi"];

$sql_2 = "DELETE FROM cuenta_estado WHERE id_cuenta = '$txt_cuenta_modi'";
$result_2 = $conn->query($sql_2);

$sql = "DELETE FROM cuentas WHERE id_cuenta = '$txt_cuenta_modi'";
$result = $conn->query($sql);

if($result == true)
{
    echo"
    <script>
    window.alert('Cuenta eliminada con éxito.');
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

