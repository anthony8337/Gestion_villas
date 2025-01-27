<?php

$txt_cod_estados = $_GET['txt_cod_estados'] ?? "";
$txt_propi_estados = $_GET['txt_propi_estados'] ?? "";
/*
header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename= Estado_cuenta_$txt_propi_estados"."_"."$txt_cod_estados.xls");
*/

ob_start();

// Conexión a la base de datos
$servername = "localhost"; 
$username = "root";
$password = "";
$database = "gestion_de_propietario";

$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Validación de método POST
$rango_cuota = $_GET['rango_cuota'] ?? "";
$ranco_factura = $_GET['ranco_factura'] ?? "";
$desde = $_GET['desde_estado'] ?? "";
$hasta = $_GET['hasta_estado'] ?? "";
$id_pro_sc = $_GET['id_pro_sc'] ?? "";
$todo_cuota = $_GET['todo_cuota'] ?? "";
$txt_propi_estados = $_GET['txt_propi_estados'] ?? "";
$fecha_estado_hoy = $_GET['fecha_estado_hoy'] ?? "";


// Determinar SQL según las condiciones
if ($todo_cuota == "Historial completo" && $ranco_factura == "Historial completo") {
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' ORDER BY fecha_aplicada ASC, codigo ASC, costo DESC";
} else if ($ranco_factura == "Historial completo") {
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota' ORDER BY fecha_aplicada ASC, codigo ASC, costo DESC";
} else if ($todo_cuota == "Historial completo") {
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' AND fecha_aplicada BETWEEN '$desde' AND '$hasta' ORDER BY fecha_aplicada ASC, codigo ASC, costo DESC";
} else {
    $sql = "SELECT * FROM estado_cuenta WHERE id_unir = '$id_pro_sc' AND concepto = '$rango_cuota' AND fecha_aplicada BETWEEN '$desde' AND '$hasta' ORDER BY fecha_aplicada ASC, codigo ASC, costo DESC";
}

$result = $conn->query($sql);

// Generar tabla HTML
echo "<table border='1'>

    <tr>
        <th colspan = 7>Estado de cuenta</th>
    </tr>
    ";


    if($todo_cuota == "Historial completo" && $ranco_factura == "Historial completo")
    {}
    else if ($ranco_factura == "Historial completo") 
    {
        echo"
        <tr>
            <th colspan = 7>CUOTA DE $rango_cuota</th>
        </tr>
        ";
    }else if($todo_cuota == "Historial completo")
    {
        echo"
        <tr>
            <th colspan = 7>Desde $desde al $hasta</th>
        </tr>
        ";
        
    }else
    {
        echo"
        <tr>
            <th colspan = 7>CUOTA DE $rango_cuota</th>
        </tr>
        ";

        echo"
        <tr>
            <th colspan = 7>Desde $desde al $hasta</th>
        </tr>
        ";
    }


    echo"
    <tr>
        <th>Villa: $txt_propi_estados</th>
        <th colspan = 5>Nombre del propietario: $txt_cod_estados</th>
        <th>Fecha: $fecha_estado_hoy</th>
    </tr>
    ";

    echo"
    <tr>
        <th>Fecha Aplicada</th>
        <th>Codigo</th>
        <th>Concepto</th>
        <th>Descripcion</th>
        <th>Costo</th>
        <th>Abono</th>
        <th>Total</th>
    </tr>";

if ($result->num_rows > 0) {
    $total = 0;
    while ($row = $result->fetch_assoc()) {
        $total += $row["costo"] - $row["abono"];
        echo "<tr>
            <td>{$row['fecha_aplicada']}</td>
            <td>{$row['codigo']}</td>
            <td>{$row['concepto']}</td>
            <td>{$row['concepto_2']}</td>
            <td>" . number_format($row['costo'], 2) . "</td>
            <td>" . number_format($row['abono'], 2) . "</td>
            <td>" . number_format($total, 2) . "</td>
        </tr>";
    }

    echo"
    <tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
    </tr>
    ";

    echo"
    <tr>
<th></th>
<th></th>
<th></th>
<th></th>
<th></th>
<th>Abono Total</th>
<th style='background-color: yellow;'>" . number_format($total, 2) . "</th>
    </tr>
    ";
} else {
    echo "<tr><th colspan='7'>No se encuentran datos</th></tr>";
}

echo "</table>";

// Obtener el contenido del archivo Excel y limpiar el buffer
$excelContent = ob_get_clean();

// Crear un archivo temporal con el contenido Excel
$tempFilePath = tempnam(sys_get_temp_dir(), "estado_cuenta_");
file_put_contents($tempFilePath, $excelContent);

// Configuración del correo
$to = $_GET['correo_estado_excel'] ?? "";
$subject = "Estado de cuenta en Excel";
$message = "Estimado usuario,\n\nAdjunto encontrarás el Estado de cuenta en formato Excel.\n\nSaludos.";
$boundary = md5(time());

// Encabezados del correo
$headers = "From: advillas012025@gmail.com\r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: multipart/mixed; boundary=\"$boundary\"\r\n";

// Crear el cuerpo del correo con el archivo adjunto
$body = "--$boundary\r\n";
$body .= "Content-Type: text/plain; charset=UTF-8\r\n";
$body .= "Content-Transfer-Encoding: 7bit\r\n";
$body .= "\r\n$message\r\n";
$body .= "--$boundary\r\n";
$body .= "Content-Type: application/vnd.ms-excel; name=\"Estado_cuenta_$txt_propi_estados._.$txt_cod_estados.xls\"\r\n";
$body .= "Content-Transfer-Encoding: base64\r\n";
$body .= "Content-Disposition: attachment; filename=\"Estado_cuenta_$txt_propi_estados._.$txt_cod_estados.xls\"\r\n";
$body .= "\r\n" . chunk_split(base64_encode(file_get_contents($tempFilePath))) . "\r\n";
$body .= "--$boundary--";

// Enviar el correo
if (mail($to, $subject, $body, $headers)) {
    echo "El correo se envió correctamente.";
} else {
    echo "Error al enviar el correo.";
}

// Eliminar el archivo temporal
unlink($tempFilePath);

?>

