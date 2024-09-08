<div id="multi_cantidad_pago" class="mod">

<div class="centro">

<div class="c1">

<h2>Definir cantidad a pagar</h2>
<button onclick="cerrar_costo_con_multi()" type="button">X</button>

</div>

<div class="c2">

<fieldset>
    <legend>Cantidad total a pagar</legend>
    <input type="text" name="txt_ct" id="txt_ct" oninput='sumarInputs_previo()' readonly>
</fieldset>

<fieldset>
<legend>Tipo de pago</legend>
<select name='sl_forma_pago' id='sl_forma_pago' oninput='tipo_pago()'>
    <option value='Efectivo'>Efectivo</option>
    <option value='Referencia'>Referencia</option>
</select>
</fieldset>

<fieldset id="fl_tipo_pago">
<legend>Forma de pago</legend>
<select name='sl_tipo_r' id='sl_tipo_r'>
    <option value='Deposito'>Deposito</option>
    <option value='Tarjeta de crédito'>Tarjeta de crédito</option>
    <option value='Tarjeta de débito'>Tarjeta de débito</option>
    <option value='Cheque'>Cheque</option>
</select>
</fieldset>

<fieldset id="fl_n_referencia">
<legend>Número de referencia</legend>
<input type='text' name='txt_referencia' id='txt_referencia'>
</fieldset>

<fieldset id="fl_recibido">
    <legend>Cantidad recibida a cobrar</legend>
    <input type='text' class="solo_numero" name='txt_rc' id='txt_rc' placeholder="Cantidad recibida" oninput='sumarInputs_previo()'>
</fieldset>

<fieldset id="fl_devolver">
    <legend>Cantidad a devolver</legend>
    <input type='text' name='txt_dv' id='txt_dv' oninput='sumarInputs_previo()' readonly>
</fieldset>


<button type="button" onclick="identificar_tipo_valor()">Confirmar cantidad</button>

</div>


</div>

</div>

<script>
    tipo_pago();
</script>



