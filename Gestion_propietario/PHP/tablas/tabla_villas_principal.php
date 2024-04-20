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

$sql = "SELECT * FROM pg_gestion_pro.vista_villa ORDER BY id_villa ASC;";

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
    <th>Area de contrucción</th>
    <th>Condición</th>
    <th>Estado</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" , $row["id_villa"] , "</td>";
        echo "<td>" , $row["cod_villa"] , "</td>";
        echo "<td>" , $row["cont_ehh"] , "</td>";
        echo "<td>" , $row["modelo"] , "</td>";
        echo "<td>" , $row["habitacion"] , "</td>";
        echo "<td>" , $row["tam_lote"] , " Mts²</td>";
        echo "<td>" , $row["tam_cons"] , " Mts²</td>";
        echo "<td>" , $row["condicion"] , "</td>";
        

        


        if($row["estado_villa"] == "Activo")
        {
            echo "<td><select>
            <option selected>Activo</option>
            <option>Mantenimiento</option>
            <option>Suspendida</option>
            </select>
            <label class='verde'></label>
            </td>
            ";
        }
        else if($row["estado_villa"] == "Mantenimiento")
        {
            echo "<td><select>
            <option>Activo</option>
            <option selected>Mantenimiento</option>
            <option>Suspendida</option>
            </select>
            <label class='amarillo'></label> 
            </td>
            ";
        }
        else if($row["estado_villa"] == "Suspendida")
        {
            echo "<td><select>
            <option>Activo</option>
            <option>Mantenimiento</option>
            <option selected>Suspendida</option>
            </select>
            <label class='rojo'></label>
            </td>
            ";
        }
        echo "</tr>";
    }
    echo"
    </table>
    ";
}else
{
    echo"no se encontro resultados";
}

?>