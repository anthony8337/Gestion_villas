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

$sql = "SELECT * FROM vista_usuario WHERE usuario = '$nombre'";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    
    while ($row = $result->fetch_assoc()) {

        $valor = $row["usuario"];
        $clave1 = $row["clave"];
        $acceso = $row["acceso"];
        $estado = $row["estado"];

        if ($estado == "Activo") {
        
            if ($valor == $nombre && $clave1 == $clave)
        {
            if ($acceso == "Administrador")
            {
                echo"
                <script>
                var admin = 'abierto';
                var usuario_n = '".$valor."'
                var clave = '".$clave1."'

                sessionStorage.setItem('admin',admin);
                sessionStorage.setItem('usuario_n',usuario_n);
                sessionStorage.setItem('clave',clave);

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

