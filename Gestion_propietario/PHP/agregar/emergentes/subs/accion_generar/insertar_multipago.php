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


$dp = $_POST['devo_multi'];
$devolver_pago = substr($dp,3);

$concepto_pago = $_POST['hd_id_concepto'];
///////////// referencias
$tipo_pago = $_POST['hd_tipo_pago'];
$forma_pago = $_POST['txt_forma_pp'];
$referencia = $_POST['txt_nu_referencia'];



if($tipo_pago == "Efectivo")
{
        $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto, tipo_pago, forma_pago, n_referencia) 
        VALUES ('$cod_fac','$id_pro_multi','$id_cuenta','$fecha_pago','$total_pago','$cantidad_pago','$devolver_pago',1,1,'$concepto_pago','$tipo_pago','Físico','Ninguna');";

}
else if($tipo_pago == "Referencia")
{
        $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto, tipo_pago, forma_pago, n_referencia) 
        VALUES ('$cod_fac','$id_pro_multi','$id_cuenta','$fecha_pago','$total_pago','$cantidad_pago',0,1,1,'$concepto_pago','$tipo_pago','$forma_pago','$referencia');";

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



if($para_cargo <= 0)
{
        $total_cargo = 0;
        $sql2 = "UPDATE cuentas SET pagado='Pagado',abono='$abono_real', costo='$total_cargo', con_pagado='completo' WHERE id_cuenta ='$id_cuenta';";
}
else if($para_cargo != 0)
{
        $total_cargo = $cargo_s - $cantidad_pago;
        $sql2 = "UPDATE cuentas SET pagado='Pendiente',abono='$abono_real', costo='$total_cargo' WHERE id_cuenta ='$id_cuenta';";
}


$result = $conn->query($sql);

$result2 = $conn->query($sql2);

if ($result == true && $result2 == true) {


        if($para_cargo <= 0)
        {
                echo"<script>
                window.alert('Cuenta pagada con éxito.');
                abrirNuevaPagina_miltipago();
                recargar_tabla_multi();
                codigo_multi_acutalizar();
                cerrar_crear_multipago();
                </script>";  


        }
        else
        {
                echo"<script>
                window.alert('Cuenta pagada de forma parcial.');
                abrirNuevaPagina_miltipago();
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


<script>
        function pago_ajustado(a) 
        {
              
        }
</script>