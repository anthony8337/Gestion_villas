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

$nombre= $_POST["txt_usuario_l"];
$clave= $_POST["txt_clave_l"];

$sql = "SELECT id_usuario, nombre, dni, telefono, correo, acceso, clave, estado, usuario FROM vista_usuario WHERE usuario = '$nombre'";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    
    while ($row = $result->fetch_assoc()) {

        $valor = $row["usuario"];
        $clave1 = $row["clave"];
        $acceso = $row["acceso"];

        if ($valor == $nombre && $clave1 == $clave)
        {
            if ($acceso == "Administrador")
            {
                echo"
                <script>
                var admin = 'abierto';
                sessionStorage.setItem('admin',admin);
                window.location.href = 'usuario.php';
                </script>
                ";
            }
            else if ($acceso == "Usuario")
            {
                echo"
                <script>
                var usuario = 'abierto';
                sessionStorage.setItem('usuario',usuario);
                window.location.href = 'principal.php';
                </script>
                ";
            }
        }
        else
        {
            echo"
            <script>
            window.alert('Usuario y contraseña no coinciden, por favor verifica si son correctos');
            </script>
            ";
        }


}
}
else
{
    echo"
    <script>
    window.alert('Usuario y contraseña no coinciden, por favor verifica si son correctos');
    </script>
    ";
}


?>

