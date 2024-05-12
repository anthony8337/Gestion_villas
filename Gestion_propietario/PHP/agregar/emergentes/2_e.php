<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_multipago.css'>

<div id="multi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_mul()" type="button">X</button>
<h2>Pago multiple</h2>
</div>

<div class="c2">

<table>
    <tr>

<?php
$botones = ['Propietario', 'G. Cuenta','Limpiar'];
$acciones = ['selec_pro_pago()','',''];

for ($i=0; $i < count($botones); $i++) { 
   echo"
   <td>
   <button type='button' onclick='$acciones[$i]'>$botones[$i]</button>
   </td>
   ";
}

?>

<td>
<input type="date" disabled>
</td>

<td>
<input type="text" disabled>
</td>

</tr>
</table>

</div>


<div class="c4">

<fieldset class="d_pro">
    <table>
        <tr>
            <td><label>Codigo: </label><label id="pago_codigo" name="pago_codigo">A-1</label></td>
            <td><label>Propietario: </label><label id="pago_nombre" name="pago_nombre">ANTHONY CLEMENTE OLIVA MURILLO</label></td>
            <td><label>Abono disponible: </label><label id="pago_abono" name="pago_abono">$0.00</label></td>
            <td><label>Saldo actual: </label><label id="pago_saldo" name="pago_saldo"></label>$500.60</td>
        </tr>
    </table>
</fieldset>

<div id="cuentas_a_pagar">
<fieldset class="filtro_cuenta">
    <table>
        <tr>
            <td>
                <select name="cuando_cuenta" id="cuando_cuenta">
                    <option value="actual">Mes Actual</option>
                    <option value="anterior">Meses anteriores de este año</option>
                    <option value="todo">Todo el historial</option>
                </select>
            </td>

            <td>
                <input type="text" name="pago_cuenta_buscar" id="pago_cuenta_buscar" placeholder="Buscar cuenta a pagar" title="Buscar cuenta a pagar">
            </td>

            <td>
            </td>
        </tr>
    </table>
</fieldset>


<div>
    <table class="contenido">
        <tr>
            <th>a</th>
        </tr>
    </table>
</div>

</div>

</div>

<div class="conocer_pago">
<table>
    <tr>
        <td>Total a pagar</td>
        <td>$5</td>
    </tr>
</table>
</div>

</div>

</div>

<label style="display: none;" id="lb_cel_multi"></label>

<script src="JS/agregar/selec_pro_pago.js"></script>