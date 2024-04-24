<?php
$servername = "localhost"; 
$username = "root";
$password = "";
$database = "pg_gestion_pro";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} 
else
{
}

    $sql = "SELECT moneda, abreviado, cambio FROM moneda";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table id='M_tabla'>
    ";

    echo"
    <tr>
    <th>Descripción</th>
    <th>Abreviado</th>
    <th>Cambio a lempira</th>
    <th></th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" , $row["moneda"] , "</td>";
        echo "<td>" , $row["abreviado"] , "</td>";
        echo "<td>" , $row["cambio"] , "</td>";
        echo "
        <td>    
        <button id='modi_carac'>
        <img src='Imagenes/pencil-fill.svg'>
        </button>
        <button id='eli_carac'>
            <img src='Imagenes/trash3-fill.svg'>
        </button>
        </td>
        ";
        echo"</tr>";
    }
    echo"
    </table>
    ";
}else
{
    echo"no se encontro resultados";
}

?>