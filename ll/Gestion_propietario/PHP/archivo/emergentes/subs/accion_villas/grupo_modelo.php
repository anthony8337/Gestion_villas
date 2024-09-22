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


$sql = "SELECT * FROM modelo_villa WHERE id_estado = '1'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
       while ($row = $result->fetch_assoc()) {
        echo"
        <option value='",$row["modelo"],"'>",$row["modelo"],"</option>
        ";
    }

}
else
{
    echo"No se encuentran datos";
}
?>