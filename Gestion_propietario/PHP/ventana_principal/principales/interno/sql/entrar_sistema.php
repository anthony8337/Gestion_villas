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

$nombre= $_POST["txt_nom_usuario"];
$contra= $_POST["txt_cla_usuario"];

$sql = "SELECT * FROM vista_usuario WHERE usuario = '$nombre'";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) 
    {

        $usuario = $row["usuario"];
        $clave = $row["clave"];
        $acceso = $row["acceso"];
        $estado = $row["estado"];

        /*Acceso de los usuarios*/
        $reportes_im = $row["imprimir_reportes"];
        $modi_im = $row["modificar_reportes"];
        $eliminar_im = $row["eliminar_reportes"];

        if ($estado == "Activo") 
        {

            if ($nombre == $usuario && $contra == $clave) 
            {
                echo"
                <script>
var usuario = '".$usuario."';
var clave = '".$clave."';
var acceso = '".$acceso."';
var reportes_im = '".$reportes_im."';
var modi_im = '".$modi_im."';
var eliminar_im = '".$eliminar_im."';

sessionStorage.setItem('usuario',usuario);
sessionStorage.setItem('clave',clave);
sessionStorage.setItem('acceso',acceso);
sessionStorage.setItem('reportes_im',reportes_im);
sessionStorage.setItem('modi_im',modi_im);
sessionStorage.setItem('eliminar_im',eliminar_im);
</script>
                ";

                if ($acceso == "Usuario") 
                {
                    echo"
                    <script>
                    window.location.href = 'principal.php';
                    </script>
                        ";
                }else {
                echo"
                <script>
                window.location.href = 'usuario.php';
                </script>
                    ";
                }


            }
            else
            {
                echo
                "<script>
                window.alert('Por favor, verifica si el usuario y contraseña son correctos.');
                </script>
                ";
            }

        }
        else
        {
            echo
            "<script>
            window.alert('Por favor, verifica si el usuario y contraseña son correctos.');
            </script>
            ";
        }    
    
    }
}
?>


