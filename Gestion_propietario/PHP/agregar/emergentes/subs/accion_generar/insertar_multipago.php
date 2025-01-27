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
$hd_codigo_cuenta = $_POST['hd_codigo_cuenta'];
$id_pro_multi = $_POST['hd_id_propietario'];
$cod_fac = $_POST['txt_cod_m'];
$id_cuenta = $_POST['hd_id_cuenta'];
$fecha_pago = $_POST['txt_fecha_m'];

$tp = $_POST['total_multi'];
$total_pago = substr($tp,3);

 
if ($_POST['can_multi'] == "")
{
        $cantidad_pago = 0;
}
else
{
        $cantidad_pago = $_POST['can_multi'];
}


if ($_POST['hd_correo'] == "")
{
        $hd_correo = "";
}
else
{
        $hd_correo = $_POST['hd_correo'];
}


$dp = $_POST['devo_multi'];
$devolver_pago = substr($dp,3);

$concepto_pago = $_POST['hd_id_concepto'];
///////////// referencias
$tipo_pago = $_POST['hd_tipo_pago'];
$forma_pago = $_POST['txt_forma_pp'];
$referencia = $_POST['txt_nu_referencia'];


////////////////////////////////////////////////////////////////////a

$sql_100 = "SELECT  (SUM(costo) - SUM(abono))AS total, concepto FROM estado_cuenta WHERE id_unir = '$id_pro_multi' AND id_concepto = '$concepto_pago';";
$result_100 = $conn->query($sql_100);

if ($result_100->num_rows > 0) 
{
    $row = $result_100->fetch_assoc();

    $verificar = $row['total'];


}
////////////////////////////////////////////////////////////////////////a


if($tipo_pago == "Efectivo")
{
        if($verificar > 0)
        {
        $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto, tipo_pago, forma_pago, n_referencia) 
        VALUES ('$cod_fac','$id_pro_multi','$id_cuenta','$fecha_pago','$total_pago','$cantidad_pago','$devolver_pago',1,1,'$concepto_pago','$tipo_pago','Físico','Ninguna');";
        }
        else if($verificar <= 0)
        {
        $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto, tipo_pago, forma_pago, n_referencia) 
        VALUES ('$cod_fac','$id_pro_multi','$id_cuenta','$fecha_pago','$total_pago','$cantidad_pago','$devolver_pago',1,1,'$concepto_pago','$tipo_pago','Físico por abono','Ninguna');";
        }
}
else if($tipo_pago == "Referencia")
{
        if($verificar > 0)
        {
        $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto, tipo_pago, forma_pago, n_referencia) 
        VALUES ('$cod_fac','$id_pro_multi','$id_cuenta','$fecha_pago','$total_pago','$cantidad_pago',0,1,1,'$concepto_pago','$tipo_pago','$forma_pago','$referencia');";
        }
        else if($verificar <= 0)
        {
        $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto, tipo_pago, forma_pago, n_referencia) 
        VALUES ('$cod_fac','$id_pro_multi','$id_cuenta','$fecha_pago','$total_pago','$cantidad_pago',0,1,1,'$concepto_pago','$tipo_pago','$forma_pago por abono','$referencia');";
        }

$sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
 VALUES (0,'$cantidad_pago','$fecha_pago','$id_cuenta');";
 $result_segundo = $conn->query($sql_segundo);

}



$sql_selecciona = "SELECT * FROM cuentas WHERE id_cuenta ='$id_cuenta'";
$result_select = $conn->query($sql_selecciona);
if($result_select -> num_rows > 0)
{
        while ($row = $result_select->fetch_assoc()) 
        {
                $cargo_s = $row["costo"]; 
                $abono_s = $row["abono"]; 
        }
}

if ($tipo_pago == "Efectivo") {

        $para_cargo = $cargo_s - $cantidad_pago;

}else if($tipo_pago == "Referencia")
{
        $para_cargo = $cargo_s - $cantidad_pago;
}

