<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/sub_emergente/mod_propietario_s.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="propietario_seleccionar" class="mod">

<div class="centro">

<div class="c1">

<button onclick="sele_propietario_cerrar()" type="button">X</button>
<h2>Seleccionar propietario disponible</h2>
</div>

<div class="c2">
<input type="text" placeholder="Buscar propietario disponible" id="bus_propi_cuenta">

<div>

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

$sql="SELECT id_c_pro, id_pro, nombre, dni, cod_villa, cont_ehh, estado FROM propietario_s WHERE estado = 'activo'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"<table id='cuenta_propietario'>";
    echo"
    <tr>
    <th>ID</th>
    <th>Villa</th>
    <th>Contador eeh</th>
    <th>Propietario</th>
    <th>DNI</th>
    <th>Estado</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) 
    {
        echo "<tr>";
        echo "<td>" , $row["id_c_pro"] , "</td>";
        echo "<td>" , $row["cod_villa"] , "</td>";
        echo "<td>" , $row["cont_ehh"] , "</td>";
        echo "<td>" , $row["nombre"] , "</td>";
        echo "<td>" , $row["dni"] ,"</td>";
        if($row["estado"] == "Activo")
        {
            echo "<td>" , $row["estado"] , " <label class='verde'></label></td>";
        }
        else
        {
            echo "<td>" , $row["estado"] , " <label class='amarillo'></label></td>";
        }
        echo "</tr>";
    }

    echo"</table>";
}
else
{
    echo"No se encontro ningun elemento";
}

?>

</div>

</div>

</div>

</div>

<script src="JS/buscar/subs/buscar_propi_cuenta.js"></script>
