<div  id="m_1" class="m_agregar">

<ul>

    <?php
    $titulos_agre = ['Generar cuentas','Pago multiple','Reimprecion'];
    $img_agre = ['journal-plus.svg','cash-coin.svg','receipt-cutoff.svg'];
    $abrir = ['ingreso_g()','ingreso_mul()','ingreso_reim()'];

    for ($i=0; $i < count($titulos_agre); $i++) {
        echo"
        <li onclick='$abrir[$i]' title='$titulos_agre[$i]'><img src='Imagenes/$img_agre[$i]'>
        <label class='titulos_grandes'>$titulos_agre[$i]</label></li>
        ";
    }
    ?>
</ul>

</div>
