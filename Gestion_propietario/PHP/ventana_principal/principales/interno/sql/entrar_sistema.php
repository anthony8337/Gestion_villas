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
        /*Acceso de los usuarios*/
        $reportes_im = $row["imprimir_reportes"];
        $modi_im = $row["modificar_reportes"];
        $eliminar_im = $row["eliminar_reportes"];



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
                var reporte = '".$reportes_im."';
                var modificar = '".$modi_im."';
                var eliminar = '".$eliminar_im."';
                

                sessionStorage.setItem('admin',admin);
                sessionStorage.setItem('usuario_n',usuario_n);
                sessionStorage.setItem('clave',clave);
                sessionStorage.setItem('reporte',reporte);
                sessionStorage.setItem('modificar',modificar);
                sessionStorage.setItem('eliminar',eliminar);
                

                window.location.href = 'usuario.php';
                </script>
                ";
            }
            else if ($acceso == "Usuario")
            {
                echo"
                <script>
                var usuario = 'abierto';
                var usuario_n = '".$clave."';
                var reporte = '".$reportes_im."';
                var modificar = '".$modi_im."';
                var eliminar = '".$eliminar_im."';

                sessionStorage.setItem('usuario',usuario);
                sessionStorage.setItem('reporte',reporte);
                sessionStorage.setItem('modificar',modificar);
                sessionStorage.setItem('eliminar',eliminar);
                

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

