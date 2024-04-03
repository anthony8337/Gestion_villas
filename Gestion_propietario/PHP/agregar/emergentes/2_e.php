<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_multipago.css'>

<div id="multi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_mul()" type="button">X</button>
<h2>Pago multiple</h2>
</div>

<div class="c2">

<?php
$botones = ['Propietario', 'G. Cuenta','Limpiar'];

for ($i=0; $i < count($botones); $i++) { 
   echo"
   <button type='button'>$botones[$i]</button>
   ";
}

?>

<fieldset>
    <input type="date" disabled>
    <label>R12345</label>
</fieldset>

</div>


<div class="c3">

<fieldset class="d_pro">
    <table>
        <tr>
            <td><label>Codigo: </label><label>A-1</label></td>
            <td><label>Propietario: </label><label>Anthony Clemente Oliva Murillo</label></td>
            <td><label>Abono disponible: </label><label>$. 900.00</label></td>
        </tr>
    </table>
</fieldset>

<div>
    <table>
        <tr>
            <th>Concep. cuenta</th>
            <th>Cod. cuenta</th>
            <th>Fecha Apli.</th>
            <th>Fecha Ven.</th>
            <th>Costo</th>
            <th>Abono</th>
            <th>Importe</th>
            <th>Saldo</th>
        </tr>
    </table>
</div>

<fieldset class="filtro_cuenta">
    <legend>Filtro de tiempo</legend>
    <table>
        <tr>
            <td>
                <input type="radio" name="activo" checked> Mes Actual
            </td>

            <td>
                <input type="radio" name="activo"> Todo
            </td>

            <td>
                <input type="radio" name="activo"> Rango
            </td>

            <td>
                <input type="date" disabled>
            </td>

            <td>
                <input type="date" disabled>
            </td>
        </tr>
    </table>
</fieldset>

<fieldset class="saldo_total">
    <legend>Saldo total a pagar</legend>
    <label>$. </label><label>700</label>
</fieldset>



</div>

</div>

</div>