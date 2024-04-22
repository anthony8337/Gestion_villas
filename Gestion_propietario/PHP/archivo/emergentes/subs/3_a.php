<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_v_pro.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="v_pro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_pro_villa_cerrar()" type="button">X</button>
<h2>Seleccionar villa disponible</h2>
</div>

<div class="c2">
<input type="text" placeholder="Buscar villa disponible" id="bus_v_p">

<button>Agregar nueva villa</button>

<div>

<?php
include "PHP/1_sql/conexion.php";

$sql="SELECT * FROM vista_villa WHERE condicion = 'Disponible' AND (estado_villa = 'Activo' OR estado_villa = 'Mantenimiento') ORDER BY id_villa ASC";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"<table id='tab_vip'>";
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

    while ($row = $result->fetch_assoc()) 
    {
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
            echo "<td>" , $row["estado_villa"] , " <label class='verde'></label></td>";
        }
        else
        {
            echo "<td>" , $row["estado_villa"] , " <label class='amarillo'></label></td>";
        }
        echo "</tr>";
    }

    echo"</table>";
}

?>

</div>

</div>

</div>

</div>

<script src="JS/buscar/subs/buscar_v_p.js"></script>