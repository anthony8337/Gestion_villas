
<div id="tabla_contenido_villa">

<table id='tab_vi'>
<tr>
<th>Villa</th>
<th>Contador EEH</th>
<th>Estado</th>
<th>Modelo de villa</th>
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