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

$cantidad_pago = $_POST['can_multi'];

$dp = $_POST['devo_multi'];
$devolver_pago = substr($dp,3);

$concepto_pago = $_POST['hd_id_concepto'];

$ajusta = $total_pago - $cantidad_pago;

///////////// referencias
$tipo_pago = $_POST['hd_tipo_pago'];
$forma_pago = $_POST['txt_forma_pp'];
$referencia = $_POST['txt_nu_referencia'];

if($ajusta > 0)
{
echo"<script>
    window.alert('No se puede completar este pago, la cantidad recibida no es suficiente.');
    </script>";
}
else
{


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $tabla_cuenta_multi = json_decode($_POST['tabla_cuenta_multi'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_cuenta_multi && is_array($tabla_cuenta_multi)) {
        
        foreach ($tabla_cuenta_multi as $fila) {

    if($tipo_pago == "Efectivo")
    {
    $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto,tipo_pago, forma_pago, n_referencia) 
    VALUES ('$cod_fac','$id_pro_multi','" . htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') . "','$fecha_pago','$total_pago','$cantidad_pago','$devolver_pago',1,1,'$concepto_pago','$tipo_pago','Físico','Ninguna');";
    $result = $conn->query($sql);
    }
    else if($tipo_pago == "Referencia")
    {
    $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto,tipo_pago, forma_pago, n_referencia) 
    VALUES ('$cod_fac','$id_pro_multi','" . htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') . "','$fecha_pago','$total_pago','$cantidad_pago','$devolver_pago',1,1,'$concepto_pago','$tipo_pago','$forma_pago','$referencia');";
    $result = $conn->query($sql);
    }

            $sql_tomar = "SELECT * FROM cuentas WHERE id_cuenta ='" . htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') . "'";
            $result_tomar = $conn->query($sql_tomar);
            if($result_tomar -> num_rows > 0)
            {
                $row = $result_tomar->fetch_assoc();

            $sql2= "UPDATE cuentas SET con_pagado='completo', pagado='Pagado',abono='".$row["costo"]."', costo='0' WHERE id_cuenta ='" . htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') . "';";
            $result2 = $conn->query($sql2);
            }

        }

        echo"
        <script>
        window.alert('Cuentas registradas con éxito');
        abrirNuevaPagina_miltipago();
        recargar_tabla_multi();
        codigo_multi_acutalizar();
        cerrar_crear_multipago();
        </script>
        ";

    } else {

    }


} else {

}
}
?>

