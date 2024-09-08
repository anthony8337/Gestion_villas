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

$id_pro_sc = $_POST["id_pro_sc"];

$sql = "SELECT concepto, id_unir FROM cuenta_vista WHERE id_unir = '$id_pro_sc' GROUP BY concepto, id_unir  
ORDER BY id_unir ASC;";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) {

        echo"
        <option value='",$row["concepto"],"'>",$row["concepto"],"</option>
        ";
    }

}
else
{
    echo"No se encuentran datos";
}
?>

<script>tabla_estado_cuenta();</script>