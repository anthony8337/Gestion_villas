<?php
include "PHP/reportes/salidas/estrucctura/php_reportes/factura_php.php";
?>

<?php 
include "PHP/reportes/salidas/estrucctura/php_reportes/tabla_factura.php";
?>

<div class="cuerpo_pdf">

<header class="encabezado">
<table>
    <tr>
<td>
    <h4>VILLAS PALMA REAL</h4>
    
    <span>Correo: villa@grupopalmareal.com</span>
    <br>
    <span>Tel. 2407-0000</span>

    
</td>

<td>
<h4>RECIBO REIMPRESO</h4>
</td>

<td>
<img src="http://<?php echo $_SERVER['HTTP_HOST']; ?>/Imagenes/logo_principal.png" alt="Imagen">
</td>
    </tr>
</table>
<div class="separador"></div>
</header>

<div class="encabezado">
<table class="tam_repo_tabla">
    <tr>
<td>
<label>Recibo número: <?php echo htmlspecialchars($codigo_factura); ?></label>
</td>

<td>
</td>

<td>
</td>

<td>
<label>Fecha: <?php echo htmlspecialchars($fecha_factura); ?></label>
</td>

    </tr>
</table>
<div class="separador"></div>
<table class="tam_repo_tabla">

<tr>
    <th>Concepto de pago: <?php echo htmlspecialchars($concepto_2); ?></th>
</tr>
</table>
</div>

<div class="encabezado cuerpo_recibo">
<table>

<tr>
<td>
<label>RECIBÍ DE: </label>
</td>
<td>
<?php echo htmlspecialchars($nombre_factura); ?>
</td>
</tr>

<tr>
<td>
<label>CON VILLA: </label>
</td>
<td><?php echo htmlspecialchars($cod_villa_factura); ?></td>
</tr>

<tr>
<td>
<label>LA CANTIDAD DE: </label>
</td>
<td><?php echo htmlspecialchars($nuemro_letra); ?></td>
</tr>

<tr>
<td>
<label>CON DESCRIPCIÓN DE: </label>
</td>
<td><?php echo htmlspecialchars($cofir_pago); ?></td>
</tr>

</table>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
<tr>
<th><?php echo htmlspecialchars($completado); ?></th>
<th></th>
<th></th>
<th>Abono Total: <?php echo "$. ".htmlspecialchars($cuerpo_suma); ?></th>
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


<footer>
<div class="page-number"></div>
<span class="nom_usu">Usuario: <?php echo htmlspecialchars($nombre_usuario);?></span>
</footer>

</div>
