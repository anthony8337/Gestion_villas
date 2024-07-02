<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_reimprimir.css'>

<div id="reimpre" class="mod">

<div class="centro">

<div class="c1">
<h2>Reimprimir factura</h2>
<button onclick="cerrar_ingreso_reim()" type="button">X</button>
</div>

<div class="c2">

    <button type="button" class="btn_re">Propietario</button>

    <fieldset>
        <legend>Indicar fecha de pago</legend>
        <select name="ranco_factura" id="ranco_factura">
        <option>Ultimo pago</option>
        <option>Identificar fecha</option>
        <option>Historial de pagos</option>
    </select>
    </fieldset>

    <fieldset>
    <legend>Desde</legend>
        <input type="date" name="desde_factura" id="desde_factura">
    </fieldset>
    <fieldset>
    <legend>Hasta</legend>
    <input type="date" name="hasta_factura" id="hasta_factura">
    </fieldset>
    
</div>


<div class="c4">
    <fieldset>
        <legend>Código:  <span>A-1</span></legend>

    <fieldset>
        <legend>Propietario</legend>
        <span>Anthony Clemente Oliva Murillo</span>
    </fieldset>

    <fieldset>
        <legend>Teléfono</legend>
        <span>94856463</span>
    </fieldset>

    </fieldset>
</div>

<div class="c4">
<div class="contenido_tabla">
    <table class="contenido">
        <tr>
        <th>Fecha de pago</th>
            <th>Cod. Factura</th>
            <th>Concep. cuenta</th>
            <th>Cod. cuenta</th>
            <th>Concep. Pago</th>
            <th>Costo</th>
            <th>Pago</th>
        </tr>
    </table>
    </div>
</div>

<div class="c3">
<button type="button" id="btn_imp">Imprimir</button>
</div>

</div>

</div>

<label style="display: none;" id="lb_cel_re"></label>