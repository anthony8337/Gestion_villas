

<div>
<h1>Gestión del propietarios</h1>

<h2>Bienvenido Admin</h2>
</div>


<div class="menu_ho" style="display: flex;">

<ul>

    <?php
    $titulos_agre = ['Generar cuentas','Pago múltiple','Reimprecion'];
    $img_agre = ['journal-plus.svg','cash-coin.svg','receipt-cutoff.svg'];
    $abrir = ['ingreso_g()','ingreso_mul()','ingreso_reim()'];

    for ($i=0; $i < count($titulos_agre); $i++) {
        echo"
        <li onclick='$abrir[$i]' title='$titulos_agre[$i]'><img src='Imagenes/$img_agre[$i]'>
        <span class='titulos_grandes'>$titulos_agre[$i]</span></li>
        ";
    }
    ?>
</ul>

</div>

