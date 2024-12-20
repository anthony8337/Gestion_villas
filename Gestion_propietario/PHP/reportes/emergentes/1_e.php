

<div id="lis_villa" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">
<h2>Reporte de villas</h2>
<button onclick="cerrar_ingreso_lv()" type="button">X</button>
</div>

<div class="c2">


<input style="display: none;" type="date" name="dt_villas" id="dt_villas">

    <fieldset>
            <legend>Desde</legend>
            <select name="desde_reportes_villas" id="desde_reportes_villas" oninput="actualizar_tabla_villa()"></select>
        </fieldset>

        <fieldset>
            <legend>Hasta</legend>
            <select name="hasta_reportes_villas" id="hasta_reportes_villas" oninput="actualizar_tabla_villa()"></select>
        </fieldset>

    <fieldset style="display: none;">
        <legend>Estado</legend>

        <select name="estado_villa" id="estado_villa" oninput="actualizar_tabla_villa()"></select>

    </fieldset>

    <fieldset>
        <legend>Modelo</legend>

        <select name="modelo_villa" id="modelo_villa" oninput="actualizar_tabla_villa()"></select>

    </fieldset>


</div>

<div class="c4">
<div class="contenido_tabla tam_limite">
    <table id="td_villas_cuerpo" class="contenido">
        <tr>
        <th></th>
        <th>Villas</th>
        <th>Propietario</th>
        <th>No. Identidad</th>
        <th>Correo electronico</th>
        <th>Teléfono 1</th>
        <th>Teléfono 2</th>
        <th>Teléfono 3</th>

        </tr>

        <tbody id="tb_villas">
        </tbody>

    </table>
    </div>
</div>

<div class="c3">
<button type="button" onclick="selec_usuario(),var_villas()">Enviar a usuario</button>
<button type="button" onclick="imprime_villas()">Imprimir</button>
</div>

</div>
</div>

<input type="hidden" id="num_usuarios_villa" name="num_usuarios_villa">

<input type="hidden" id="co_usuarios_villa" name="co_usuarios_villa">

<script>

function var_villas()
{
    document.getElementById('identifica_envio').value = "villas";
}

function imprime_villas_correo()
{

    var b = document.getElementById('co_usuarios_villa').value;
    
    if (b == "") 
    {
    window.alert("No se ha seleccionado ningun registro.");    
    }
    else
    {
    var a = confirm("¿Desea enviar e imprimir el registro de villas?");
    if (a)
    {
        

        abrirNuevaPagina_villas_correo();
    }
    }
}


function imprime_villas()
{

    var b = document.getElementById('desde_reportes_villas').value;
    
    if (b == "") 
    {
    window.alert("No se ha seleccionado ningun registro.");    
    }
    else
    {
    var a = confirm("¿Desea imprimir el registro de villas?");
    if (a)
    {
        abrirNuevaPagina_villas();
    }
    }
}

</script>




<script>
    function abrirNuevaPagina_villas() {
    nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['dt_villas','desde_reportes_villas','hasta_reportes_villas',
    'estado_villa','modelo_villa','nombre_usuario'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "5_villas.php";
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

    cerrar_ingreso_lv();
}

function abrirNuevaPagina_villas_correo() {
    nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['dt_villas','desde_reportes_villas','hasta_reportes_villas',
    'estado_villa','modelo_villa','nombre_usuario','num_usuarios_villa','co_usuarios_villa'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "9_villas_correo.php";
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
    cerrar_ingreso_lv();
    cerrar_selec_usuario();
    limpiar_confirmar();

}
</script>