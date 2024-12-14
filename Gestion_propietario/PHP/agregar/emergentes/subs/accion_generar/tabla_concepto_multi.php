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

$sql = "SELECT concepto,id_unir,MAX(pagado),MAX(id_concepto) AS id_concepto FROM cuenta_vista WHERE id_unir = '$id_multi_hd_id_propietario' 
AND con_pagado = 'falta' GROUP BY concepto,id_unir,con_pagado; ";

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

        $selector = $row["id_concepto"];
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

