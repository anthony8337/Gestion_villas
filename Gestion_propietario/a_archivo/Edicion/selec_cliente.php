<nav>
    <form action="#" method="post" autocomplete="off">

    <div id="sele_cli" class="mod">
    <fieldset class="mod_seleccionar_edi_cliente">
    <span onclick="cerrar_selec_cliente()" class="cerrar">&times;</span>
    <legend class="titulo">Selecionar cliente a modificar</legend>

    <?php
    include "Tablas/tabla_cliente.php";
    ?>

<br>
    <div style="text-align: center;">
    <button class="can" name="botones" type="button" onclick="cerrar_selec_cliente()" style="float: none;">Cancelar</button>
    </div>

</fieldset>   
</div>
</form>
</nav>