<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_reimprimir.css'>

<div id="lis_pro_sal" class="mod">

<div class="centro">

<div class="c1">
<h2>Estados de cuenta de propietario</h2>
<button onclick="cerrar_ingreso_lp_sal(),limpiar_confirmar()" type="button">X</button>
</div>

<form id="form_estados">

<div class="c2">

<fieldset>
<legend style="visibility: hidden;">boton</legend>
<button type="button" class="btn_re" onclick="selec_pro_estado()">Propietario</button>
</fieldset>

<input type="hidden" id="id_pro_sc" name="id_pro_sc">

<fieldset>
        <legend>Código</legend>
        <input type="text" name="txt_cod_estados" id="txt_cod_estados" readonly>
</fieldset>

<fieldset>
        <legend>Propietario</legend>
        <input type="text" name="txt_propi_estados" id="txt_propi_estados" readonly>
</fieldset>
    
<fieldset>
        <legend>Fecha</legend>
        <input type="date" name="fecha_estado_hoy" id="fecha_estado_hoy" readonly>
</fieldset>

</div>

<div class="c2 c2_estado_cuenta">

<fieldset>
        <legend>Seleccionar cuota</legend>
        <select name="rango_cuota" id="rango_cuota" oninput="tabla_estado_cuenta()">
        </select>
</fieldset>

<fieldset>
        <legend>Indicar fecha de pago</legend>
        <select name="ranco_factura" id="ranco_factura" oninput="ocultar_fecha(),tabla_estado_cuenta()">
        <option value="Historial completo">Historial completo</option>
        <option value="Periodo de fecha">Periodo de fecha</option>
    </select>
</fieldset>

<fieldset id="f_desde_sc">
    <legend>Desde</legend>
        <input type="date" name="desde_estado" id="desde_estado" oninput="tabla_estado_cuenta()">
    </fieldset>

    <fieldset id="f_hasta_sc">
    <legend>Hasta</legend>
    <input type="date" name="hasta_estado" id="hasta_estado" oninput="tabla_estado_cuenta()">
    </fieldset>

</div>

<div class="c4">
<div class="contenido_tabla">
    <table id="td_estados_cuerpo" class="contenido">
        <tr>
        <th></th>
        <th>Fecha aplicada</th>
        <th>Concepto</th>
        <th>Documento</th>
        <th>Cargo</th>
        <th>Abono</th>
        <th>Total</th>
        </tr>

        <tbody id="tb_estados" class="borrar_t">

        </tbody>

    </table>
    </div>
</div>

<div class="c3">
<button type="button" onclick="abrirNuevaPagina_estado()">Imprimir</button>
</div>

</form>

<div id="respuesta_estados"></div>

</div>

</div>

<label style="display: none;" id="lb_cel_re"></label>

<script>ocultar_fecha();</script>

<script>
    function abrirNuevaPagina_estado() {
    // IDs de los inputs que quieres enviar
    var inputIDs = ['rango_cuota','ranco_factura','desde_estado','hasta_estado','fecha_estado_hoy'
        ,'txt_cod_estados' ,'txt_propi_estados','id_pro_sc'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "3_estado_cuenta.php";
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
