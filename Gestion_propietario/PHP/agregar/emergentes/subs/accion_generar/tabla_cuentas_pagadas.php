

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

$id_propi = $_GET["pripi_id_reim"];



$sql = "SELECT codigo_pago, MAX(id_unir) AS id_unir, MAX(concepto) AS concepto, MAX(fecha_pago) AS fecha_pago, MAX(tipo_pago) AS tipo_pago, MAX(forma_pago) AS forma_pago, MAX(n_referencia) AS n_referencia FROM factura_completa_reimprimir 
WHERE id_unir = '$id_propi' GROUP BY codigo_pago ORDER BY fecha_pago DESC;";


$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["id_unir"],"</td>
        <td>",$row["codigo_pago"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["fecha_pago"],"</td>
        <td>",$row["tipo_pago"],"</td>
        <td>",$row["forma_pago"],"</td>
        <td>",$row["n_referencia"],"</td>
        </tr>";
    }
}
?>

<script>
tabla_cuentas_reimpri();
</script>