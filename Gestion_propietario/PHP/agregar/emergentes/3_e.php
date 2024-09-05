

<div id="div_reimprime" class="mod">

<div class="centro">

<div class="c1">
<h2>Reimprimir factura</h2>
<button onclick="cerrar_re_factura(),limpiar_confirmar()" type="button">X</button>
</div>

<div class="c2 boton_fieldset_reimprime">
<fieldset>
        <button type="button" onclick="propi_reim()">Seleccionar propietario</button>
</fieldset>

<fieldset>
        <button type="button" onclick="cuenta_propi_reim()">Seleccionar cuenta</button>
</fieldset>
</div>

<div class="c2">

<fieldset>
    <legend>Código de pago</legend>
    <input type="text" id="txt_cod_reim" name="txt_cod_reim" readonly>
</fieldset>



    <fieldset>
        <legend>Propietario</legend>
        <input type="text" id="txt_nombre_reim" name="txt_nombre_reim" readonly>
    </fieldset>

    <fieldset>
        <legend>Código de villa</legend>
        <input type="hidden" id="hd_id_reim" name="hd_id_reim">
        <input type="text" id="txt_villa_reim" name="txt_villa_reim" readonly>
    </fieldset>

    
</div>


<fieldset class="c2 sin_borde">


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
            <th>Descripción</th>
            <th>Código</th>
            <th>Fecha aplicada</th>
            <th>Fecha vencimiento</th>
            <th>Abono</th>
        </tr>

        <tbody id="respuesta_cuentas_pagadas" class="borrar_t">

        </tbody>
    </table>
    </div>
</div>

<div class="c3 columna_reimprime">

<div>
<fieldset class="elemento">
<legend>Abono Total</legend>
<input type="text" name="txt_total_abono" id="txt_total_abono" readonly>
</fieldset>

<button class="elemento" type="button" id="btn_imp" onclick="abrirNuevaPagina()">Reimprimir factura</button>

</div>
</div>

</div>
</div>

<div id="respuesta_reimprimir"></div>

<script>ultimo_reim();</script>

<script>
    function abrirNuevaPagina() {
    // IDs de los inputs que quieres enviar
    var inputIDs = ['txt_cod_reim','txt_nombre_reim','txt_villa_reim','txt_fecha_pago_reim','txt_tipa_reim','txt_for_reim'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "1_reimprimir.php";
    form.target = "_blank"; // Abre en nueva ventana

    // Añade inputs ocultos para cada valor
    inputIDs.forEach(function(id) {
        var inputValue = document.getElementById(id).value;
        var input = document.createElement("input");
        input.type = "hidden";
        input.name = id;
        input.value = inputValue;
        form.appendChild(input);
    });

    // Envía el formulario
    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);

    limpiar_confirmar();
    
}
</script>
