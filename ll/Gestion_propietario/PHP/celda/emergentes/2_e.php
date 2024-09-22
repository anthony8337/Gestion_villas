<div id="div_cuentas_pagar" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">
<h2>Cuentas a pagar</h2>
<button onclick="cerrar_cuentas_pagar(),limpiar_confirmar()" type="button">X</button>

</div>

<div class="c2">

<fieldset>
    <legend>Código</legend>
    <input type="text" name="txt_villa_cu" id="txt_villa_cu" readonly>
</fieldset>

<fieldset>
    <legend>Propietario</legend>
    <input type="text" name="txt_pro_cu" id="txt_pro_cu" readonly>
</fieldset>

<fieldset>
    <legend>Buscar cuenta</legend>
    <input  placeholder="Buscar cuenta" type="text" name="bus_cuenta_creada" id="bus_cuenta_creada" oninput="bus_cu_pendiente()">
</fieldset>

<fieldset class="limite_tamaño">
    <legend>Saldo total a pagar</legend>
    <input type="text" name="txt_total_saldo" id="txt_total_saldo" readonly>
</fieldset>

</div>

<div class="c2">

<div id="tabla_cuentas_pagar" class="contenido_tabla completo">

</div>

</div>

</div>

</div>