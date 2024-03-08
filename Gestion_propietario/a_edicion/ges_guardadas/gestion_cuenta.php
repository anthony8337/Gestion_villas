<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="G_cuenta" class="mod">
    <fieldset class="g_cuenta">
    <legend class="titulo">Generacion de cuentas por cobrar</legend>
    <span onclick="cerrar_ges()" class="cerrar">&times;</span>
    <br>

    <div >
    <button id="cli_ges" type="button" class="botones_generar">Cliente</button>
    <button type="button" class="botones_generar">Documento</button>
    <button type="button" class="botones_generar">Limpiar</button>

    <fieldset style="padding: 0px; text-align: center; width: 200px; float: inline-end;">
        <legend>Numero Factura</legend>

        <table style="height: 100%;">
            <tr>
                <td>
                <label>A10210</label>
                </td>
            </tr>
        </table>
    </fieldset>

    <fieldset style="border: 0px; padding: 0px; text-align: center; height: 50px; width: 380px; float: inline-end;">
        

        <table style="height: 100%;">
            <tr>
            <td>
                <input type="radio" name="r_tipo" id="r_unico" checked>Agregar a unico
            </td>

            <td>
                <input type="radio" name="r_tipo" id="r_rango">Agregar en rango
            </td>
            </tr>
        </table>
    </fieldset>

    </div>
    <br>


    <br>
    <div style=" height: 100px;">
    <fieldset id="unico" style="padding: 0px; height: 120px; width: 48.5%; text-align: center;">
    <legend>Codigo: <label>A-1</label></legend>
    <table style="height: 100%;">
        <tr>
            <td>
                Nombre:
            </td>
            <td>
                <label>Anthony Clemente Oliva Murillo</label>
            </td>
        </tr>

        <tr>
            <td>
                Numero:
            </td>
            <td>
                <label>94856463</label>
            </td>
        </tr>
    </table>
    </fieldset>

    <fieldset id="rango" style="padding: 0px; height: 120px; width: 48.5%; text-align: center;">
    <legend>Rango</legend>
    <table style="height: 100%;">
        <tr>
            <td>
                Desde
            </td>
            <td>
                <select>
                    <option value=""></option>
                </select>
            </td>
            <td>
            <button type="button" style="padding: 0px;"> <img src="imagenes/lupa.png" width="32px" height="32px"> </button>
            </td>
        </tr>

        <tr>
            <td>
                Hasta
            </td>
            <td>
                <select>
                    <option value=""></option>
                </select>
            </td>
            <td>
                <button type="button" style="padding: 0px;"> <img src="imagenes/lupa.png" width="32px" height="32px"> </button>
            </td>
        </tr>
    </table>
    </fieldset>

    <fieldset style="padding: 0px; height: 120px; width: 48.5%; float: inline-end; text-align: center;">
    <legend>Documento</legend>
    <table style="height: 100%;">
        
        <tr>
            <td colspan="2">
                <input type="text" style="width: 80%; padding-bottom: 0px;" placeholder="Concepto seleccionado" disabled>
            </td>
        </tr>

        <tr>
            <td>
                <input type="radio" name="r_docu" id="" checked>Cargo
            </td>

            <td>
            <input type="radio" name="r_docu" id="">Abono
            </td>
        </tr>
    </table>
    </fieldset>
    </div>
    

    <br>
    <div style=" height: 100px;">
    <fieldset style="padding: 0px; height: 150px; width: 48.5%; text-align: center;">
    <legend>Fecha</legend>
    <table style="height: 100%;">
        <tr>
            <td>
                Desde:
            </td>
            <td>
                <input type="date" name="" id="">
            </td>
        </tr>

        <tr>
            <td>
                Hasta
            </td>
            <td>
            <input type="date" name="" id="">
            </td>
        </tr>
    </table>
    </fieldset>

    <fieldset id="monto" style="padding: 0px; height: 150px; width: 48.5%; float: inline-end; text-align: center;">
    <legend>Monto</legend>
    <table style="height: 100%;">
        
        <tr>
            <td colspan="2">
                <input type="text" style="width: 80%; padding-bottom: 0px; color: black;" placeholder="Monto mensual" disabled>
            </td>
        </tr>
    </table>
    </fieldset>
    </div>

    <fieldset style="background-color: transparent; border: 0px;">
    <button type="button" class="botones_generar">Guardar</button>
    
    <button type="button" class="botones_generar">Cancelar</button>
    </fieldset>
    
    
    </fieldset>
    </div>
    </form>
    </nav>


    <script src="a_edicion/ges_guardadas/habilitar.js"></script>