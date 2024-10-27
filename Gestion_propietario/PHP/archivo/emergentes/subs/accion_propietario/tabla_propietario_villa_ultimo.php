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


$sql = "SELECT * FROM villa_completo WHERE estado = '1' ORDER BY id_villa DESC";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{


    echo"
    <table id='tabla_villa_pro'>
    <thead>
    <tr>
    <th></th>
    <th>Villa</th>
    <th>Número de medidor</th>
    <th>Modelo</th>
    <th>Habitaciones</th>
    <th>Condición</th>
    </tr>
    </thead>
    <tbody>";


 

    while ($row = $result->fetch_assoc()) {
        echo"
        
        <tr>
        <td>",$row["id_villa"],"</td>
        <td>",$row["villas"],"</td>
        <td>",$row["cont_eeh"],"</td>
        <td>",$row["modelo"],"</td>
        <td>",$row["habitaciones"],"</td>";

        if ($row["condicion"] == 1) 
        {
            echo"
            <td>Disponible</td>
            ";
        }
        else
        {
            echo"
            <td>Habitado</td>
            ";
        }


        echo"
        <td class='oculto'>Agregar</td>
        </tr>
        
        ";
    }

    echo"
    </tbody>
    </table>
    ";
}
else
{
    echo"No se encuentran datos";
}
?>

<script>llamar_tb_villa_pro();</script>