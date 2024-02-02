<div class="grupo_busqueda">
<label class="lb_busca">Buscar Cliente:</label>
<input type="text" id="busca_cliente" name="busca_cliente">
</div>

<div class="cuerpo_cuadros">
<?php
echo"
<table id='tabla_cliente'>
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
    <tr class='contenido' onclick='mostrarcuadro_cliente_editar()'>
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