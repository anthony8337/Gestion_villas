<?php
include "PHP/reportes/salidas/estrucctura/php_reportes/factura_php.php";
?>

<div class="cuerpo_pdf">

<div class="encabezado">
<table>
    <tr>
<td>
    <h4>VILLAS PALMA REAL</h4>
    
    <span>Correo: villa@grupopalmareal.com</span>
    <br>
    <span>Tel. 2407-0000</span>
    
</td>

<td>
<h4>RECIBO</h4>
</td>

<td>
<img src="http://<?php echo $_SERVER['HTTP_HOST']; ?>/Imagenes/logo_principal.png" alt="Imagen">
</td>
    </tr>
</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
    <tr>
<td>
<label>Recibo número: <?php echo htmlspecialchars($codigo_factura); ?></label>
</td>

<td>
<label>RECIBÍ DE: <?php echo htmlspecialchars($nombre_factura); ?></label>
</td>

<td>
<label>VILLA: <?php echo htmlspecialchars($cod_villa_factura); ?></label>
</td>

<td>
<label>Fecha: <?php echo htmlspecialchars($fecha_factura); ?></label>
</td>

    </tr>
</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">

<tr>
    <th>Por concepto de:</th>
    <th>Fecha aplicada</th>
    <th>Fecha vencimiento</th>
    <th>Abono</th>

</tr>

<tbody>
    <?php 
    include "PHP/reportes/salidas/estrucctura/php_reportes/tabla_factura.php";
    ?>
</tbody>

</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
<tr>
<th></th>
<th></th>
<th>Abono Total:</th>
<th><?php echo "$. ".htmlspecialchars($cuerpo_suma); ?></th>
</tr>


</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
<tr>
    <td>Observación: Pago realizado en <?php echo htmlspecialchars($txt_tipa_reim);?> por <?php echo htmlspecialchars($txt_for_reim); ?>.</td>
</tr>


</table>
</div>




</div>
