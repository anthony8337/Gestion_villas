<div id="multi_cantidad_pago" class="mod">

<div class="centro">

<div class="c1">

<h2>Definir cantidad a pagar</h2>
<button onclick="cerrar_costo_con_multi()" type="button">X</button>

</div>

<div class="c2">



<?php
    $nombre_efectivo=["Cantidad total a pagar","Cantidad recibida a cobrar","Cantidad a devolver"];
    $id_efectivo=["txt_ct","txt_rc","txt_dv"];
    $activacion = ["disabled","","disabled"];


    for($i = 0; $i < count($nombre_efectivo); $i++)
    {
    echo"
    <fieldset>
    <legend>$nombre_efectivo[$i]</legend>
    <input type='text' oninput='sumarInputs_previo()' name='$id_efectivo[$i]' id='$id_efectivo[$i]' $activacion[$i]>
    </fieldset>
    ";
    }
    ?>

<button type="button" onclick="paso_valor()">Confirmar cantidad</button>

</div>


</div>

</div>