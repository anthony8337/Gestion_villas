<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_pro.css'>

<div id="lis_pro" class="mod">

<div class="centro">

<div class="c1">

<h2>Reporte de saldos</h2>
<button onclick="cerrar_ingreso_lp()" type="button">X</button>

</div>

<div class="c2">

    <fieldset>
        <legend>Desde</legend>
        <select id="desde_repo_saldo" oninput="actualizar_tabla_saldos()">
        </select>
    </fieldset>

    <fieldset>
        <legend>Hasta</legend>
        <select id="hasta_repo_saldo" oninput="actualizar_tabla_saldos()">
        </select>
    </fieldset>

    <fieldset>
        <legend>Fecha del saldo</legend>
        <input type="date" name="fecha_saldo_actual" id="fecha_saldo_actual" oninput="actualizar_tabla_saldos()">
    </fieldset>

    <fieldset>
        <legend>Seleccionar concepto del saldo</legend>
        <select name="concep_saldo" id="concep_saldo" oninput="actualizar_tabla_saldos(),total_credito_saldo()">
    </select>

    

</fieldset>

</div>
<div class="c4">
<div class="contenido_tabla">
    <table id="td_saldos_cuerpo" class="contenido">
        <tr>
        <th></th>
        <th>Clave</th>
        <th>Nombre</th>
        <th>Al crédito</th>
        <th>Por cobrar</th>
        </tr>

        <tbody id="tb_saldos">
        </tbody>

    </table>
    </div>
</div>

<div class="c3 total_extra">

<fieldset>

<fieldset>
    <legend>Saldo total del crédito</legend>
    <input type="text" name="txt_st_credito" id="txt_st_credito" readonly>
</fieldset>

<fieldset>
    <legend>Saldo total por cobrar</legend>
    <input type="text" name="txt_st_cobrar" id="txt_st_cobrar" readonly>
</fieldset>

<button type="button">Imprimir</button>

</fieldset>
</div>


</div>

</div>