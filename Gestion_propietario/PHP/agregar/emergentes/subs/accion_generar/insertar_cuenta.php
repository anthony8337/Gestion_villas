<?php

$servername = "localhost";
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



$selec_can = $_POST['sl_pro_gc'];


$id_pro = $_POST['id_propi_gc'];
$id_con = $_POST['id_con_gc'];

$co = $_POST['txt_total_gc'];
$costo = substr($co,3);

$abo = $_POST['txt_total_gc'];
$abono = substr($abo,3);

$desde = $_POST['txt_fecha_gc_desde'];
$hasta = $_POST['txt_fecha_gc_hasta'];

$desde_propi = $_POST['desde_propi'];
$hasta_propi = $_POST['hasta_propi'];

$elegir_abono = $_POST['sl_aportacion_gc'];

$id_concepto_abono = $_POST['id_concepto_abono'];

$cod;

$sql1 = "SELECT * FROM cuentas ORDER BY id_cuenta DESC LIMIT 1;";
$result1 = $conn->query($sql1);
if($result1->num_rows > 0) {
    $row = $result1->fetch_assoc();
    $cod = $row["codigo"] + 1;
}else
{
    $cod = "1000000";
}


if($elegir_abono == "Monto")
{
    $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado) VALUES
 ('$id_pro','$id_concepto_abono','$costo','0','$desde','$hasta','No pagado','$cod','$id_con','falta')";
}
else if($elegir_abono == "Abonar")
{
    $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado)  VALUES
 ('$id_pro','$id_concepto_abono','0','$abono','$desde','$hasta','No pagado','$cod','$id_con','falta')";
}

if($selec_can == "Unico")
{
    $result = $conn->query($sql);
}
else if($selec_can == "Rango")
{

$sql_rango = "SELECT * 
FROM propietario_principal
WHERE 
    SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_propi', '-', 1)
    AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) BETWEEN 
        CAST(SUBSTRING_INDEX('$desde_propi', '-', -1) AS UNSIGNED)
        AND CAST(SUBSTRING_INDEX('$hasta_propi', '-', -1) AS UNSIGNED)
ORDER BY 
    SUBSTRING_INDEX(villa, '-', 1),
    CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);
";

$result_rango = $conn->query($sql_rango);

if($result_rango->num_rows > 0)
{

    while($row = $result_rango->fetch_assoc())
    {

        $id_unir = $row["id_unir"];
        
        if($elegir_abono == "Monto")
        {
            $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado) VALUES
         ('$id_unir','$id_concepto_abono','$costo','0','$desde','$hasta','No pagado','$cod','$id_con','falta')";
        }
        else if($elegir_abono == "Abonar")
        {
            $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado)  VALUES
         ('$id_unir','$id_concepto_abono','0','$abono','$desde','$hasta','No pagado','$cod','$id_con','falta')";
        }      
        $result = $conn->query($sql);

        $cod += 1;
    }
}
}

if($result == true)
{
    echo"<script>
    confir_cuentas();
    actualizar_cod_cuenta($cod);
    </script>";
}
else
{
    echo"No se encuentran datos";
}

?>

