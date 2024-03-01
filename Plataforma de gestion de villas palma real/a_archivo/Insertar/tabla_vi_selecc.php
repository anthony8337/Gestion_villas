<fieldset class="grupo_busqueda" style="border: 0px;">

<input type="text" id="bus_v" name="bus_v" placeholder="Buscar codigo de villa" style="float: inline-start; width: 500px; margin-left: 25%;">
<button type="button" style="float: inline-end;">Agregar nueva villa</button>
</fieldset>

<br>

<div class="cuerpo_cuadros">
<?php

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];


echo"
<table id='tab_vi_insertar'>
<tr>
<th>",'Villa',"</th>
<th>",'Contador EEH',"</th>
<th>",'Estado',"</th>
<th>",'Modelo de villa',"</th>
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
            $estado = "Con propietario";
        }
        else
        { 
            $tipo ="Villa coracol";
            $estado = "Disponible";
        }

        echo "
        <tr class='contenido' onclick='edi_s_villa_cerrar()'>
        <td>",$letra[$i],'-',$j,"</td>
        <td>21222112</td>
        <td>",$estado,"</td>
        <td>",$tipo,"</td>
        </tr>
        ";
    }


    $i++;
}
echo "</table>";
?>
</div>

<script src="Tablas/Busqueda.js"></script>