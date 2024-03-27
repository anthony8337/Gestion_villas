<div id="m_0" class="m_archivo">

<ul>



<?php
    $titulos_archi = ['Nuevo prop.','Nueva villa','Monedas','Conceptos'];
    $img_archi = ['perfil.png','casa_b.png','cash-coin.svg','card-text.svg'];
    

    for ($i=0; $i < count($titulos_archi); $i++) { 

        if ($i == 0) {
            echo"
            <li onclick='ingreso()'><img src='Imagenes/$img_archi[$i]'>$titulos_archi[$i]</li>
            ";
        }else if ($i == 1) {
            echo"
            <li onclick='ingreso_vi()'><img src='Imagenes/$img_archi[$i]'>$titulos_archi[$i]</li>
            ";
        }
        else
        {
            echo"
            <li><img src='Imagenes/$img_archi[$i]'>$titulos_archi[$i]</li>
            ";
        }

    }
    ?>
</ul>

</div>