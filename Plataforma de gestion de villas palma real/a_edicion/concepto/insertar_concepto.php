<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="inser_concepto" class="mod">
    <fieldset class="mod_inser_con">
    <legend class="titulo">Ingreso de concepto</legend>
    <span onclick="cerrar_co_nuevo()" class="cerrar">&times;</span>
    <br>

    <fieldset style="padding: 0px; width: 216px; text-align: center;">
        <legend>Describir</legend>
        <input type="text" id="txt_d_con" style="width: 80%;">
    </fieldset>

    <fieldset style="padding: 0px; width: 216px; text-align: center;">
        <legend>Tipo</legend>
        <table>
            <tr>
                <td>
                    <select style="width: 80%;" id="sl_tipo">
                    <option>Cargo</option>
                    <option>Abono</option>
                    </select>
                </td>
            </tr>
        </table>
        
    </fieldset>


    <table>
        <tr>
            <td style="width: 50px;"><input type="checkbox" id="ch_tipo"> </td>
            <td style="text-align: start;"><label>Referencia</label></td>
        </tr>
    </table>



    <br>
    <div>
        <button class="btn_nueva_moneda" id="btn_n_c" type="button" onclick="aviso(),cerrar_agre_moneda()">Registar</button>
        <button class="btn_nueva_moneda" id="btn_m_c" type="button" onclick="aviso_modificado(),cerrar_agre_moneda()">Modificar</button>
        <button  id="btn_b_c" type="button" class="borrar" onclick="aviso_eliminado()">Eliminar</button>
    </div>

    </div>
</form>
</nav>