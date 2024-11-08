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
    <title>Document</title>

    <style>
        @page {
            margin: 20mm;
        }
    </style>
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

// Agregar el número de página en el formato "Página 1-2" en cada página
$canvas = $dompdf->getCanvas();

$canvas->page_text(40, 710, str_repeat("_", 95), null, 10, array(0, 0, 0));

$canvas->page_text(500, 740, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0)); // Ajustar la posición y el formato según sea necesario


$dompdf->stream("Estado_de_cuenta.pdf", array("Attachment" => false));
?>
