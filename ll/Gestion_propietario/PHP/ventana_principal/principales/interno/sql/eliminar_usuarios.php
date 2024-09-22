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

$txt_id = $_POST["txt_id"];

$sql = " UPDATE usuarios SET id_estado='2' WHERE id_usuario='$txt_id'";

$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('El usuario fue suspendido con exíto');
    cerrar_usuario_in();
    buscar_estado();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>