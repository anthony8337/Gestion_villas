

<div id="div_reimprime" class="mod">

<div class="centro">

<div class="c1">
<h2>Reimprimir factura</h2>
<button onclick="cerrar_re_factura(),limpiar_confirmar()" type="button">X</button>
</div>

<div class="c2">
    <fieldset>
        <legend class="no_ver">boton</legend>
        <button type="button" onclick="propi_reim()">Seleccionar propietario</button>
    </fieldset>

    <fieldset>
        <legend>Código de villa</legend>
        <input type="hidden" id="hd_id_reim" name="hd_id_reim">
        <input type="text" id="txt_villa_reim" name="txt_villa_reim" readonly>
    </fieldset>

    <fieldset>
        <legend>Propietario</legend>
        <input type="text" id="txt_nombre_reim" name="txt_nombre_reim" readonly>
    </fieldset>

    <fieldset>
        <legend>Fecha</legend>
        <input type="date" readonly>
    </fieldset>

    
</div>


<fieldset class="c2 sin_borde">
    <legend>Detalles de factura</legend>

    <fieldset>
    <legend>Código de pago</legend>
    <input type="text" id="txt_cod_reim" name="txt_cod_reim" readonly>
</fieldset>

<fieldset>
    <legend>Tipo de pago</legend>
    <input type="text" id="txt_tipa_reim" name="txt_tipa_reim" readonly>
</fieldset>

<fieldset>
    <legend>Forma de pago</legend>
    <input type="text" id="txt_for_reim" name="txt_for_reim" readonly>
</fieldset>

<fieldset>
    <legend>Referencia</legend>
    <input type="text" id="txt_refe_reim" name="txt_refe_reim" readonly>
</fieldset>

<fieldset>
    <legend>Fecha de pago</legend>
    <input type="text" id="txt_fecha_pago_reim" name="txt_fecha_pago_reim" readonly>
</fieldset>
</fieldset>

<div class="c4">
<div class="contenido_tabla">
    <table id="tb_cuentas_reim">
        <tr>
        <th></th>
            <th>Documento</th>
            <th>código</th>
            <th>Fecha aplicada</th>
            <th>Fecha vencimiento</th>
            <th>Abono</th>
        </tr>

        <tbody id="respuesta_cuentas_pagadas" class="borrar_t">

        </tbody>
    </table>
    </div>
</div>

<div class="c3">
<button type="button" id="btn_imp">Reimprimir factura</button>

<fieldset>
<legend>Abono Total</legend>
<input type="text" name="txt_total_abono" id="txt_total_abono" readonly>
</fieldset>

</div>

</div>
</div>

<script>ultimo_reim();</script>