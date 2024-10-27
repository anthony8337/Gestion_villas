<?php
// Obtener los argumentos pasados desde el comando
$to = $argv[1];
$pdfPath = $argv[2];

$subject = "Recibo en PDF";
$message = "Estimado usuario,\n\nAdjunto encontrarás el recibo en formato PDF.\n\nSaludos.";
$boundary = md5(time()); // Para separar las partes del correo

// Encabezados del correo
$headers = "From: Anthony Oliva Google";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: multipart/mixed; boundary=\"$boundary\"\r\n";

// Cargar el PDF
$pdfOutput = file_get_contents($pdfPath);

// Crear el cuerpo del correo con el adjunto
$body = "--$boundary\r\n";
$body .= "Content-Type: text/plain; charset=UTF-8\r\n";
$body .= "Content-Transfer-Encoding: 7bit\r\n";
$body .= "\r\n$message\r\n";
$body .= "--$boundary\r\n";
$body .= "Content-Type: application/pdf; name=\"Recibo.pdf\"\r\n";
$body .= "Content-Transfer-Encoding: base64\r\n";
$body .= "Content-Disposition: attachment; filename=\"Recibo.pdf\"\r\n";
$body .= "\r\n" . chunk_split(base64_encode($pdfOutput)) . "\r\n";
$body .= "--$boundary--";

// Enviar el correo
mail($to, $subject, $body, $headers);
?>

<script>
    limpiar_confirmar();
</script>
