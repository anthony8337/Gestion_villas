<script>
    actualizar_combo_saldos();
</script>

<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_pro.css'>

<div id="lis_pro" class="mod">

<div class="centro ventanas_grandes">

<div class="c1">

<h2>Reporte de saldos actual</h2>
<button onclick="cerrar_ingreso_lp()" type="button">X</button>

</div>

<form id="form_saldos_propi">

<div class="c2">

    <input type="hidden" name="registro_saldo" id="registro_saldo">

    <input style="display: none;" type="date" id="fecha_saldo" name="fecha_saldo">

    <input type="hidden" id="correo_saldos_excel" name="correo_saldos_excel">




    <fieldset>
        <legend>Desde</legend>
        <select id="desde_repo_saldo" name="desde_repo_saldo" oninput="actualizar_tabla_saldos(),actualizar_combo_saldos()">
        </select>
    </fieldset>

    <fieldset>
        <legend>Hasta</legend>
        <select id="hasta_repo_saldo" name="hasta_repo_saldo" oninput="actualizar_tabla_saldos(),actualizar_combo_saldos()">
        </select>
    </fieldset>

    <fieldset>
        <legend>Fecha del ultimo saldo</legend>
        <input type="date" name="fecha_saldo_actual" id="fecha_saldo_actual" oninput="actualizar_tabla_saldos()">
    </fieldset>

    <fieldset>
        <legend>Seleccionar metodo de concepto</legend>
        <select name="concep_metodo" id="concep_metodo" oninput="actualizar_tabla_saldos(),id_meto(),total_credito_saldo()">
            <option value="Concepto completo">Concepto completo</option>
            <option value="Concepto especifico">Concepto especifico</option>
        </select>
    </fieldset>

    <fieldset id="ff_concepto">
        <legend>Seleccionar concepto del saldo</legend>
        <select name="concep_saldo" id="concep_saldo" oninput="actualizar_tabla_saldos(),total_credito_saldo()"></select>
    </fieldset>

<input type="hidden" name="concep_saldo_villa_desde" id="concep_saldo_villa_desde">

<input type="hidden" name="concep_saldo_villa_hasta" id="concep_saldo_villa_hasta">

    

   


</div>
<div class="c4">
<div class="contenido_tabla tam_limite">
    <table id="td_saldos_cuerpo" class="contenido tabla_saldos_vista">
        <tr>
        <th></th>
        <th>Villa</th>
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

<fieldset class="espacio">

<fieldset>
    <legend>Saldo total del crédito</legend>
    <input type="text" name="txt_st_credito" id="txt_st_credito" readonly>
</fieldset>

<fieldset>
    <legend>Saldo total por cobrar</legend>
    <input type="text" name="txt_st_cobrar" id="txt_st_cobrar" readonly>
</fieldset>


<button type="button" onclick="selec_usuario(),var_saldos()">Enviar a usuario</button>
<button type="button" onclick="actualizar_combo_saldos()" id="btn_excel_estado_propi">Descargar Ecxel</button>
<button type="button" onclick="imprimir_saldos()">Imprimir PDF</button>

</fieldset>
</div>

</form>


</div>

</div>

<script>

function var_saldos()
{
    document.getElementById('identifica_envio').value = "saldos";
}

</script>

<script>

id_meto();

function imprimir_saldos() 
{

    var b = document.getElementById('registro_saldo').value;
    
    if (b == 0 || b == "") 
    {
    window.alert("No se ha seleccionado ningun registro.");    
    }
    else{
 
var a = confirm("¿Deseas imprimir el reporte de los saldos?");
if (a) 
{
    abrirNuevaPagina_saldo();
}
}


}

actualizar_tabla_saldos();

</script>


<input type="hidden" name="co_usu_saldo" id="co_usu_saldo">

<script>

function imprime_saldo_correo()
{

    var b = document.getElementById('co_usuario_selec').value;

    document.getElementById('co_usu_saldo').value = b;
    
    if (b == "") 
    {
    window.alert("No se ha seleccionado ningun registro.");    
    }
    else
    {
    var a = confirm("¿Desea enviar e imprimir el registro de saldos?");
    if (a)
    {
        

        abrirNuevaPagina_saldo_correo();
    }
    }
}

</script>

<script>
    function abrirNuevaPagina_saldo() {
    nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['fecha_saldo','concep_saldo','hasta_repo_saldo',
    'desde_repo_saldo','fecha_saldo_actual','concep_metodo','nombre_usuario'];
    
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

    cerrar_ingreso_lp();

}

function abrirNuevaPagina_saldo_correo() {
    nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['fecha_saldo','concep_saldo','hasta_repo_saldo',
    'desde_repo_saldo','fecha_saldo_actual','concep_metodo','nombre_usuario','co_usu_saldo'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "10_saldos_correo.php";
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

    document.getElementById('sl_usuarios').value = '0';
    cerrar_selec_usuario();
    cerrar_ingreso_lp();
    limpiar_confirmar();

}
</script>

<script>
    $(document).ready(function () {
    $("#btn_excel_estado_propi").click(function () {




        var formData = $("#form_saldos_propi").serialize();
        actualizar_combo_saldos();
        window.location.href = "PHP/reportes/emergentes/excel_php_saldos.php?" + formData;
    });
});
</script>

