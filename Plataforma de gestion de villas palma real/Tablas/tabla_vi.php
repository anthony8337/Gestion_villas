<div class="grupo_busqueda">
<label class="lb_busca">Buscar Villas:</label>
<input type="text" id="bus_v" name="bus_v">
</div>

<div class="cuerpo_cuadros">
<?php
echo"
<table id='tab_vi'>
<tr>
<th>",'Villa',"</th>
<th>",'Tipo de villa',"</th>
<th>",'Contador EEH',"</th>
<th>",'Estado',"</th>
</tr>";
$i = 0;
while($i <= 390)
{
    echo "
    <tr class='contenido' onclick='mostrarcuadro_villa_editar()'>
    <td>",$i,"</td>
    <td>",$i,"</td>
    <td>",$i,"</td>
    <td>",$i,"</td>
    </tr>
    ";
    $i++;
}
echo "</table>";
?>
</div>

<script src="Tablas/Busqueda.js"></script>