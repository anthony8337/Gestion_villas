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


$sql = "SELECT villa FROM estado_cuenta GROUP BY villa 
ORDER BY SUBSTRING_INDEX(villa, '-', 1), CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {
        echo"
        <option value='",$row["villa"],"'>",$row["villa"],"</option>
        ";
    }


}
else
{
    echo"No se encuentran datos";
}
?>

<script>
ultimo_select();
</script>