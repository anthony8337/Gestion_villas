<div id="m_0" class="m_archivo" title>

<ul>

<?php
    $titulos_archi = ['Nueva villa','Nuevo propietario','Intercambio de villa','Adicionar villa'];
    $img_archi = ['house-add-fill(2).svg','person-fill(1).svg','arrow-left-right.svg','houses-fill.svg'];
    $accion = ['ingreso_vi()','ingreso()','v_cambio_abrir()','abrir_adicionar()'];

    for ($i=0; $i < count($titulos_archi); $i++) { 

        echo"
        <li onclick='$accion[$i]' title='$titulos_archi[$i]'><img src='Imagenes/$img_archi[$i]'>
        <span class='titulos_grandes' title='$titulos_archi[$i]'>$titulos_archi[$i]</span>
        </li>
        ";


    }
    ?>
</ul>

</div>