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

$nombre_id =['txt_modelo_villa','id_modelo_villa'];


$txt_modelo = $_POST[$nombre_id[0]];
$txt_id = $_POST[$nombre_id[1]];


$sql = "UPDATE modelo_villa SET modelo='$txt_modelo' WHERE id_modelo='$txt_id'";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Modelo modificado con exito');
    cerrar_modelos_villa();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>