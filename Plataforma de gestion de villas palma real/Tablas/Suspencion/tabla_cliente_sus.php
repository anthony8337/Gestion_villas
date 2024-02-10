<div class="grupo_busqueda">
<label class="lb_busca">Buscar Cliente a suspender:</label>
<input type="text" id="busca_cliente_sus" name="busca_cliente_sus">
</div>

<div class="cuerpo_cuadros">
<?php
echo"
<table id='tabla_cliente_sus'>
<tr>
<th>",'Villa',"</th>
<th>",'Propietario',"</th>
<th>",'RTN',"</th>
<th>",'Estatus',"</th>
</tr>";
$i = 0;
while($i <= 390)
{
    echo "
    <tr class='contenido' onclick='mostrar_cuadro_cliente_suspender_d()'>
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