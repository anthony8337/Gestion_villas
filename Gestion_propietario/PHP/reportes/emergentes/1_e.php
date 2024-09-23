<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_villa.css'>

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

    <fieldset>
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
        <th>Número de contador</th>
        <th>Habitación</th>
        <th>Tamaño de lote</th>
        <th>Modelo</th>
        <th>Estado</th>
        </tr>

        <tbody id="tb_villas">
        </tbody>

    </table>
    </div>
</div>

<div class="c3">
<button type="button" onclick="imprime_villas()">Imprimir</button>
</div>

</div>
</div>



<script>



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
</script>