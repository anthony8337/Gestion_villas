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

$sql = "SELECT concepto FROM cuenta_vista GROUP BY concepto; ";

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

<script>
actualizar_tabla_saldos();
</script>