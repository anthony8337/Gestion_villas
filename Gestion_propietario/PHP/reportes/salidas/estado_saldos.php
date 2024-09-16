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
            @top-right {
                content: "Página " counter(page) " de " counter(pages);
            }
        }
    </style>
</head>
<body>

    <?php
    // Asegúrate de usar rutas absolutas para los includes
    include $_SERVER['DOCUMENT_ROOT'] . "/PHP/reportes/salidas/estrucctura/formato_estado_saldos.php";
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

$canvas = $dompdf->getCanvas();
$canvas->page_text(55, 740, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 10, array(0, 0, 0));


$dompdf->loadHtml($html);
$dompdf->setPaper('letter');

$dompdf->render();
$dompdf->stream("Estado_de_saldo.pdf", array("Attachment" => false));
?>