if($verificar > 0)/*Ejecutar solo cuando no hay saldo a favor*/
{
if($cantidad_pago >= $cargo_s)
{
$abono_real = $abono_s + $cargo_s;

$sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
 VALUES (0,'$cargo_s','$fecha_pago','$id_cuenta');";
$result_segundo = $conn->query($sql_segundo);
}
else 
{
$abono_real = $abono_s + $cantidad_pago;   

$sql_segundo= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
 VALUES (0,'$cantidad_pago','$fecha_pago','$id_cuenta');";
$result_segundo = $conn->query($sql_segundo);
}
}

$hd_saldo_favor = $_POST['hd_saldo_favor'];
$hd_can_pago = $_POST['hd_can_pago'];

$pago = -1 * $hd_can_pago;

if($pago < $hd_saldo_favor && $hd_saldo_favor < 0)
{
        $valor_dado = $cantidad_pago * -1;

        $costo_favor = $verificar * -1;

        if ($valor_dado < $verificar && $verificar < 0) 
        {
        $sql2 = "UPDATE cuentas SET pagado='Pagado', costo='$costo_favor', con_pagado='completo' WHERE id_cuenta ='$id_cuenta';";
        $result2 = $conn->query($sql2);

        $costo = (-1 * $valor_dado) + $verificar;

        $sql = "INSERT INTO cuentas(id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2,con_pagado) VALUES
        ('$id_pro_multi','$concepto_pago','$costo','0','$fecha_pago','$fecha_pago','Pagado','$hd_codigo_cuenta','$concepto_pago','completo')";
        $result_1 = $conn->query($sql);

//selecciona ultimo campo
        $sql_2= "SELECT * FROM cuentas ORDER BY id_cuenta DESC LIMIT 1; ";
        $result_2 = $conn->query($sql_2);

        if($result_2 -> num_rows > 0)
        {
                $row = $result_2->fetch_assoc();

                $codigo = $row['id_cuenta'];
        }
////////////

        $sql_2= "INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta)
        VALUES (0,'$costo','$fecha_pago','$codigo');";
        $result_2 = $conn->query($sql_2);
        }
        else
        {

        }
}
else
{
if($para_cargo <= 0)
{
        if($verificar > 0)
        {
        $total_cargo = 0;
        $sql2 = "UPDATE cuentas SET pagado='Pagado',abono='$abono_real', costo='$total_cargo', con_pagado='completo' WHERE id_cuenta ='$id_cuenta';";
        }
        else if($verificar <= 0)
        {
        $total_cargo = 0;
        $sql2 = "UPDATE cuentas SET pagado='Pagado', con_pagado='completo' WHERE id_cuenta ='$id_cuenta';";
        }
}
else if($para_cargo != 0)
{
        $total_cargo = $cargo_s - $cantidad_pago;
        $sql2 = "UPDATE cuentas SET pagado='Pendiente',abono='$abono_real', costo='$total_cargo' WHERE id_cuenta ='$id_cuenta';";       
}
}

$result = $conn->query($sql);

$result2 = $conn->query($sql2);

$sql_dentro= "UPDATE cuenta_estado SET fecha_aplicada='$fecha_pago' WHERE id_cuenta = '$id_cuenta'";
$result_dentro = $conn->query($sql_dentro);

if ($result == true && $result2 == true) {


        if($para_cargo <= 0)
        {

                echo"<script>

                window.alert('Cuenta pagada con éxito.');
                saber_correo();
                recargar_tabla_multi();
                codigo_multi_acutalizar();
                cerrar_crear_multipago();
                </script>";  


        }
        else
        {
                echo"<script>

                window.alert('Cuenta pagada de forma parcial.');
                saber_correo();
                recargar_tabla_multi();
                codigo_multi_acutalizar();
                cerrar_crear_multipago();
                </script>";
        }


}
else
{
        echo"<script>window.alert('Ha ocurrido un error');
        </script>";
}
?>