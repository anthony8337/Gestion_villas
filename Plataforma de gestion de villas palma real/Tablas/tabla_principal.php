<div class="grupo_busqueda">
<input type="text" id="p_busca" name="p_busca" style="text-align: center;" placeholder="Escribe el codigo del cliente">
</div>


<div class="tabla_primaria">

<table id="tabla"> 



<tr>

<th>Villa</th>
<th>Medidor EEH</th>
<th>Nombre Completo</th>
<th>RTN</th>
<th>Numero telefonico</th>
<th>Estado</th>
<th>Fecha de ingreso</th>
<th>Saldo</th>
</tr>

<?php

include "Tablas/datos_random.php";

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
    <tr class='contenido'>
    <td>",$letra[$i],"-",$j,"<label style='display: none;'>.</label></td>
    <td>45628",$j,"</td>
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
</table>
</div>
<script src="Tablas\Busqueda.js"></script>