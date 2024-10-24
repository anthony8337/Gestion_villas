<?php
/*
error_reporting(0); // Desactiva todos los reportes de errores
ini_set('display_errors', 0); // Evita mostrar errores en la salida
*/


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

////////////////////////////////////////////////////////

$correo = $_POST["txt_email_cambiar"];

$sql = "SELECT *,AES_DECRYPT(clave, 'clave_usuario') AS clave FROM usuarios WHERE correo = '$correo'";

$result = $conn->query($sql);

if ($result -> num_rows > 0) 
{
    while ($row = $result->fetch_assoc()) 
    {
        $to = $row["correo"]; // Dirección de correo del destinatario

        $m2 = $row["id_usuario"];
        $m3 = $row["clave"];

        $url = "http://localhost/redireccion_login.php?email=" . urldecode($to);

        $message = "<h2>Se ha detectado una solicitud de cambio de contraseña para el uso del sistema</h2>
        
        <br><h2>Gestión de propietrado del Hotel Villa Palma Real</h2>

        <br><h2>por favor confirma si has sido tu:</h2>
        
        <br>
        <a href='$url' style='
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        color: white;
        background-color: #4CAF50;
        text-decoration: none;
        border-radius: 5px;'>Aceptar y realizar cambio</a>

        
        
        "; // Cuerpo del mensaje

    }
}

$subject = "Contraseña temporal"; // Asunto del correo

// Encabezados opcionales (como el remitente)


$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
$headers .= "From: Anthony Oliva Google";

// Enviar el correo
if(mail($to, $subject, $message, $headers)) 
{
    echo "
    <script>
    window.alert('Contraseña temporal enviada correctamente, por favor, revisar el buzón o en correo no deseado.');
    
    detener_vencimiento();
    regresar();

    </script>
    ";


} else {
    echo "
    <script>
    window.alert('Error al enviar el correo.');
    </script>
    ";
}

/*
$sql_temporal = "DELETE * FROM temporal";
$result_temporal = $conn->query($sql_temporal);
*/
?>

