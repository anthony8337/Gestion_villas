<?php
include "PHP/reportes/salidas/estrucctura/php_estado_cuenta/estado_php_cuentas.php";
?>

<div class="cuerpo_pdf">

<header class="encabezado ajuste_centro">
<table>
    <tr>

<td>
<h4>VILLAS HOTEL PALMA REAL</h4>    
<span>Correo: villa@grupopalmareal.com</span>
<br>
<span>Tel. 2407-0000</span>
<br>

    
</td>

<td>
<h4>ESTADO DE CUENTA</h4>
<span><?php echo htmlspecialchars($desde_hasta); ?></span>
<span>CUOTA DE <?php echo htmlspecialchars($titulo_este); ?></span>
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
<label>Cliente: <?php echo htmlspecialchars($txt_propi_estados);?> </label>
</td>

<td>
<label><?php echo htmlspecialchars($txt_cod_estados);?></label>
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
<th>Fecha aplicada</th>
        <th>Código</th>
        <th>Concepto</th>
        <th>Descripción</th>
        <th>Estado</th>
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




<footer>
<div class="page-number"></div>
<span class="nom_usu">Usuario: <?php echo htmlspecialchars($nombre_usuario);?></span>
</footer>

</div>
