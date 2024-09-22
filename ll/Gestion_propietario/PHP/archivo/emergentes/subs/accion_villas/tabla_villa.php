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

$sql = "SELECT * FROM villa_completo ORDER BY 
    SUBSTRING_INDEX(villas, '-', 1),  
    CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED); ";
$result = $conn -> query($sql);

if ($result -> num_rows > 0) {
    echo"<table id= 'td_villas_completo'>
    <tr>
    <th></th>
        <th>Villa</th>
        <th>Numéro de contador</th>
        <th>Habitaciones</th>
        <th>Aréa de contrucción</th>
        <th>Modelo</th>
        <th>Estado de villa</th>
        <tbody>";
    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["id_villa"],"</td>
        <td>",$row["villas"],"</td>
        <td>",$row["cont_eeh"],"</td>
        <td>",$row["habitaciones"],"</td>
        <td>",$row["lote"],"</td>
        <td>",$row["modelo"],"</td>
        <td>",$row["estado"],"</td>
        <td class = 'oculto'>",$row["direccion"],"</td>
        <td class = 'oculto'>",$row["observacion"],"</td>
        <tr>
        ";
    }
    echo"
    </tbody>
    </tr>
    </table>
    ";
}

?>



<script>seleccionar_villa_tabla();</script>