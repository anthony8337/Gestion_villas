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

$sql = "SELECT modelo FROM villa_completo GROUP BY modelo;";

$result = $conn->query($sql);



if($result -> num_rows > 0)
{

    echo"
    <option value='Todo'>Todo</option>
    ";

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

<script>actualizar_tabla_villa();</script>