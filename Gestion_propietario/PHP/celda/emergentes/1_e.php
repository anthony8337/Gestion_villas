<link rel='stylesheet' type='text/css' media='screen' href='CSS/celdas/mod_cel.css'>

<div id="acc_cel" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_celda()" type="button">X</button>
<h2>Accion al realizar: A-1</h2>
</div>

<div class="c2">



<?php

$objetivo = ['Saldo','Pago multiple','Gestionar cuenta','Reimprimir factura','Modificar','Suspender'];
$icono = ['cash-stack.svg','cash-coin.svg','journal-check.svg','receipt-cutoff.svg','5.png','trash3-fill.svg'];
$abrir = ['ingreso_saldo()','ingreso_mul_cel()','ingreso_gc()','ingreso_refactura()','ingreso_modificar_pro()','eliminar_propietario()'];


for ($i=0; $i < count($objetivo); $i++)
{ 
echo"<div onclick='$abrir[$i]'>


<table>
    <tr>
        <td><img src='Imagenes/$icono[$i]'></td>
    </tr>

    <tr>
        <td><label>$objetivo[$i]</label></td>
    </tr>
</table>


</div>";    
}
?>

</div>

</div>

</div>