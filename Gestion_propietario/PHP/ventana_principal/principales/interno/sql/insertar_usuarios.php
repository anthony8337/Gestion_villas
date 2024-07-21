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

$nombre_id =['txt_usuario','txt_nombre','txt_dni','txt_tele','txt_correo','txt_clave','txt_tipo','txt_apellido'];

$txt_usuario = $_POST[$nombre_id[0]];
$txt_nombre = $_POST[$nombre_id[1]];
$txt_dni = $_POST[$nombre_id[2]];
$txt_tele = $_POST[$nombre_id[3]];
$txt_correo = $_POST[$nombre_id[4]];
$txt_clave = $_POST[$nombre_id[5]];
$txt_tipo = $_POST[$nombre_id[6]];
$txt_apellido = $_POST[$nombre_id[7]];

$valor;

$sql = "SELECT * FROM permisos WHERE acceso = '$txt_tipo'; ";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    
    while ($row = $result->fetch_assoc()) {
        $valor = $row["id_acceso"];
}
}
else
{
    echo"No se encuentran datos";
}


$sql = "INSERT INTO usuarios( nombre, apellido, dni, telefono, correo, id_acceso, clave, id_estado, usuario) 
VALUES ('$txt_nombre','$txt_apellido','$txt_dni','$txt_tele','$txt_correo','$valor','$txt_clave','1','$txt_usuario')";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Usuario registrado con exito');
    cerrar_usuario_in();
    buscar_estado();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>