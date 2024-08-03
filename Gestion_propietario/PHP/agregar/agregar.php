<div id="m_1" class="menu_ho">



<ul>

    <?php
    $titulos_agre = ['Generar cuentas','Pago múltiple','reimpresión'];
    $img_agre = ['journal-plus.svg','cash-coin.svg','receipt-cutoff.svg'];
    $abrir = ['crear_cuenta()','crear_multipago()','re_factura()'];

    for ($i=0; $i < count($titulos_agre); $i++) {
        echo"
        <li onclick='$abrir[$i]' title='$titulos_agre[$i]'><img src='Imagenes/$img_agre[$i]'>
        <span class='titulos_grandes'>$titulos_agre[$i]</span></li>
        ";
    }
    ?>
</ul>

</div>

