<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_multipago.css'>

<div id="multi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_mul()" type="button">X</button>
<h2>Pago multiple</h2>
</div>

<div class="c2">
<?php
$botones = ['Propietario', 'G. Cuenta','Limpiar',];
$acciones = ['sele_pro_multi()','ingreso_g_multi()',''];

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

    <input type="text" name="saldo_multi" name="saldo_multi">

</fieldset>
</div>

<div class="c3">

<div>
    <table>
        <tr>
            <?php
            $titulos = ['Concepto','Documento','Importe','Abono','Fecha Aplida','Fecha Vencimiento','Saldo'];

            for ($i=0; $i < count($titulos); $i++) { 
                echo"
                <td>$titulos[$i]</td>
                ";
            }
            ?>
        </tr>

        <tbody>
            <?php
            include "PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php";
            ?>
        </tbody>
    </table>
</div>

</div>

<div class="c5">

<fieldset>
    <div>
    <table>
        <tr>
            <th colspan="2">
            <input type="text" name="bus_concepto_multi" name="bus_concepto_multi" placeholder="Buscar concepto">
            </th>
        </tr>

        <tbody>
        </tbody>
    </table>
    </div>
</fieldset>

<fieldset>
    <table>
        <tr>
            <td>Total a Pagar</td>
            <td><input type="text" name="to_pago_multi" name="to_pago_multi"></td>
        </tr>


        <tr>
            <td>Pendiente</td>
            <td><input type="text" name="pendiente_pago" name="pendiente_pago"></td>
        </tr>

        <tr>
            <td>Devolver</td>
            <td><input type="text" name="devolver_pago" name="devolver_pago"></td>
        </tr>
    </table>
</fieldset>
</div>

</div>

</div>
