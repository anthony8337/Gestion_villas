<div  id="m_1" class="m_agregar">

<ul>

    <?php
    $titulos_agre = ['G.Cuentas','Pago Multiple','Reimprecion'];
    $img_agre = ['journal-plus.svg','cash-coin.svg','receipt-cutoff.svg'];

    for ($i=0; $i < count($titulos_agre); $i++) { 

        if($i == 0)
        {
            echo"
            <li onclick='ingreso_g()'><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
            ";
        }
        else if($i == 1)
        {
            echo"
            <li onclick='ingreso_mul()'><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
            ";
        }
        else if($i == 2)
        {
            echo"
            <li onclick='ingreso_reim()'><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
            ";
        }
        else {
        echo"
        <li><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
        ";
    }
    }
    ?>
</ul>

</div>
