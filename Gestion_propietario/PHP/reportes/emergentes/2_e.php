<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_pro.css'>

<div id="lis_pro" class="mod">

<div class="centro">

<div class="c1">

<h2>Reporte de saldos</h2>
<button onclick="cerrar_ingreso_lp()" type="button">X</button>

</div>

<div class="c2">

<input style="display: none;" type="date" id="fecha_saldo" name="fecha_saldo">

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

<button type="button" onclick="abrirNuevaPagina_saldo()">Imprimir</button>

</fieldset>
</div>


</div>

</div>

<script>
    function abrirNuevaPagina_saldo() {
    // IDs de los inputs que quieres enviar
    var inputIDs = ['fecha_saldo','concep_saldo','hasta_repo_saldo','desde_repo_saldo','fecha_saldo_actual'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "4_saldos.php";
    form.target = "_blank"; // Abre en nueva ventana

    // Añade inputs ocultos para cada valor
    inputIDs.forEach(function(id) {
        var inputValue = document.getElementById(id).value;
        var input = document.createElement("input");
        input.type = "hidden";
        input.name = id;
        input.value = inputValue;
        form.appendChild(input);
    });

    // Envía el formulario
    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);

    
    
}
</script>