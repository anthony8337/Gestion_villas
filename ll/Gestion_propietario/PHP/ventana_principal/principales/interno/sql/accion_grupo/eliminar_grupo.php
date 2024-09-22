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

$nombre_id =['txt_grupo_villa','id_grupo_villa'];


$txt_grupo = $_POST[$nombre_id[0]];
$txt_id = $_POST[$nombre_id[1]];


$sql = "UPDATE grupo_villa SET id_estado='2' WHERE id_grupo='$txt_id'";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Grupo eliminado con éxito');
    cerrar_grupo_villa();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>