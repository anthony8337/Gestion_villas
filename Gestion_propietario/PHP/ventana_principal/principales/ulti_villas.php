<form id="usuario_villas">
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

$sql = "SELECT * FROM ultimas_villas ORDER BY ultimas_villas.id_villa DESC LIMIT 10 ";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table id='tabla_ulti_villa'>
    ";

    echo"
    <tr>
    <th></th>
    <th colspan='4'>Últimas villas registradas</th>
    </tr>

    <tr>
    <th></th>
    <th>Código</th>
    <th>Modelo</th>
    <th>Condición</th>
    <th>Estado</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {


        if($row["estado"] == "1")
        {
            echo"
            <tr>
            <td></td>
            <td>",$row["codigo"],"</td>
            <td>",$row["modelo"],"</td>
            ";

            if($row["condicion"] == '1')
            {
            echo"
            <td>Buen estado</td>
            <td>Disponible</td>
            </tr>
            ";
            }
            else
            {
            echo"
            <td>Mantenimiento</td>
            <td>Disponible</td>
            </tr>
            ";
            }

        }else if($row["estado"] == "2") {
            echo"
            <tr>
            <td></td>
            <td>",$row["codigo"],"</td>
            <td>",$row["modelo"],"</td>";

            if($row["condicion"] == '1')
            {
            echo"
            <td>Buen estado</td>
            <td>Habitado</td>
            </tr>
            ";
            }
            else
            {
            echo"
            <td>Mantenimiento</td>
            <td>Habitado</td>
            </tr>
            ";
            }
        }

    }

    echo"
    </table>
    ";
}
else
{
    echo"
    <table id='tabla_ulti_villa'>
    ";
    echo"
    <tr>
    <th></th>
    <th colspan='4'>Últimas villas registradas</th>
    </tr>

    <tr>
    <th></th>
    <th>Código</th>
    <th>Modelo</th>
    <th>Condición</th>
    <th>Estado</th>
    </tr>
    ";
    echo"
    </table>
No se encuentran datos.
    ";
}
?>
</form>


<script src="JS/principal/usuario_editar.js"></script>
