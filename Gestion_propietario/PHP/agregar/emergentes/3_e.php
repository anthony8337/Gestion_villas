

<div id="div_reimprime" class="mod">

<div class="centro">

<div class="c1">
<h2>Reimprimir factura</h2>
<button onclick="cerrar_re_factura()" type="button">X</button>
</div>

<div class="c2">
    <fieldset>
        <legend class="no_ver">boton</legend>
        <button type="button">Seleccionar propietario</button>
    </fieldset>

    <fieldset>
        <legend>Código de villa</legend>
        <input type="text">
    </fieldset>

    <fieldset>
        <legend>Propietario</legend>
        <input type="text">
    </fieldset>

    <fieldset>
        <legend>Fecha</legend>
        <input type="date">
    </fieldset>

    
</div>

<div class="c2">
    <fieldset>
    <legend>Buscador de factura por codígo</legend>
    <input type="text" placeholder="Buscar factura por codígo">
    </fieldset>

    <fieldset>
    <legend>Buscador de factura por servicio</legend>
    <input type="text" placeholder="Buscar factura por servicio">
    </fieldset>

    <fieldset>
    <legend>Buscador de factura por fecha</legend>
    <input type="text" placeholder="Buscar factura por fecha">
    </fieldset>
</div>


<div class="c4">
<span>Facturas realizadas</span>
<div class="contenido_tabla">
    <table class="contenido">
        <tr>
        <th></th>
            <th>Codígo de factura</th>
            <th>Servicio</th>
            <th>Fecha de pago</th>
        </tr>
    </table>
    </div>
</div>


<fieldset class="c2 sin_borde">
    <legend>Detalles de factura</legend>

    <fieldset>
    <legend>Codígo de pago</legend>
    <input type="text">
</fieldset>

<fieldset>
    <legend>Tipo de pago</legend>
    <input type="text">
</fieldset>

<fieldset>
    <legend>Forma de pago</legend>
    <input type="text">
</fieldset>

<fieldset>
    <legend>Referencia</legend>
    <input type="text">
</fieldset>

<fieldset>
    <legend>Fecha de pago</legend>
    <input type="text">
</fieldset>
</fieldset>

<div class="c4">
<div class="contenido_tabla">
    <table class="contenido">
        <tr>
        <th></th>
            <th>Documento</th>
            <th>Codígo</th>
            <th>Abono</th>
            <th>Fecha aplicada</th>
            <th>Fecha vencimiento</th>
        </tr>
    </table>
    </div>
</div>

<div class="c3">
<button type="button" id="btn_imp">Imprimir</button>
</div>

</div>

</div>

<script>ultimo_reim();</script>