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

$sql = "SELECT * FROM propietario_principal ORDER BY 
    SUBSTRING_INDEX(villa, '-', 1),  
    CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
   while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["id_unir"],"</td>
        <td>",$row["villa"],"</td>
        <td>",$row["cont_eeh"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["dni"],"</td>
        <td>",$row["telefono"],"</td>
        <td>",$row["correo"],"</td>
        <td class='oculto'>",$row["id_propietario"],"</td>
        <td class='oculto'>",$row["observacion"],"</td>
        </tr>
        ";
    }
}
else
{
}
?>

<script>selec_propi_prin();</script>