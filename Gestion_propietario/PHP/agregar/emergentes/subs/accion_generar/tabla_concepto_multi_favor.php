<script src="JS/archivo/selec_concepto.js"></script>

<?php

error_reporting(0); // Desactiva todos los reportes de errores
ini_set('display_errors', 0); // Evita mostrar errores en la salida

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

$id_multi_hd_id_propietario = $_POST["id_multi_hd_id_propietario"];
$hd_id_concepto = $_POST["hd_id_concepto"];


$sql = "SELECT  (SUM(costo) - SUM(abono))AS total, concepto FROM estado_cuenta WHERE id_unir = 
'$id_multi_hd_id_propietario' AND id_concepto = '$hd_id_concepto';";

$result = $conn->query($sql);
if($result -> num_rows > 0)
{
    $row = $result->fetch_assoc();

    $saldo_acreditado =  $row["total"];
}

?>

<script>

var valor = <?php echo "$saldo_acreditado"?>;

var todo;

if(valor > 0)
{
    todo = 0;
}
else
{
    todo = valor;
}

document.getElementById("txt_sal_total").value = "$." + todo.toFixed(2);

document.getElementById("hd_saldo_favor").value = todo.toFixed(2);


</script>

