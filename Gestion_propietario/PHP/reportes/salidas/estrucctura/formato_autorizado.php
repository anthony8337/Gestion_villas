<?php
include "PHP/reportes/salidas/estrucctura/php_autorizados/autorizados.php";
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

<td style="width: 50%">
<label>Villa: <?php echo htmlspecialchars($villa_aper);?></label>
</td>

<td style="width: 50%">
<label>Propietario: <?php echo htmlspecialchars($pro_aper);?> </label>
</td>

<td>

</td>

<td>

</td>


    </tr>
</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">

<tr>
        <th style="width: 33.33%;">Villas</th>
        <th style="width: 33.33%;">Propietario</th>
        <th style="width: 33.33%;">No. Identidad</th>
</tr>

<tbody>

<?php
include "PHP/reportes/salidas/estrucctura/php_autorizados/tabla_autorizados.php";
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
<div class="page-number"></div>
<span class="nom_usu">Usuario: <?php echo htmlspecialchars($nombre_usuario);?></span>
</footer>

</div>
