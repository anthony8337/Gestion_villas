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


$sql = "SELECT * FROM villa_completo ORDER BY
 SUBSTRING_INDEX(villas, '-', 1), CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) ASC;";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {
        echo"
        <option value='",$row["villas"],"'>",$row["villas"],"</option>
        ";
    }


}
else
{
    echo"No se encuentran datos";
}
?>

<script>ultimo_select();</script>