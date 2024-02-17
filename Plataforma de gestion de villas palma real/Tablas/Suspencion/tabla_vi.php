<div class="grupo_busqueda">
<label class="lb_busca">Buscar Villas:</label>
<input type="text" id="bus_v" name="bus_v">
</div>

<div class="cuerpo_cuadros">
<?php

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];


echo"
<table id='tab_vi'>
<tr>
<th>",'Villa',"</th>
<th>",'Contador EEH',"</th>
<th>",'Estado',"</th>
<th>",'Modelo de villa',"</th>
<th>",'Tamaño de lote',"</th>
<th>",'Area de contruccion',"</th>
<th>",'Costo de venta',"</th>
<th>",'Costo de renta',"</th>
</tr>";
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
        <tr class='contenido' onclick='confirma_eliminar_villa()'>
        <td>",$letra[$i],'-',$j,"</td>
        <td>21222112</td>
        <td>",$estado,"</td>
        <td>",$tipo,"</td>
        <td>200</td>
        <td>150</td>
        <td>$125,000.00</td>
        <td>$100.00</td>
        </tr>
        ";
    }


    $i++;
}
echo "</table>";
?>
</div>

<script src="Tablas/Busqueda.js"></script>