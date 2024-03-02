<nav>
    <form action="#" method="post" autocomplete="off">

    <div id="sele_vi_sus" class="mod">
    <fieldset class="mod_seleccionar_edi_cliente">
    <span onclick="seleccion_sus_vi_cerrar()" class="cerrar">&times;</span>
    <legend class="titulo">Selecionar cliente a modificar</legend>
    
    <?php
    include "Tablas/Suspencion/tabla_vi.php";
    ?>

<br>
    <div style="text-align: center;">
    <button class="can" name="botones" type="button" onclick="seleccion_sus_vi_cerrar()" style="float: none;">Cancelar</button>
    </div>

</fieldset>
    
</div>
</form>
</nav>