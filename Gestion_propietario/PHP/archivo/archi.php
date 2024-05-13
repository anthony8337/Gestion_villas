<div id="m_0" class="m_archivo" title>

<ul>

<?php
    $titulos_archi = ['Nuevo propietario','Nueva villa','Monedas','Conceptos'];
    $img_archi = ['perfil.png','casa_b.png','cash-coin.svg','card-text.svg'];
    $accion = ['ingreso()','ingreso_vi()','ingreso_moneda()','ingreso_concepto()'];

    for ($i=0; $i < count($titulos_archi); $i++) { 

        echo"
        <li onclick='$accion[$i]' title='$titulos_archi[$i]'><img src='Imagenes/$img_archi[$i]'>
        <label class='titulos_grandes' title='$titulos_archi[$i]'>$titulos_archi[$i]</label></li>
        ";


    }
    ?>
</ul>

</div>