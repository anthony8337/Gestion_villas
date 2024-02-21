<div class="grupo_busqueda">
<input type="text" id="p_busca" name="p_busca" style="text-align: center;" placeholder="Escribe el codigo del cliente">
</div>


<div class="tabla_primaria">

<table id="tabla"> 


<tr>
<th>Villa</th>
<th>Propietario</th>
<th>Estatus</th>
<th>RTN</th>
<th>Telefono</th>
<th>Medidor EEH</th>
<th>Saldo</th>
</tr>

<?php

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];


$i = 0;


while($i < count($letra))
{

for($j = 1; $j <= 12; $j++)
{
    echo "
    <tr class='contenido'>
    <td>",$letra[$i],"-",$j,"<label style='display: none;'>.</label></td>
    <td>Anthony Oliva</td>
    <td>Activo</td>
    <td>0101-199",$j,"-03209</td>
    <td>+504 94856463</td>
    <td>45628",$j,"</td>
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