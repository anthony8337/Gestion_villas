
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
            $convertir .= 'MIL ';
        } else {
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

$sql = "SELECT * FROM factura_completa_reimprimir WHERE codigo_pago ='$codigo_factura';";
$result = $conn->query($sql);

$suma_abono_factura_multi = 0;

if($result -> num_rows > 0)
{
    $row = $result->fetch_assoc();

    $tipo_pago_multi = $row["tipo_pago"];
    $forma_pago_multi = $row["forma_pago"];
    $referencia_pago_multi = $row["n_referencia"];

    $suma_abono_factura_multi += $row["cantidad_recibida"];

    $decimal_factura = number_format($row["cantidad_recibida"],2);


    if($hd_grupo == "")
    {
        $descripcion_pago = $row["abono_con"];
    }
    else
    {
        $descripcion_pago = "PAGO DE TODOS LOS PENDIENTES.";
    }

    $valor_tomado = floatval(str_replace('$. ', '', $total_multi));
    $valor_dado = floatval(str_replace('$. ', '', $can_multi));

    $valor_ingresado = number_format($suma_abono_factura_multi,2);


    if($valor_dado > $valor_tomado)
    {
        $cuerpo_suma_multi =  number_format($valor_tomado,2);
        $cuerpo_suma_letra =  convertirMonedaALetras(number_format($valor_tomado,2));

}
    else
    {
        $cuerpo_suma_multi =  number_format(str_replace(',', '', $valor_dado),2);
        $cuerpo_suma_letra =  convertirMonedaALetras(number_format(str_replace(',', '', $valor_dado),2));
    
    }
    
    

    

}


?>