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

$sql = "SELECT * FROM concepto WHERE id_estado = '1' and tipo = 'Abono'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"<option value='1'>--Selecciona un conepto--</option>";   
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

