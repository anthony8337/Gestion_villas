<?php
$to = "anthony.oliva80@unitec.edu"; // Dirección de correo del destinatario
$subject = "Asunto del correo"; // Asunto del correo
$message = "Hey, marcos, MARCOOOOOOOOOOOS, mirame, soy un email marcos, soy tony-emaiiiiiiiil >:D"; // Cuerpo del mensaje

// Encabezados opcionales (como el remitente)
$headers = "From: Anthony Oliva Google";

// Enviar el correo
if(mail($to, $subject, $message, $headers)) {
    echo "
    <script>
    window.alert('Correo enviado exitosamente.');
    </script>";
} else {
    echo "
    <script>
    window.alert('Error al enviar el correo.');
    </script>
    ";
}
?>

