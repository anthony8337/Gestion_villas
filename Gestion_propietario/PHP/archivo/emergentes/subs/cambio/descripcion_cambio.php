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


$sql = "SELECT * FROM descripcion_donador ORDER BY cuentas DESC LIMIT 1;";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) 
    {
        $cuentas = $row["cuentas"];
    }
}

$sql1 = "SELECT * FROM descripcion_donador WHERE cuentas = '".$cuentas."';";
$result1 = $conn->query($sql1);
if($result1 -> num_rows > 0)
{

    echo"<table id='td_descrip_cambio'>
    <tr>
        <th></th>
        <th>Fecha de registro</th>
        <th>Código</th>
        <th>Emisor</th>
        <th>DNI del emisor</th>
        <th>Descripción</th>
        <th>Receptor</th>
        <th>DNI del receptor</th>
        <th>Villas transferidas</th>
    </tr>";

    while ($row = $result1->fetch_assoc()) 
    {
        echo"
        <tr>
        <td></td>
        <td>".$row["fecha"]."</td>
        <td>".$row["cuentas"]."</td>
        <td>".$row["nombre"]."</td>
        <td>".$row["dni"]."</td>
        <td>Realizo traslado de villa</td>
        <td>".$row["nombre_2"]."</td>
        <td>".$row["dni_2"]."</td>
        <td>".$row["villas"]."</td>
    </tr>
        ";
    }

    echo"</table>";
}



?>

