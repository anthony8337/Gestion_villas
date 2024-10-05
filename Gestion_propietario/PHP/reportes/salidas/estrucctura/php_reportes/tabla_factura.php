<?php

function convertirNumeroALetras($numero) {
    $unidades = [
        '', 'UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS', 'SIETE', 'OCHO', 'NUEVE',
        'DIEZ', 'ONCE', 'DOCE', 'TRECE', 'CATORCE', 'QUINCE', 'DIECISÉIS', 'DIECISIETE', 
        'DIECIOCHO', 'DIECINUEVE', 'VEINTE'
    ];

    $decenas = [
        '', '', 'VEINTI', 'TREINTA', 'CUARENTA', 'CINCUENTA', 'SESENTA', 'SETENTA', 
        'OCHENTA', 'NOVENTA'
    ];

    $centenas = [
        '', 'CIENTO', 'DOSCIENTOS', 'TRESCIENTOS', 'CUATROCIENTOS', 'QUINIENTOS', 
        'SEISCIENTOS', 'SETECIENTOS', 'OCHOCIENTOS', 'NOVECIENTOS'
    ];

    if ($numero == 0) {
        return 'CERO';
    } elseif ($numero == 100) {
        return 'CIEN';
    }

    $convertir = '';

    if ($numero >= 1000) {
        if ($numero == 1000) {
            $unidades = [
                '', '', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS', 'SIETE', 'OCHO', 'NUEVE',
                'DIEZ', 'ONCE', 'DOCE', 'TRECE', 'CATORCE', 'QUINCE', 'DIECISÉIS', 'DIECISIETE', 
                'DIECIOCHO', 'DIECINUEVE', 'VEINTE'
            ];
            $convertir .= 'MIL ';
        } else {
            $unidades = [
                '', '', 'DOS', 'TRES', 'CUATRO', 'CINCO', 'SEIS', 'SIETE', 'OCHO', 'NUEVE',
                'DIEZ', 'ONCE', 'DOCE', 'TRECE', 'CATORCE', 'QUINCE', 'DIECISÉIS', 'DIECISIETE', 
                'DIECIOCHO', 'DIECINUEVE', 'VEINTE'
            ];
            $convertir .= $unidades[intval($numero / 1000)] . ' MIL ';
        }
        $numero %= 1000;
    }

    if ($numero >= 100) {
        $convertir .= $centenas[intval($numero / 100)] . ' ';
        $numero %= 100;
    }

    if ($numero >= 21) {
        $convertir .= $decenas[intval($numero / 10)] . ' ';
        $numero %= 10;
    }

    if ($numero > 0) {
        $convertir .= $unidades[$numero] . ' ';
    }

    return trim($convertir);
}

function convertirMonedaALetras($monto) {

    $monto = floatval(str_replace(',', '', $monto));

    $partes = explode('.', number_format($monto, 2, '.', ''));
    $parteEntera = intval($partes[0]);
    $centavos = intval($partes[1]);

    $letras = convertirNumeroALetras($parteEntera);
    $letras .= ' DLLS CON ' . convertirNumeroALetras($centavos) . ' CENTAVOS';

    return $letras;
}


$servername ="localhost"; 
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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cod_factura_codi = $_POST['txt_cod_reim'];   
    
    
}else
{
    $cod_factura_codi = "";
}

$sql = "SELECT * FROM factura_completa_reimprimir WHERE codigo_pago ='$cod_factura_codi';";
$result = $conn->query($sql);

$suma_abono_factura = 0;

if($result -> num_rows > 0)
{
    $row = $result->fetch_assoc();

    $decimal = number_format($row["abono"],2);

    if (is_numeric($decimal)) {
        $suma_abono_factura += $decimal;
    } else {
        $suma_abono_factura += 0; 
    }

        $descripcion = $row["abono_con"];

        if($hh_contar_cuentas < 2)
{
    $cofir_pago = $descripcion;
}
else
{
    $cofir_pago = "PAGO DE TODOS LOS PENDIENTES.";
}

if($row["costo"] != 0)
{
    $completado = "Pago parcial realizado";
}
else
{
    $completado = "Pago completo realizado";
}


        $respuesta = floatval(str_replace('$. ', '', $txt_total_abono));


        $cuerpo_suma = number_format($respuesta,2);

        $nuemro_letra = convertirMonedaALetras($respuesta);
    
}


?>