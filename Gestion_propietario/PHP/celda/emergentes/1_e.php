<div id="div_atajo" class="mod">

<div class="centro ventanas_pequeñas_largo_2">

<div class="c1">
<h2>Visualizar propietario</h2>
<button onclick="cerrar_ingreso_celda()" type="button">X</button>
</div>
<div>

<div class="c2">

<input type="hidden" name="nn_id" id="nn_id">
<input type="hidden" name="nn_propi" id="nn_propi">
<input type="hidden" name="nn_villa" id="nn_villa">
<input type="hidden" name="nn_telefono" id="nn_telefono">
<input type="hidden" name="nn_correo" id="nn_correo">
<input type="hidden" name="nn_dni" id="nn_dni">
<input type="hidden" name="nn_id_pro" id="nn_id_pro">
<input type="hidden" name="nn_observacion" id="nn_observacion">

<fieldset>
    <legend>Villa</legend>
    <input type="text" name="prin_pro_villa" id="prin_pro_villa" readonly>
</fieldset>

<fieldset class="c2_villa">
    <legend>Propietario</legend>
    <input type="text" name="prin_pro_pro" id="prin_pro_pro" readonly>
</fieldset>

<fieldset>
    <legend>Saldo a la fecha</legend>
    <input type="text" name="prin_pro_saldo" id="prin_pro_saldo" readonly>
</fieldset>

</div>

<div class="c2">

<fieldset>
    <legend>Correo</legend>
    <input type="text" name="prin_pro_correo" id="prin_pro_correo" readonly>
</fieldset>

<fieldset>
    <legend>Telefono 1</legend>
    <input type="text" name="prin_pro_tele1" id="prin_pro_tele1" readonly>
</fieldset>

<fieldset>
    <legend>Telefono 2</legend>
    <input type="text" name="prin_pro_tele2" id="prin_pro_tele2" readonly>
</fieldset>

<fieldset>
    <legend>Telefono 3</legend>
    <input type="text" name="prin_pro_tele3" id="prin_pro_tele3" readonly>
</fieldset>



</div>
</div>

<div class="c2 borde_c2">

<div class="menu_visualizar">

<ul id="menu_lateral_2">

<li onclick="atajo_multipago()">
<img src="Imagenes/cash-coin.svg">
<span>Pago múltiple</span>
</li>

<li onclick="atajo_cuenta()">
<img src="Imagenes/journal-check.svg">
<span>Generar cuenta</span>
</li>

<li onclick="atajo_cuenta_pagar()">
<img src="Imagenes/cash-stack.svg">
<span>Cuentas a pagar</span>
</li>

<li onclick="atajo_reimprimir()">
<img src="Imagenes/receipt-cutoff.svg">
<span>Reimprimir facturas</span>
</li>

<li onclick="atajo_estado_cuenta()">
<img src="Imagenes/person-lines-fill(1).svg">
<span>Estado de cuenta</span>
</li>

<li onclick="cuentas_auto_ver()">
<img src="Imagenes/menu-button-wide-fill.svg">
<span>Cuentas automaticas</span>
</li>

<li onclick="atajo_propietario()">
<img src="Imagenes/person-fill(1).svg">
<span>Edítar propietario</span>
</li>
    </ul>
</div>

<div class="ulti_movi principal_tabla_ultimos contenido_tabla">

<table> 

<tr>
    <th colspan="7">Ultimos movimientos</th>
    <th colspan="7">Ultimos movimientos</th>
</tr>

<tr>
<th></th>
<th>Fecha de pago</th>
<th>Código</th>
<th>concepto</th>
<th>Descripción</th>
<th>Cargo</th>
<th>Abono</th>
<th>Total</th>
</tr>

<tbody id="tbody_ultimos_mov">

</tbody>

</table>

</div>



<div>

</div>




</div>

<div id="respuesta_atajo"></div>

</div>

</div>