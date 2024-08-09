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

$nombre_id =['txt_grupo_villa'];

$txt_grupo = $_POST[$nombre_id[0]];


$sql = "INSERT INTO grupo_villa(grupo, id_estado) VALUES 
('$txt_grupo','1')";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Grupo registrado con éxito');
    cerrar_grupo_villa();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>