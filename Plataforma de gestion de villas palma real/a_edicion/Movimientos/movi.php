<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="movi" class="mod">
    <fieldset class="movi">
    <legend class="titulo">Alta de movimientos</legend>
    <span onclick="cerrar_mov()" class="cerrar">&times;</span>
    <br>

    <div>
        <button type="button" class="regis_accion" onclick="abrir_cli_mo()" >Cliente</button>
        <button type="button" class="regis_accion" onclick="abrir_con_mo()" >Documento</button>
        <button type="button" class="regis_accion" >Limpiar</button>


        <fieldset style="width:150px; height: 50px; text-align: center; float: inline-end;" >
        <legend>Numero de factura</legend>

        <table style="height: 100%;">
            <tr>
                <td>
                <label>A10210</label>
                </td>
            </tr>
        </table>
    </fieldset>
    </div>

    <br>


        <fieldset style="width:49%; height: 100px; padding: 0px;">
        
        <table style="height: 100%;">

            <tr>
                <td class="tama_izquierda">
                <label>Codigo: </label>
                </td>
                <td class="tama_derecha">
                <label id="lb_co_m"></label>
                </td>
            </tr>

            <tr>
                <td class="tama_izquierda">
                <label>Nombre: </label>
                </td>

                <td class="tama_derecha">
                <label id="lb_nom_m"></label>
                </td>
            </tr>

            <tr>
                <td class="tama_izquierda">
                <label>Numero: </label>
                </td>
                <td class="tama_derecha">
                <label id="lb_num_m"></label>
                </td>
            </tr>
            

        </table>

    </fieldset>

    <fieldset style="width:49%; height: 100px; padding: 0px;">
        

    <table style="height: 100%;">

    <tr>
        <td class="tama_izquierda">Documento:</td>
        <td class="tama_derecha"><label id="lb_doc_m"></label></td>
    </tr>
        <tr>
            <td class="tama_izquierda">
            <input type="radio" name="rb_tipo" value="Cargo">
            <label>Cargo</label>
        </td>

            <td class="tama_derecha">
            <input type="radio" name="rb_tipo" value="Abono">
            <label>Abono</label>
            </td>
        </tr>
    </table>
</fieldset>

    <fieldset style="width:49%; height: 100px; padding: 0px;">
    <table style="width: 100%;">
            <tr>
                <td class="tama_izquierda">
                <label>Fecha de aplicacion:</label></td>
                <td><input type="date" style="width: 80%;"></td>
            </tr>

            <tr>
                <td class="tama_izquierda">
                <label>Fecha de Vencimiento:</label></td>
                <td><input type="date" style="width: 80%;"></td>
            </tr>
        </table>

    </fieldset>

    <fieldset style="width:49%; height: 100px; padding: 0px;">
        

        <table style="width: 100%; height: 100%;">
            <tr>
                <td class="tama_izquierda">
                <label>Monto:</label></td>
                <td class="tama_derecha"><input type="number" style=" width: 80%;"></td>
            </tr>
        </table>
    </fieldset>

    <button type="button" class="regis_accion" >Guardar</button>

    


    </div>
</form>
</nav>
