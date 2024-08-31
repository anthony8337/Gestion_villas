<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_reimprimir.css'>

<div id="lis_pro_sal" class="mod">

<div class="centro">

<div class="c1">
<h2>Estados de cuenta de propietario</h2>
<button onclick="cerrar_ingreso_lp_sal()" type="button">X</button>
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
        <legend>Teléfono</legend>
        <input type="text" name="txt_tele_estados" id="txt_tele_estados" readonly>
</fieldset>

</div>

<div class="c2 c2_estado_cuenta">

<fieldset>
        <legend>Indicar fecha de pago</legend>
        <select name="ranco_factura" id="ranco_factura" oninput="ocultar_fecha()">
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

        <tbody id="tb_estados">

        </tbody>

    </table>
    </div>
</div>

<div class="c3">
<button type="button">Imprimir</button>
</div>

</form>

<div id="respuesta_estados"></div>







</div>

</div>

<label style="display: none;" id="lb_cel_re"></label>

<script>ocultar_fecha();</script>