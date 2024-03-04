<nav>
    <form action="#" method="post" autocomplete="off">

    <div id="sele_vi" class="mod">
    <fieldset class="mod_seleccionar_edi_cliente">
    <span onclick="cerrar_selec_villa()" class="cerrar">&times;</span>
    <legend class="titulo">Selecionar cliente a modificar</legend>
    
    <?php
    include "Tablas/tabla_vi.php";
    ?>

<br>
    <div style="text-align: center;">
    <button class="can" name="botones" type="button" onclick="cerrar_selec_villa()" style="float: none;">Cancelar</button>
    </div>

</fieldset>
    
</div>
</form>
</nav>