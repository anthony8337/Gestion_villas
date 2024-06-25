<link rel='stylesheet' type='text/css' media='screen' href='CSS/celdas/mod_cel.css'>

<div id="acc_cel" class="mod">

<div class="centro">

<div class="c1">
<h2>Accion al realizar: A-1</h2>
<button onclick="cerrar_ingreso_celda()" type="button">X</button>

</div>

<div class="c5">

<table>
        <tr>

        <?php
        
$objetivo = ['Saldo','Pago<br>multiple','Gestionar<br>cuenta'];
$icono = ['cash-stack.svg','cash-coin.svg','journal-check.svg'];
$abrir = ['ingreso_saldo()','ingreso_mul_cel()','ingreso_gc()'];

for ($i=0; $i < count($objetivo); $i++) { 
    echo"<td>";
    echo"<button type='button' onclick='$abrir[$i]'><img src='Imagenes/$icono[$i]'>
    <br>
    $objetivo[$i]</button>";
    echo"</td>";
}

        ?>
        </tr>

        <tr>
        <?php
        
        $objetivo = ['Reimprimir<br>factura','Modificar','Suspender'];
        $icono = ['receipt-cutoff.svg','5.png','trash3-fill.svg'];
        $abrir = ['ingreso_refactura()','ingreso_modificar_pro()','eliminar_propietario()'];
        

for ($i=0; $i < count($objetivo); $i++) { 
    echo"<td>";
    echo"<button type='button' onclick='$abrir[$i]'><img src='Imagenes/$icono[$i]'>
    <br>
    $objetivo[$i]</button>";
    echo"</td>";
}

        ?>
        </tr>
    </table>

</div>

</div>

</div>