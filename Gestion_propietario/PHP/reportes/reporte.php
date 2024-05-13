<div id="m_2" class="m_reporte">

<ul>
<?php
    $titulos_agre = ['Estado de<br>cuenta','Reporte de villas','Reporte de saldos'];
    $img_agre = ['person-lines-fill(1).svg','card-text.svg','cash-coin.svg'];
    
    for ($i=0; $i < count($titulos_agre); $i++) { 

        if ($i == 0) {
            echo"
            <li onclick='ingreso_lis_villa()'><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
            ";
        }
        else if ($i == 1) {
            echo"
            <li onclick='ingreso_lis_pro()'><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
            ";
        }else if ($i == 2) {
            echo"
            <li onclick='ingreso_lis_pro_sal()'><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
            ";
        }
        else
        {
            echo"
            <li><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
            ";
        }


    }
    ?>
</ul>

</div>