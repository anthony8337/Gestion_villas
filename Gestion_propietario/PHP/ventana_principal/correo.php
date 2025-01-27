<?php

error_reporting(0); // Desactiva todos los reportes de errores
ini_set('display_errors', 0); // Evita mostrar errores en la salida


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

$correo = $_POST["txt_email_recupera"];

$sql = "SELECT *, AES_DECRYPT(clave, 'clave_usuario') AS clave FROM usuarios WHERE correo = '$correo'";

$result = $conn->query($sql);

if ($result -> num_rows > 0) 
{
    while ($row = $result->fetch_assoc()) 
    {
        $to = $row["correo"]; // Dirección de correo del destinatario

        $m1 = $row["nombre"];
        $m1_2 = $row["apellido"];
        $m2 = $row["usuario"];
        $m3 = $row["clave"];

        $message = "Hola $m1 $m1_2, es un placer saludarlo, aqui le muestro los datos solicitados para acceder: \nUsuario: $m2 \nContreseña: $m3 \nSaludos cordiales"; // Cuerpo del mensaje

    }
}

$subject = "Asunto del correo"; // Asunto del correo

// Encabezados opcionales (como el remitente)
$headers = "From: advillas012025@gmail.com\r\n";

// Enviar el correo
if(mail($to, $subject, $message, $headers)) {
    echo "
    <script>
    window.alert('Correo enviado exitosamente, por favor, revisar el buzón o en correo no deseado.');
    regresar();
    limpiar_confirmar();
    </script>";
} else {
    echo "
    <script>
    window.alert('Error al enviar el correo.');
    </script>
    ";
}
?>
