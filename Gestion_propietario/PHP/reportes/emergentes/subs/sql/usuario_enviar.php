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

$sl_usuarios = $_POST['sl_usuarios'];

$sql = "SELECT concat(nombre,' ',apellido) as nombre, telefono, correo FROM usuarios WHERE nombre = '$sl_usuarios'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    $row = $result->fetch_assoc();

    $telefono = $row["telefono"];
    $correo = $row["correo"];

}


?>

<script>

document.getElementById('num_usuarios_villa').value = "<?php echo"$telefono"; ?>";
document.getElementById('co_usuarios_villa').value ="<?php  echo"$correo"; ?>";

document.getElementById('nu_usuario_selec').value ="<?php  echo"$telefono"; ?>";
document.getElementById('co_usuario_selec').value ="<?php  echo"$correo"; ?>";

</script>

