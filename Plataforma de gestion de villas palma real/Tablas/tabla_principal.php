<div class="grupo_busqueda">
<label class="lb_busca">Buscar Cliente:</label>
<input type="text" id="p_busca" name="p_busca">
</div>


<div class="tabla_principal">
<?php

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];


echo"
<table id='tabla'>
<tr>
<th>",'Villa',"</th>
<th>",'Propietario',"</th>
<th>",'Estatus',"</th>
<th>",'RTN',"</th>
<th>",'Telefono',"</th>
<th>",'Medidor EEH',"</th>
<th>",'Saldo',"</th>
</tr>";
$i = 0;


while($i < count($letra))
{

for($j = 1; $j <= 12; $j++)
{
    echo "
    <tr class='contenido'>
    <td>",$letra[$i],$j,"</td>
    <td>",$letra[$i],$j,"</td>
    <td>",$letra[$i],$j,"</td>
    <td>",$letra[$i],$j,"</td>
    <td>",$letra[$i],$j,"</td>
    <td>",$letra[$i],$j,"</td>
    <td>",$letra[$i],$j,"</td>
    </tr>
    ";
}
$i++;
}
echo "</table>";
?>
</div>
<script src="Tablas\Busqueda.js"></script>