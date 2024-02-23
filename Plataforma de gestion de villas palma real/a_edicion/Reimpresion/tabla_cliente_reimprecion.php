<div class="grupo_busqueda">
<label class="lb_busca">Buscar Cliente:</label>
<input type="text" id="busca_cliente" name="busca_cliente">
</div>

<div class="cuerpo_cuadros">
<table id='tabla_cliente_re'>
<?php

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
$estadia;

echo"

<tr>
<th>",'Villa',"</th>
<th>",'Nombre',"</th>
<th>",'Apellido',"</th>
<th>",'RTN',"</th>
<th>",'Numero telefonico',"</th>
<th>",'Tipo de estadia',"</th>
<th>",'Cantidad de personas',"</th>
<th>",'Fecha de ingreso',"</th>
</tr>";
$i = 0;
while($i < count($letra))
{

    for($j = 1; $j <= 12; $j++)
    {
        if($j == 2)
        {
            $estadia[2] = "Inquilino";
        }
        else
        {
            $estadia[$j] = "propietario";
        }

        echo "
        <tr class='contenido' onclick='cerrar_reimpre_cliente()'>
        <td>",$letra[$i],'-',$j,"</td>
        <td>",$letra[$i],'nthony ',$letra[$i],'lemente',"</td>
        <td>",$letra[$i],'liva ',$letra[$i],'urillo',"</td>
        <td>",'0101199',$j,"03209</td>
        <td>",'94856463',"</td>
        <td>",$estadia[$j],"</td>
        <td>",$j,"</td>
        <td>",'2024-08-12',"</td>
        </tr>
        ";
    }

    $i++;
}

?>
</table>



</div>

<script src="Tablas/Busqueda.js"></script>