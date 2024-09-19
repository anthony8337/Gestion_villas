<?php
include "PHP/reportes/salidas/estrucctura/php_saldos_cuenta/estado_php_cuentas.php";
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
<h4>CONCEPTO DE SALDO</h4>
<span><?php echo htmlspecialchars($concep_saldo); ?></span><br>
<span>Saldo de clientes al <?php echo htmlspecialchars($fecha_saldo_actual); ?></span></span>
</td>

<td>
<img src="http://<?php echo $_SERVER['HTTP_HOST']; ?>/Imagenes/logo_principal.png" alt="Imagen">
</td>


    </tr>
</table>
<div class="separador"></div>
</header>

<div class="encabezado">

<table>
    <tr>
        <td></td>
        <td></td>
        <td></td>
<td>
<span>Fecha: <?php echo htmlspecialchars($fecha_hoy); ?></span>
</td>
    </tr>
</table>

<div class="separador"></div>
</div>


<div class="encabezado">
<table class="tam_repo_tabla">

<tr>
        <th>Clave</th>
        <th>Nombre</th>
        <th>Al credito</th>
        <th>Por cobrar</th>
</tr>

<tbody>

<?php
include "PHP/reportes/salidas/estrucctura/php_saldos_cuenta/tabla_php_estados.php";
?>

</tbody>

</table>
<div class="separador"></div>
</div>

<div class="encabezado">
<table class="tam_repo_tabla">
<tr>
<th>Cantidad de registros: <?php echo htmlspecialchars($contar_registros); ?></th>
<th></th>
<th>Saldo total del crédito:<br><?php echo htmlspecialchars($t_total_creedito); ?> </th>
<th>Saldo total por cobrar: <br><?php echo htmlspecialchars($t_total_abono); ?></th>

</tr>


</table>
<div class="separador"></div>
</div>



<footer>
<div class="separador"></div>
<div class="page-number"></div>
<span class="nom_usu">Usuario: <?php echo htmlspecialchars($nombre_usuario);?></span>
</footer>


</div>
