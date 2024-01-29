<nav>
    <form action="#" method="post" autocomplete="off">
<div id="ingresar" class="mod">
    <div class="mod_ingreso">
    <span onclick="cerrarcuadro_agregar()" class="cerrar">&times;</span>
    

    <fieldset class="cuerpo_registrar">

        <legend>Datos del nuevo cliente</legend>

        <table class="fondo_emergente">
        <tr>

        <td>    
            <label>Nombre y apellido</label>
            <br>
            <input type="text" id="txt_nombre" name="txt_nombre">
        </td>

        <td>    
            <label>RTN</label>
            <br>
            <input type="text" id="txt_rid" name="txt_rid">
        </td>

        <td>
        <label>Numero telefónico</label>
        <br>
        <input type="text" id="txt_telefono" name="txt_telefono">
        </td>
    </tr>

        <tr>
            <td>    
            <label>Cantidad de personas</label>
            <br>
            <input type="text" id="txt_cantidad" name="txt_cantidad">
        </td>

        <td>
        <label>Fecha de ingreso </label>
        <br>
    <input type="date" id="dt_facha" name="dt_facha">
        </td>
        
        </tr>
    </table>

</fieldset>

<button class="registrar" type="button" onclick="mostrarcuadro_renta()">Realizar renta de villa</button>
<button class="registrar" type="button" onclick="mostrarcuadro_venta()">Realizar compra de villa</button>
</div>
</form>
</nav>


