<?php

$fecha_saldo_actual = $_GET["fecha_saldo_actual"] ?? "";

/*
header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename= Estado_saldos_$fecha_saldo_actual.xls");
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

$concep_saldo = $_GET["concep_saldo"] ?? "";
$hasta_repo_saldo = $_GET["hasta_repo_saldo"] ?? "";
$desde_repo_saldo = $_GET["desde_repo_saldo"] ?? "";
$concep_metodo = $_GET["concep_metodo"] ?? "";

echo"
<script>
    window.alert('$fecha_saldo_actual,$concep_saldo,$hasta_repo_saldo,$desde_repo_saldo,$concep_metodo');
</script>
";



//////////////////////////////////////////////////////////
if($concep_metodo == "Concepto especifico")
{
    $sql = "SELECT 

    villa AS villa,
    nombre AS nombre,
    SUM(costo) AS costo_total,
    SUM(abono) AS abono_total,
    SUM((costo - abono)) AS saldo_total

FROM estado_cuenta WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    concepto = '$concep_saldo' 
    AND
(SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED))) 
GROUP BY 
    villa,
    nombre
ORDER BY SUBSTRING_INDEX(villa, '-', 1), 
CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";
}
else
{
    

    $sql = "SELECT 

    villa AS villa,
    nombre AS nombre,
    SUM(costo) AS costo_total,
    SUM(abono) AS abono_total,
    SUM((costo - abono)) AS saldo_total

FROM estado_cuenta WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    
(SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED))) 
GROUP BY 
    villa,
    nombre
ORDER BY SUBSTRING_INDEX(villa, '-', 1), 
CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";



}

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    $total = 0;
    $total_creedito = 0;
    $total_abono = 0;

    echo"<table border='1'>";

    echo"
    <tr>
    <th colspan = 6>CONCEPTO DE SALDO</th>
    </tr>
    ";

    if($concep_metodo == "Concepto especifico")
    {
        echo"
        <tr>
        <th colspan = 6>Saldo de $concep_saldo</th>
        </tr>
        ";
    }


    echo"
    <tr>
    <th colspan = 3 >Desde $desde_repo_saldo hasta $hasta_repo_saldo</th>
    <th colspan = 3 >Historial hasta $fecha_saldo_actual</th>
    </tr>
    ";

    echo"
    <tr>
    <th>Villa</th>
    <th>Propietario</th>
    <th></th>
    <th>Al Credito</th>
    <th></th>
    <th>Por cobrar</th>
    </tr>
    ";


    while ($row = $result->fetch_assoc()) {

        if(number_format($row["saldo_total"],2) < 0)
        {
            echo"
            <tr>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td></td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            <td></td>
            <td>$. 0.00</td>
            </tr>
            ";
        }
        else
        {
            echo"
            <tr>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td></td>
            <td>$. 0.00</td>
            <td></td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            </tr>
            ";
        }

        if(number_format($row["saldo_total"],2) < 0)
        {
            $total_creedito += $row["saldo_total"];
        }
        else
        {
            $total_abono += $row["saldo_total"];
        }



    }

    $t_total_creedito = "$. ". number_format($total_creedito,2);

    $t_total_abono = "$. ".number_format($total_abono,2);

    echo"
    
    <tr>
    <td colspan='6'>
    <div class='separador'></div>
    </td>
    </tr>

    <tr>
    <td></td>
    <td></td>
    <th style='font-size: 10px;'>Saldo total del credito:</th>
    <td style='background-color: yellow;'>$t_total_creedito</td>
    <th style='font-size: 10px;'>Saldo total por cobrar:</th>
    <td style='background-color: yellow;'>$t_total_abono</td>
    </tr>

    <tr>
    <td colspan='6'>
    <div class='separador'></div>
    </td>
    </tr>
    ";

    echo"</table>";


    

}
else
{
    echo"No se encuentran datos";
}


// Obtener el contenido del archivo Excel y limpiar el buffer
$excelContent = ob_get_clean();

// Crear un archivo temporal con el contenido Excel
$tempFilePath = tempnam(sys_get_temp_dir(), "estado_cuenta_");
file_put_contents($tempFilePath, $excelContent);

// Configuración del correo
$to = $_GET['correo_saldos_excel'] ?? "";
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
$body .= "Content-Type: application/vnd.ms-excel; name=\" Estado_saldos_$fecha_saldo_actual.xls\"\r\n";
$body .= "Content-Transfer-Encoding: base64\r\n";
$body .= "Content-Disposition: attachment; filename=\" Estado_saldos_$fecha_saldo_actual.xls\"\r\n";
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



