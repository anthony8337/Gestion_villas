<div id="multi_cantidad_pago" class="mod">

<div class="centro">

<div class="c1">

<h2>Definir cantidad a pagar</h2>
<button onclick="cerrar_costo_con_multi()" type="button">X</button>

</div>

<div class="c2">



<?php
    $nombre_efectivo=["Cantidad total a pagar","Tipo de pago","Cantidad recibida a cobrar","Cantidad a devolver"];
    $id_efectivo=["txt_ct","txt_forma_p","txt_rc","txt_dv"];
    $activacion = ["disabled","","","disabled"];


    for($i = 0; $i < count($nombre_efectivo); $i++)
    {

        if($i == 1)
        {
            echo"
            <fieldset>
<legend>$nombre_efectivo[$i]</legend>
<select name='sl_forma_pago' id='sl_forma_pago'>
    <option value='Efectivo'>Efectivo</option>
    <option value='Referencia'>Referencia</option>
</select>
</fieldset>

<fieldset>
<legend>Forma de pago</legend>
<select name='sl_tipo_r' id='sl_tipo_r'>
    <option value='Deposito'>Deposito</option>
    <option value='Tarjeta de crédito'>Tarjeta de crédito</option>
    <option value='Tarjeta de débito'>Tarjeta de débito</option>
    <option value='Cheque'>Cheque</option>
</select>
</fieldset>

<fieldset>
<legend>Número de referencia</legend>
<input type='text' name='txt_referencia' id='txt_referencia'>
</fieldset>
            ";
        }
        else
        {
            echo"
            <fieldset>
            <legend>$nombre_efectivo[$i]</legend>
            <input type='text' oninput='sumarInputs_previo()' name='$id_efectivo[$i]' id='$id_efectivo[$i]' $activacion[$i]>
            </fieldset>
            ";
        }

 
    }
    ?>

<button type="button" onclick="paso_valor()">Confirmar cantidad</button>

</div>


</div>

</div>


