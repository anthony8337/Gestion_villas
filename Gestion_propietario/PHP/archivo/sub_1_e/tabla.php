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
    $sql = "SELECT id_concepto, concepto, tipo_concepto.tipo AS 'Tipo', valor, referencia 
    FROM concepto JOIN tipo_concepto ON concepto.id_tipo = tipo_concepto.id_tipo ORDER BY concepto.id_concepto ASC";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table id='C_tabla'>
    ";

    echo"
    <tr>
    <th>id</th>
        <th>Descripción</th>
        <th>Tipo</th>
        <th>Valor</th>
        <th>Posee referencia</th>
        <th></th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" , $row["id_concepto"] , "</td>";
        echo "<td>" , $row["concepto"] , "</td>";
        echo "<td>" , $row["Tipo"] , "</td>";
        echo "<td>" , $row["valor"] , "</td>";
        echo "<td>" , $row["referencia"] , "</td>";
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