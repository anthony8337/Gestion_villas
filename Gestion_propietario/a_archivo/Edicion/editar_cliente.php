<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="Editar_cliente" class="mod">
    <div class="mod_ingreso">
    <span onclick="cerrar_edicion_cliente()" class="cerrar">&times;</span>
    

    <fieldset class="cuerpo_registrar">

        <legend class="titulo">Datos del cliente a modificar</legend>

        <table class="fondo_emergente">
        <tr>

        <td>    
            <fieldset>
            <legend>Nombre</legend>
            <input type="text" id="txt_nom" name="txt_nom">
        </fieldset>
        </td>

        <td>    
            <fieldset>
            <legend>Apellido</legend>
            <input type="text" id="txt_apellido" name="txt_apellido">
        </fieldset>
        </td>

        <td>    
            <fieldset>
            <legend>RTN</legend>
            <input type="text" id="txt_rtn" name="txt_rtn">
            </fieldset>
        </td>
        </tr>
        <tr>
        <td>
            <fieldset>
                <legend>Numero telefónico</legend>
                <input type="text" id="txt_tele" name="txt_tele">
            </fieldset>
        </td>
            <td>    
             <fieldset>
                <legend>Cantidad de personas</legend>
                <input type="text" id="txt_can" name="txt_can">
             </fieldset>   
            
        </td>

        <td>
            <fieldset>
                <legend>Fecha de ingreso</legend>
                <input type="date" id="dt_fe" name="dt_fe">
            </fieldset>
        </td>
        
        </tr>
    </table>

</fieldset>
    <button class="registrar" name="botones" type="button" onclick="edicion_Estadia()">Editar Estadia</button>
    <button style="float:inline-end;" class="registrar" name="botones" type="button" onclick="cerrar_edicion_cliente()">Confirmar modificacion</button>
    

</div>
</form>
</nav>