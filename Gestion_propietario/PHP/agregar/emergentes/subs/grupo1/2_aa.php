<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/sub_emergente/mod_concepto_s.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="concepto_seleccionar" class="mod">

<div class="centro">

<div class="c1">

<button onclick="sele_concepto_gc_cerrar()" type="button">X</button>
<h2>Seleccionar Concepto</h2>
</div>

<div class="c2">
<input type="text" placeholder="Buscar concepto" id="bus_v_p">

<button>Agregar nuevo concepto</button>

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

$sql = "SELECT * FROM concepto_selec WHERE Tipo = 'Abono'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table id='s_concepto'>
    ";

    echo"
    <tr>
    <th>id</th>
        <th>Descripción</th>
        <th>Tipo</th>
        <th>Valor</th>
        <th>Posee referencia</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" , $row["id_concepto"] , "</td>";
        echo "<td>" , $row["concepto"] , "</td>";
        echo "<td>" , $row["Tipo"] , "</td>";
        echo "<td>" , $row["valor"] , "</td>";
        echo "<td>" , $row["referencia"] , "</td>";
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

</div>

</div>

</div>

</div>

<script src="JS/buscar/subs/buscar_v_p.js"></script>

<script src="JS/archivo/selec_villa_pro.js"></script>