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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $tabla_cuenta_multi = json_decode($_POST['tabla_cuenta_multi'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_cuenta_multi && is_array($tabla_cuenta_multi)) {
        
        foreach ($tabla_cuenta_multi as $fila) {


            $sql= "INSERT INTO multi_pago(codigo_pago, id_unir, id_cuenta, fecha_pago, total_pago, cantidad_recibida, cantidad_devuelta, id_estado, id_pago, id_concepto) 
            VALUES ('$cod_fac','$id_pro_multi','" . htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') . "','$fecha_pago','$total_pago','$cantidad_pago','$devolver_pago',1,1,'$concepto_pago');";
            $result = $conn->query($sql);

            $sql2= "UPDATE cuentas SET pagado='Pagado' WHERE id_cuenta ='" . htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') . "';";
            $result2 = $conn->query($sql2);

        }

        echo"
        <script>
        window.alert('Cuentas registradas con exito');
        </script>
        ";

    } else {

    }


} else {

}
?>

