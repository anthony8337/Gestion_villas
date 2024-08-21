<div id="div_atajo" class="mod">

<div class="centro">

<div class="c1">
<h2><span id="prin_pro_villa"></span> <span id="prin_pro_pro"></span></h2>
<button onclick="cerrar_ingreso_celda()" type="button">X</button>

</div>

<div class="c5">

<?php
$objetivo = ['Pago multiple','Generar cuenta','Reimprimir factura','Perfil de propietario'];
$icono = ['cash-coin.svg','journal-check.svg','receipt-cutoff.svg','person-fill(1).svg'];
$abrir = ['crear_multipago()','crear_cuenta()','re_factura()',''];
for ($i=0; $i < count($objetivo); $i++) { 

    echo"<button type='button' onclick='$abrir[$i],cerrar_ingreso_celda()'><img src='Imagenes/$icono[$i]'><span>$objetivo[$i]</span></button>";
}
?>


</div>

</div>

</div>