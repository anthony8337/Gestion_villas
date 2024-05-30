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

$nombre_id =['txt_usuario','txt_nombre','txt_dni','txt_tele','txt_correo','txt_clave','txt_tipo','txt_estado','txt_id'];



$txt_usuario = $_POST[$nombre_id[0]];
$txt_nombre = $_POST[$nombre_id[1]];
$txt_dni = $_POST[$nombre_id[2]];
$txt_tele = $_POST[$nombre_id[3]];
$txt_correo = $_POST[$nombre_id[4]];
$txt_clave = $_POST[$nombre_id[5]];
$txt_tipo = $_POST[$nombre_id[6]];
$txt_id = $_POST[$nombre_id[8]];
$txt_estado = $_POST[$nombre_id[7]];

$valor;
$valor_estado;

$sql = "SELECT * FROM estado_usuario WHERE estado = '$txt_estado';";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    
    while ($row = $result->fetch_assoc()) {
        $valor_estado = $row["id_estado"];
}
}
else
{
    echo"No se encuentran datos";
}

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


$sql = "
UPDATE usuarios SET nombre='$txt_nombre',
dni='$txt_dni',telefono='$txt_tele',correo='$txt_correo',
id_acceso='$valor',clave='$txt_clave',`id_estado`='$valor_estado',
usuario='$txt_usuario' WHERE id_usuario='$txt_id'
";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Usuario modificado con exito');
    cerrar_usuario_in();
    buscar_estado();
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>