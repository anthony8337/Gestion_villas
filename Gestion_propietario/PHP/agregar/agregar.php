<div  id="m_1" class="m_agregar">

<ul>

    <?php
    $titulos_agre = ['G.Cuentas','Pago Multiple','Reimprecion'];
    $img_agre = ['journal-plus.svg','cash-coin.svg','receipt-cutoff.svg'];
    $abrir = ['ingreso_g()','ingreso_mul()','ingreso_reim()'];

    for ($i=0; $i < count($titulos_agre); $i++) {
        echo"
        <li onclick='$abrir[$i]'><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
        ";
    }
    ?>
</ul>

</div>
