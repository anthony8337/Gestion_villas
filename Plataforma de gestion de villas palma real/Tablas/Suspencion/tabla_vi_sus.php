<div class="grupo_busqueda">
<label class="lb_busca">Buscar Villas a suspender:</label>
<input type="text" id="bus_v_sus" name="bus_v_sus">
</div>

<div class="cuerpo_cuadros">
<?php
echo"
<table id='tab_vi_sus'>
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
    <tr class='contenido' onclick='mostrar_cuadro_villa_suspender_d()'>
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