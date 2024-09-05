<script src="JS/archivo/selec_concepto.js"></script>

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

$id_multi_hd_id_propietario = $_POST["id_multi_hd_id_propietario"];

$sql = "SELECT concepto,id_unir,MAX(id_concepto) AS id_concepto
FROM cuenta_vista  WHERE id_unir = '$id_multi_hd_id_propietario' GROUP BY concepto,id_unir";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"<table id='tabla_concepto_ml'>
    <tr>
        <th></th>
        <th>Conceptos</th>
    </tr>";

    echo"<tbody>";
    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["id_concepto"],"</td>
        <td>",$row["concepto"],"</td>
        </tr>
        ";
    }
    echo"</tbody>";

    echo"</table>";

}
else
{
    echo"No se encuentran datos";
}
?>

<script>
llamado_concepto_multi();
</script>