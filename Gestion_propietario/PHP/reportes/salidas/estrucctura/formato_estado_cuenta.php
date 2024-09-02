<?php
include "PHP/reportes/salidas/estrucctura/php_estado_cuenta/estado_php_cuentas.php";
?>

<div class="cuerpo_pdf">

<div class="encabezado ajuste_centro">
<table>
    <tr>
<td>
<span><?php echo htmlspecialchars($ranco_factura); ?></span>
<br>
<span><?php echo htmlspecialchars($desde_hasta); ?></span>
</td>

<td>
<h4>PALMA REAL HOTEL Y VILLAS</h4>
<span>Estado de cuenta</span><br>
<span>Cuota de <?php echo htmlspecialchars($rango_cuota); ?></span>
</td>

<td>
<span>Fecha: <?php echo htmlspecialchars($fecha_estado_hoy);?></span>
</td>
    </tr>
</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
    <tr>
<td>
<label>Cliente: <?php echo htmlspecialchars($txt_propi_estados);?> </label>
</td>

<td>
<label><?php echo htmlspecialchars($txt_cod_estados);?></label>
</td>

<td>
<label>Saldo inicial: $. 0.00</label>
</td>

    </tr>
</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">

<tr>
        <th>Fecha aplicada</th>
        <th>Concepto</th>
        <th>Documento</th>
        <th>Cargo</th>
        <th>Abono</th>
        <th>Total</th>
</tr>

<tbody>

<?php
include "PHP/reportes/salidas/estrucctura/php_estado_cuenta/tabla_php_estados.php";
?>

</tbody>

</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
<tr>
<th>Cantidad de registros: <?php echo htmlspecialchars($cantiddes);?></th>
<th></th>
<th></th>
<th>Abono Total: $. <?php echo htmlspecialchars($t_total);?></th>

</tr>


</table>
<div class="separador"></div>
</div>






</div>
