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
$id_cuen_esta;

////////////////////////////////////////////////////////////////////a

$sql_100 = "SELECT  (SUM(costo) - SUM(abono))AS total, concepto FROM estado_cuenta WHERE id_unir = '$id_pro' AND id_concepto = '$id_concepto_abono';";
$result_100 = $conn->query($sql_100);

if ($result_100->num_rows > 0) 
{
    $row = $result_100->fetch_assoc();

    $verificar = $row['total'];


}
////////////////////////////////////////////////////////////////////////a

$sql1 = "SELECT * FROM cuentas ORDER BY id_cuenta DESC LIMIT 1;";
$result1 = $conn->query($sql1);
if($result1->num_rows > 0) {
    $row = $result1->fetch_assoc();
    $cod = $row["codigo"] + 1;
    $id_cuen_esta = $row["id_cuenta"] + 1;
}else
{
    $cod = "1000000";
    $id_cuen_esta = 1;
}


if($elegir_abono == "Monto")
{
    if ($verificar < 0) 
    {
        $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado) VALUES
        ('$id_pro','$id_concepto_abono','$costo','0','$desde','$hasta','abonado','$cod','$id_con','falta')";
       
       $sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
       VALUES ('$costo','0','$desde','$id_cuen_esta')";
    }else if($verificar >= 0)
    {
        $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado) VALUES
        ('$id_pro','$id_concepto_abono','$costo','0','$desde','$hasta','No pagado','$cod','$id_con','falta')";
       
       $sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
       VALUES ('$costo','0','$desde','$id_cuen_esta')";
    }


}
else if($elegir_abono == "Abonar")
{
    $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado)  VALUES
 ('$id_pro','$id_concepto_abono','0','$abono','$desde','$hasta','Favor','$cod','$id_con','completo')";

$sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
VALUES ('0','$abono','$desde','$id_cuen_esta')";
}


if($selec_can == "Unico")
{
    if($elegir_abono == "Monto")
    {
    $result = $conn->query($sql);
    $result_segundo = $conn->query($sql_segundo);
    }
    else if($elegir_abono == "Abonar")
    {
        if($verificar > 0)
        {
            echo"
            <script>
            window.alert('Operacion no realizada, debe pagar las cuentas pendientes del concepto.');
            </script>
            ";
        }
        else if($verificar <= 0)
        {
            $result = $conn->query($sql);
            $result_segundo = $conn->query($sql_segundo);
        }
    }
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

        ///////////////////////////////////////////////////////////////////b

$sql_100 = "SELECT  (SUM(costo) - SUM(abono))AS total, concepto FROM estado_cuenta WHERE id_unir = '$id_unir' AND id_concepto = '$id_concepto_abono';";
$result_100 = $conn->query($sql_100);

if ($result_100->num_rows > 0) 
{
    $row = $result_100->fetch_assoc();

    $verificar = $row['total'];


}
///////////////////////////////////////////////////////////////////////b
        
        if($elegir_abono == "Monto")
        {
            if ($verificar < 0) 
            {
            $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado) VALUES
         ('$id_unir','$id_concepto_abono','$costo','0','$desde','$hasta','abonado','$cod','$id_con','falta')";
        
        $sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
        VALUES ('$costo','0','$desde','$id_cuen_esta')";


            }
            else if ($verificar >= 0) 
            {
                $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado) VALUES
                ('$id_unir','$id_concepto_abono','$costo','0','$desde','$hasta','No pagado','$cod','$id_con','falta')";
               
               $sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
               VALUES ('$costo','0','$desde','$id_cuen_esta')";
            }
        

    }else if($elegir_abono == "Abonar")
        {
            
            $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado)  VALUES
         ('$id_unir','$id_concepto_abono','0','$abono','$desde','$hasta','Favor','$cod','$id_con','completo')";
   
   $sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
    VALUES ('0','$abono','$desde','$id_cuen_esta')";
       
    
    }      

    if($elegir_abono == "Monto")
    {
        $result = $conn->query($sql);
        $result_segundo = $conn->query($sql_segundo);

        $cod += 1;
        $id_cuen_esta += 1;
    }
    else if($elegir_abono == "Abonar")
    {
        if($verificar > 0)
        {
            echo"
            <script>
            window.alert('Operacion no realizada, $id_unir debe pagar las cuentas pendientes del concepto.');
            </script>
            ";
        }
        else if($verificar <= 0)
        {
            $result = $conn->query($sql);
            $result_segundo = $conn->query($sql_segundo);
    
            $cod += 1;
            $id_cuen_esta += 1;
        }
    }
    }
}
}

if($result == true)
{

if($verificar < 0 && $elegir_abono == "Monto")
{
    echo"<script>
    window.alert('La cuenta fue registrada como abonado, por favor confirmar al pagar.');
    confir_cuentas();
    actualizar_cod_cuenta($cod);
    </script>";
}else
{
    echo"<script>
    confir_cuentas();
    actualizar_cod_cuenta($cod);
    </script>";
}
    

}
else
{
    echo"No se encuentran datos";
}

?>