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

$nn_id = $_POST["nn_id"];

$sql = "SELECT * FROM cuenta_vista WHERE id_unir = '$nn_id' AND( pagado = 'Pendiente' OR pagado = 'No pagado' );";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    $total = 0;
    while ($row = $result->fetch_assoc()) {

        $total = $row["costo"] - $row["abono"] + $total;
    }

    echo"$.".number_format($total,2)."";

}
else
{
    echo"No se encuentran datos";
}
?>