<?php
ob_clean();
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
</head>
<body>

    <?php
    // Asegurarse de usar rutas absolutas para los includes
    include $_SERVER['DOCUMENT_ROOT'] . "/PHP/reportes/salidas/estrucctura/formato_factura.php";
    ?>
</body>
</html>

<?php
$html = ob_get_clean();

require_once "libreria/dompdf/autoload.inc.php";

use Dompdf\Dompdf;

$dompdf = new Dompdf();

$options = $dompdf->getOptions();
$options->set(array('isRemoteEnabled' => true)); // Habilitar carga remota de archivos
$dompdf->setOptions($options);

$dompdf->loadHtml($html);
$dompdf->setPaper('letter');

$dompdf->render();
$dompdf->stream("factura.pdf", array("Attachment" => false));
?>
