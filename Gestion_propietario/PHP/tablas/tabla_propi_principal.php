<div id="tabla_contenido_propi">

<table> 
<tr class="cabezal">
<th>Villa</th>
<th>Cont. EEH</th>
<th>Propietario</th>
<th>RTN</th>
<th>Telefono</th>
<th>Estado</th>
<th>Fecha de ingreso</th>
<th>Saldo</th>
</tr>

<tbody>


<?php

include "PHP/tablas/datos_random.php";

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];


$i = 0;


while($i < count($letra))
{

for($j = 1; $j <= 12; $j++)
{
    if($j == 2)
        {
            $estadia[2] = "Suspendido";
        }
        else
        {
            $estadia[$j] = "Aplica cuota";
        }
    
    echo "
    <tr class='contenido' onclick='saldo_abrir()'>
    <td>",$letra[$i],"-",$j,"<label style='display: none;'>-</label>","</td>
    <td>",rand(10000000,99999999),"</td>
    <td>",$nombre[rand(0,count($nombre)-1)]," ",$Snombre[rand(0,count($Snombre)-1)]," ",
    $apellido[rand(0,count($apellido)-1)]," ",$sapellido[rand(0,count($sapellido)-1)],"</td>
    <td>0101-",rand(1950,2000),"-",rand(10000,50000),"</td>
    <td>+504 ",rand(80000000,99999999),"</td>
    <td>",$estadia[$j],"</td>
    <td>",rand(2000,2024),"-",rand(01,12),"-",rand(1,31),"</td>
    <td>$ 4",$j,"</td>
    </tr>
    ";
}
$i++;
}
?>
</tbody>
</table>

</div>