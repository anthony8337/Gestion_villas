<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="agre_moneda" class="mod">
    <fieldset class="mod_ingreso_moneda">
    <legend class="titulo">Ingreso de monedas</legend>
    <span onclick="cerrar_agre_moneda()" class="cerrar">&times;</span>
    <br>

    <fieldset style="padding: 0px; width: 200px; text-align: center;">
        <legend>Descripcion</legend>
        <input type="text" id="txt_d_m" style="width: 80%;">
    </fieldset>

    <fieldset style="padding: 0px; width: 200px; text-align: center;">
        <legend>Simbolo</legend>
        <input type="text" id="txt_s_m" style="width: 80%;">
    </fieldset>

    <fieldset style="padding: 0px; width: 200px; text-align: center;">
        <legend>Valor</legend>
        <input type="number" id="num_v_m" style="width: 80%;">
    </fieldset>

    <br>
    <div>
        <button class="btn_nueva_moneda" id="btn_n_m" type="button" onclick="aviso(),cerrar_agre_moneda()">Registar</button>
        <button class="btn_nueva_moneda" id="btn_m_m" type="button" onclick="aviso_modificado(),cerrar_agre_moneda()">Modificar</button>
        <button  id="btn_b_m" type="button" class="borrar" onclick="aviso_eliminado()">Eliminar</button>
    </div>

    </div>
</form>
</nav>