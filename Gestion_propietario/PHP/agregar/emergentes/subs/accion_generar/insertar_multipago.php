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
$total_pago = $_POST['total_multi'];
$cantidad_pago = $_POST['can_multi'];
$devolver_pago = $_POST['devo_multi'];
$concepto_pago = $_POST['hd_id_concepto'];

$sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto) 
VALUES ('$cod_fac','$id_pro_multi','$id_cuenta','$fecha_pago','$total_pago','$cantidad_pago','$devolver_pago',1,1,'$concepto_pago');";

$sql2= "UPDATE cuentas SET pagado='Pagado' WHERE id_cuenta ='$id_cuenta';";

$result = $conn->query($sql);

$result2 = $conn->query($sql2);

if ($result == true && $result2 == true) {
        echo"<script>window.alert('Cuenta pagada con exito');
        </script>";
}
else
{
        echo"<script>window.alert('Ha ocurrido un error');
        </script>";
}




?>