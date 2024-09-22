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

$filtro_vi = $_POST['filtro_vi'];

switch ($filtro_vi) {
    case 'filtro_vi1':
        $sql = "SELECT * FROM vista_villa WHERE condicion = 'Habitado' AND (estado_villa = 'Activo' OR estado_villa = 'Mantenimiento') ORDER BY id_con_vi ASC;";
        break;
    case 'filtro_vi2':
        $sql = "SELECT * FROM vista_villa WHERE condicion = 'Disponible' AND (estado_villa = 'Activo' OR estado_villa = 'Mantenimiento') ORDER BY id_con_vi ASC";
        break;
        case 'filtro_vi4':
            $sql = "SELECT * FROM vista_villa WHERE estado_villa = 'Activo' ORDER BY id_con_vi ASC;";
            break;
        case 'filtro_vi5':
            $sql = "SELECT * FROM vista_villa WHERE estado_villa = 'Mantenimiento' ORDER BY id_con_vi ASC;";
            break;
        case 'filtro_vi6':
            $sql = "SELECT * FROM vista_villa WHERE estado_villa = 'Suspendida' ORDER BY id_con_vi ASC;";
            break;
            case 'filtro_vi7':
                $sql = "SELECT * FROM pg_gestion_pro.vista_villa ORDER BY id_con_vi ASC;";
                break;
    default:
    $sql = "SELECT * FROM pg_gestion_pro.vista_villa ORDER BY id_con_vi ASC;";
        break;
}



$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table id='tab_vi'>
    ";

    echo"
    <tr>
    <th>id</th>
    <th>Villa</th>
    <th>Contador EEH</th>
    <th>Modelo de villa</th>
    <th>Habitaciones</th>
    <th>Tamaño de lote</th>
    <th>Área de contrucción</th>
    <th>Condición</th>
    <th>Estado</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" , $row["id_con_vi"] , "</td>";
        echo "<td>" , $row["cod_villa"] , "</td>";
        echo "<td>" , $row["cont_ehh"] , "</td>";
        echo "<td>" , $row["modelo"] , "</td>";
        echo "<td>" , $row["habitacion"] , "</td>";
        echo "<td>" , $row["tam_lote"] , " Mts²</td>";
        echo "<td>" , $row["tam_cons"] , " Mts²</td>";
        echo "<td>" , $row["condicion"] , "</td>";
        echo "<td><select>";
        $campos = ['Activo','Mantenimiento','Suspendida'];
        $color = ['verde','amarillo','rojo'];

        for ($i=0; $i <= 2; $i++) 
        { 
            if($row["estado_villa"] == $campos[$i])
            {
                echo"
                <option selected>$campos[$i] </option>
                ";
            }
            else
            {
                echo"
                <option>$campos[$i]</option>
                ";
            }
        }
echo"</select>";
        
    for ($i=0; $i <= 2; $i++) 
    { 
        if($row["estado_villa"] == $campos[$i])
        {
            echo"<label class='$color[$i]'></label>";
        }
        else
        {}
    }

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