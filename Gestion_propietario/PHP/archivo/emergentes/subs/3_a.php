<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_v_pro.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="v_pro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_pro_villa_cerrar()" type="button">X</button>
<h2>Seleccionar villa disponible</h2>
</div>

<div class="c2">
    <input type="text" placeholder="Buscar villa disponible">

    <button>Agregar nueva villa</button>

    <div>
    <table id='tab_vi'>
<tr>
<th>Villa</th>
<th>Contador EEH</th>
<th>Estado</th>
<th>Modelo de villa</th>
<th>Cantidad de habitaciones</th>
<th>Tamaño de lote</th>
<th>Area de contruccion</th>
</tr>

<?php

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

$i = 0;
$tipo;
$estado;
while($i < count($letra))
{
    for($j = 1; $j <= 12; $j++)
    {

        if(($j % 5) == 0)
        {
            $tipo = "Villa arrecife";
            $estado = "Disponible";
        }
        else
        { 
            $tipo ="Villa coracol";
            $estado = "Mantenimiento";
        }

        echo "
        <tr class='contenido' onclick='modificar_villa()'>
        <td>",$letra[$i],'-',$j,"</td>
        <td>",rand(10000000,99999999),"</td>
        <td>",$estado,"</td>
        <td>",$tipo,"</td>
        <td>2</td>
        <td>200</td>
        <td>150</td>
        </tr>
        ";
    }


    $i++;
}

?>

</table>
    </div>
</div>

<div class="c3">
</div>



</div>

</div>