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
$acciones = ['selec_pro_pago()','',''];

for ($i=0; $i < count($botones); $i++) { 
   echo"
   <button type='button' onclick='$acciones[$i]'>$botones[$i]</button>
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
            <td><label>Codigo: </label><label id="pago_codigo" name="pago_codigo"></label></td>
            <td><label>Propietario: </label><label id="pago_nombre" name="pago_nombre"></label></td>
            <td><label>Abono disponible: </label><label id="pago_abono" name="pago_abono"></label></td>
        </tr>
    </table>
</fieldset>

<div id="cuentas_a_pagar">
<?php
include "PHP/agregar/sub_2_e/tabla.php";
?>
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

<label style="display: none;" id="lb_cel_multi"></label>

<script src="JS/agregar/selec_pro_pago.js"></script>