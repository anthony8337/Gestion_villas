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
    <input type="text" name="prin_pro_villa" id="prin_pro_villa">
</fieldset>

<fieldset>
    <legend>Propietario</legend>
    <input type="text" name="prin_pro_pro" id="prin_pro_pro">
</fieldset>

</div>

<div class="c5">


<?php
$objetivo = ['Pago multiple','Generar cuenta','Reimprimir factura','Editar propietario'];
$icono = ['cash-coin.svg','journal-check.svg','receipt-cutoff.svg','person-fill(1).svg'];
$abrir = ['crear_multipago(),datos_a_multipago(),sele_con_multi(),actualizar_tabla_conce_multi()',
'crear_cuenta(),datos_a_generar_cuenta()',
're_factura(),datos_a_generar_reimprecion(),cuenta_propi_reim()',
'ingreso_actu(),modificar_propietario(),actualizar_tabla_villa_pro()'];
for ($i=0; $i < count($objetivo); $i++) { 

    echo"<button type='button' onclick='$abrir[$i],cerrar_ingreso_celda()'><img src='Imagenes/$icono[$i]'><span>$objetivo[$i]</span></button>";
}
?>


</div>

</div>

</div>