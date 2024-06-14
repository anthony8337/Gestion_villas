<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_multipago.css'>

<div id="multi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_mul()" type="button">X</button>
<h2>Pago multiple</h2>
</div>

<div class="c2">


<?php
$botones = ['Propietario', 'G. Cuenta','Limpiar','Pagar'];
$acciones = ['sele_pro_multi()','ingreso_g_multi()','',''];

for ($i=0; $i < count($botones); $i++) { 
   echo"

   <button type='button' onclick='$acciones[$i]'>$botones[$i]</button>

   ";
}

?>

<fieldset id="dato_multi">
    <legend>Documento</legend>
    <input type="text" name="cod_multi" id="cod_multi">
    <input type="date" name="fecha_multi" id="fecha_multi">
</fieldset>

</div>

<div class="c4">


<fieldset class="d_propietario">
    <legend>Clave: <label id="villa_multi" name="villa_multi"></label></legend>

    <label id="nombre_multi" name="nombre_multi">Nombre:</label>
    <br>
    <label id="telefono_multi" name="telefono_multi">Teléfono:</label>

</fieldset>

<fieldset class="sal_propietario">
    <legend>Saldo:</legend>

    <input type="text" id="saldo_multi" name="saldo_multi">

</fieldset>
</div>

<div class="c3">


<form id="formulario_datos_multi">
    <input type="hidden" name="id_propi_uni" id="id_propi_uni">
    <input type="hidden" name="codigo_cuenta_txt" id="codigo_cuenta_txt">
    <input type="hidden" name="codigo_concepto" id="codigo_concepto">
</form>

<div id="respuesta_cuenta_multi">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php";
    ?>
</div>

</div>

<div class="c5">

<fieldset>
    <div>
    <table id="concep_multipago">
        <tr>
            <th colspan="2">
            <input type="text" name="bus_concepto_multi" name="bus_concepto_multi" placeholder="Buscar concepto">
            </th>
        </tr>

        <tbody id="datos_con_pago">
            <?php
            include "PHP/agregar/emergentes/subs/accion_generar/tabla_concepto_multi.php";
            ?>
        </tbody>
    </table>
    </div>
</fieldset>

<fieldset>
    <table>
        <tr>
            <td>Total a Pagar</td>
            <td><input type="text" id="total_pago_multi" name="total_pago_multi"></td>
        </tr>


        <tr>
            <td>Pendiente</td>
            <td><input type="text" id="pendiente_pago" name="pendiente_pago"></td>
        </tr>

        <tr>
            <td>Devolver</td>
            <td><input type="text" id="devolver_pago" name="devolver_pago"></td>
        </tr>
    </table>
</fieldset>
</div>

</div>


</div>
 
