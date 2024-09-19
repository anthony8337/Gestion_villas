<?php
include "PHP/reportes/salidas/estrucctura/php_villas/estado_php_cuentas.php";
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

    
</td>

<td>
<h4>LISTA DE VILLAS</h4>
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
<label>Desde <?php echo htmlspecialchars($desde_reportes_villas);?> al <?php echo htmlspecialchars($hasta_reportes_villas);?></label>
</td>

<td>
<label>Estado: <?php echo htmlspecialchars($estado_villa);?> </label>
</td>

<td>
<label>Modelo: <?php echo htmlspecialchars($modelo_villa);?></label>
</td>

<td>
<span>Fecha: <?php echo htmlspecialchars($dt_villas);?></span>
</td>


    </tr>
</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">

<tr>
<th>Villas</th>
        <th>Número de contador</th>
        <th>Habitación</th>
        <th>Tamaño de lote</th>
        <th>Modelo</th>
        <th>Estado</th>
</tr>

<tbody>

<?php
include "PHP/reportes/salidas/estrucctura/php_villas/tabla_php_estados.php";
?>

</tbody>

</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
<tr>
<th>Cantidad de registros: <?php echo htmlspecialchars($cantiddes); ?></th>
<th></th>
<th></th>
<th></th>

</tr>


</table>
</div>

<footer>
<div class="separador"></div>
<div class="page-number"></div>
<span class="nom_usu">Usuario: <?php echo htmlspecialchars($nombre_usuario);?></span>
</footer>

</div>
