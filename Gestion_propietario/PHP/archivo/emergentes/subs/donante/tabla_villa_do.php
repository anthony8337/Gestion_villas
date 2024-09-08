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


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['id_donante'])) {
        $id_donante = $_POST['id_donante'];
    } else {
        $id_donante = 0;
    }
}

$sql = "SELECT * FROM donar_recibir_villa WHERE id_propietario = '$id_donante'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["id_villa"],"</td>
        <td>",$row["villas"],"</td>
        <td>",$row["cont_eeh"],"</td>
        <td>",$row["habitaciones"],"</td>
        <td>",$row["modelo"],"</td>
        <td>",$row["condicion"],"</td>
        </tr>
        ";
    }

}
else
{
    echo"No se encuentran datos";
}


?>
