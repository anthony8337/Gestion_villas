<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="ingresar_cliente" class="mod">
    <div class="mod_ingreso">
    <span onclick="cerrar_insertar_cliente()" class="cerrar">&times;</span>
    

    <fieldset class="cuerpo_registrar">

        <legend class="titulo">Datos del nuevo cliente</legend>

        <table class="fondo_emergente">
        <tr>

        <td>    
            <fieldset>
            <legend>Nombre</legend>
            <input type="text" id="txt_nombre" name="txt_nombre">
        </fieldset>
        </td>

        <td>    
            <fieldset>
            <legend>Apellido</legend>
            <input type="text" id="txt_nombre" name="txt_nombre">
        </fieldset>
        </td>

        <td>    
            <fieldset>
            <legend>RTN</legend>
            <input type="text" id="txt_rid" name="txt_rid">
            </fieldset>
        </td>
        </tr>
        <tr>
        <td>
            <fieldset>
                <legend>Numero telefónico</legend>
                <input type="text" id="txt_telefono" name="txt_telefono">
            </fieldset>
        </td>
            <td>    
             <fieldset>
                <legend>Cantidad de personas</legend>
                <input type="text" id="txt_cantidad" name="txt_cantidad">
             </fieldset>   
            
        </td>

        <td>
            <fieldset>
                <legend>Fecha de ingreso</legend>
                <input type="date" id="dt_facha" name="dt_facha">
            </fieldset>
        </td>
        
        </tr>
    </table>

</fieldset>

<table class="fondo_emergente">
    <tr>
        <td style="text-align: center;">
        <button class="registrar" name="botones" type="button" onclick="mostrar_renta()">Renta de villa</button>
        <button class="registrar" name="botones" type="button" onclick="mostrar_compra()">Compra de villa</button>
        </td>
    </tr>
</table>

</div>
</form>
</nav>


