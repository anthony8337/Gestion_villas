<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="cliente_insertar" class="mod">
    <fieldset class="mod_ingreso">
    <legend class="titulo">Datos del nuevo cliente</legend>
    <span onclick="cerrar_inser_cliente()" class="cerrar">&times;</span>

    <table class="fondo_emergente">
        <tr>

        <td>    
            <fieldset class="in_cli">
            <legend>Nombre y apellido</legend>
            <input type="text" id="txt_nombre" name="txt_nombre">
        </fieldset>
        </td>


        <td>    
            <fieldset class="in_cli">
            <legend>RTN</legend>
            <input type="text" id="txt_rid" name="txt_rid">
            </fieldset>
        </td>

        <td>
            <fieldset class="in_cli">
                <legend>Numero telefónico</legend>
                <input type="text" id="txt_telefono" name="txt_telefono">
            </fieldset>
        </td>

        </tr>
        <tr>
        
        <td>    
            <fieldset class="in_cli">
            <legend>Correo</legend>
            <input type="text" id="txt_nombre" name="txt_nombre">
        </fieldset>
        </td>

            <td>    
             <fieldset class="in_cli">
                <legend>Estado</legend>

                <table style="height: 100%;">
                    <tr>

                        <td>
                            <input type="radio" name="estado" id="rb_apli" value="Aplicar cuota" checked>Aplicar cuota
                        </td>

                        <td>
                            <input type="radio" name="estado" id="rb_Sus" value="Suspendido">Suspendido
                        </td>

                    </tr>
                </table>

             </fieldset>   
            
        </td>

        <td>
            <fieldset class="in_cli">
                <legend>Fecha de ingreso</legend>
                <input type="date" id="dt_facha" name="dt_facha" >
            </fieldset>
        </td>
        
        </tr>
    </table>


<table class="fondo_emergente">
    <tr>
        <td style="text-align: center;">
        <button class="registrar" name="botones" type="button" onclick="asig_villa()">Asignar villa</button>
        <button class="can" name="botones" type="button" onclick="cerrar_inser_cliente()">Cancelar</button>
        </td>
    </tr>
</table>
</fieldset>
</div>
</form>
</nav>


<script src="a_archivo/Insertar/fecha_hoy.js"></script>