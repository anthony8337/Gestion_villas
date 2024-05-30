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


$sql = "INSERT INTO modelo_villa(modelo, id_estado) VALUES 
('$txt_modelo','1')";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Grupo registrado con exito');
    cerrar_modelos_villa();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>