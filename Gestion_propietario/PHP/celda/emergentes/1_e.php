<div id="div_atajo" class="mod">

<div class="centro">

<div class="c1">
<h2>Atajo de acción</h2>
<button onclick="cerrar_ingreso_celda()" type="button">X</button>

</div>

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

<fieldset>
    <legend>Propietario</legend>
    <input type="text" name="prin_pro_pro" id="prin_pro_pro" readonly>
</fieldset>

</div>

<div class="c5">


<div onclick="atajo_multipago()">
<img src="Imagenes/cash-coin.svg">
<span>Pago multiple</span>
</div>

<div onclick="atajo_cuenta()">
<img src="Imagenes/journal-check.svg">
<span>Generar cuenta</span>
</div>

<div onclick="atajo_cuenta_pagar()">
<img src="Imagenes/cash-stack.svg">
<span>Cuentas a pagar</span>
</div>

<div onclick="atajo_cuenta_pagar()">
<img src="Imagenes/receipt-cutoff.svg">
<span>Reimprimir facturas</span>
</div>

<div onclick="atajo_propietario()">
<img src="Imagenes/person-fill(1).svg">
<span>Edítar propietario</span>
</div>
</button>



</div>

</div>

</div>