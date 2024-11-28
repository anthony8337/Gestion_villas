<?php
ob_start(); // Inicia el buffer de salida
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php
    // Obtener la URL completa de la hoja de estilo
    $cssFile = "http://" . $_SERVER['HTTP_HOST'] . "/CSS/super_archivo.css";
    ?>
    <link rel="stylesheet" type="text/css" href="<?php echo $cssFile; ?>">
</head>
<body>

<?php
    // Asegurarse de usar rutas absolutas para los includes
    include $_SERVER['DOCUMENT_ROOT'] . "/PHP/reportes/salidas/estrucctura/formato_estado_cuenta.php";
    ?>

</body>
</html>



<?php
$html = ob_get_clean(); // Obtiene el contenido del buffer de salida y limpia el buffer

require_once "libreria/dompdf/autoload.inc.php";

use Dompdf\Dompdf;

$dompdf = new Dompdf();

$options = $dompdf->getOptions();
$options->set(array('isRemoteEnabled' => true)); // Habilitar carga remota de archivos
$dompdf->setOptions($options);

$dompdf->loadHtml($html);
$dompdf->setPaper('letter');
$dompdf->render();

// Agregar pie de página con el número de página
$canvas = $dompdf->getCanvas();

$canvas->page_text(40, 710, str_repeat("_", 95), null, 10, array(0, 0, 0));

$canvas->page_text(500, 740, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0)); // Ajustar la posición y el formato según sea necesario

// Guardar el PDF en una variable en lugar de mostrarlo directamente
$pdfOutput = $dompdf->output();

// Mostrar el PDF en el navegador
$dompdf->stream("estado_de_cuenta.pdf", array("Attachment" => false));

// Configuración del correo

if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
    $hd_correo = $_POST['txt_correo_estados'];
}
else
{
    $hd_correo = "";
}

$to = $hd_correo;
$subject = "Estado de cuenta en PDF";
$message = "Estimado usuario,\n\nAdjunto encontrarás el Estado de cuenta en formato PDF.\n\nSaludos.";
$boundary = md5(time()); // Para separar las partes del correo

// Encabezados del correo
$headers = "From: acomdev123@gmail.com\r\n \r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: multipart/mixed; boundary=\"$boundary\"\r\n";

// Crear el cuerpo del correo con el adjunto
$body = "--$boundary\r\n";
$body .= "Content-Type: text/plain; charset=UTF-8\r\n";
$body .= "Content-Transfer-Encoding: 7bit\r\n";
$body .= "\r\n$message\r\n";
$body .= "--$boundary\r\n";
$body .= "Content-Type: application/pdf; name=\"estado_de_cuenta.pdf\"\r\n";
$body .= "Content-Transfer-Encoding: base64\r\n";
$body .= "Content-Disposition: attachment; filename=\"estado_de_cuenta.pdf\"\r\n";
$body .= "\r\n" . chunk_split(base64_encode($pdfOutput)) . "\r\n";
$body .= "--$boundary--";

// Enviar el correo
mail($to, $subject, $body, $headers);

?>
