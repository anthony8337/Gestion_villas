<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_reimprimir.css'>

<div id="lis_pro_sal" class="mod">

<div class="centro ventanas_grandes">

<div class="c1">
<h2>Estados de cuenta de propietario</h2>
<button onclick="cerrar_ingreso_lp_sal(),limpiar_confirmar()" type="button">X</button>
</div>

<form id="form_estados">

<div class="c2">

<fieldset>
<legend style="visibility: hidden;">boton</legend>
<button type="button" class="btn_re" onclick="selec_pro_estado()">Propietario</button>
</fieldset>

<input type="hidden" id="id_pro_sc" name="id_pro_sc">

<fieldset>
        <legend>Código</legend>
        <input type="text" name="txt_propi_estados" id="txt_propi_estados" readonly>
</fieldset>

<fieldset>
        <legend>Propietario</legend>
        <input type="text" name="txt_cod_estados" id="txt_cod_estados" readonly>
        
</fieldset>

<fieldset>
        <legend>Correo</legend>
        <input type="text" name="txt_correo_estados" id="txt_correo_estados" readonly>
        
</fieldset>
    
<fieldset>
        <legend>Fecha</legend>
        <input type="date" name="fecha_estado_hoy" id="fecha_estado_hoy" readonly>
</fieldset>

</div>

<div class="c2 c2_estado_cuenta">

<fieldset>
        <legend>Indicar concepto</legend>
        <select name="todo_cuota" id="todo_cuota" oninput="ocultar_concep(),seleccionar_conceptos_cuenta(),tabla_estado_cuenta()">
            <option value="Historial completo">Historial completo</option>
            <option value="Concepto específico">Concepto específico</option>
        </select>
</fieldset>

<fieldset id="indi_concepto">
        <legend>Seleccionar concepto</legend>
        <select name="rango_cuota" id="rango_cuota" oninput="tabla_estado_cuenta()">
        </select>
</fieldset>

<fieldset>
        <legend>Indicar fecha de pago</legend>
        <select name="ranco_factura" id="ranco_factura" oninput="ocultar_fecha(),tabla_estado_cuenta()">
        <option value="Historial completo">Historial completo</option>
        <option value="Periodo de fecha">Periodo de fecha</option>
    </select>
</fieldset>

<fieldset id="f_desde_sc">
    <legend>Desde</legend>
        <input type="date" name="desde_estado" id="desde_estado" oninput="tabla_estado_cuenta()">
    </fieldset>

    <fieldset id="f_hasta_sc">
    <legend>Hasta</legend>
    <input type="date" name="hasta_estado" id="hasta_estado" oninput="tabla_estado_cuenta()">
    </fieldset>

</div>

<div class="c4">
<div class="contenido_tabla tam_limite">
    <table id="td_estados_cuerpo" class="contenido">
        <tr>
        <th></th>
        <th>Fecha aplicada</th>
        <th>Código</th>
        <th>Concepto</th>
        <th>Descripción</th>
        <th>Cargo</th>
        <th>Abono</th>
        <th>Total</th>
        </tr>

        <tbody id="tb_estados" class="borrar_t">

        </tbody>

    </table>
    </div>
</div>

<div class="c3">

<fieldset>
    <legend>Estado Total</legend>
<input type="text" name="txt_resutado_estado" id="txt_resutado_estado" readonly>
</fieldset>


</div>

<div class="c3">

<button type="button" onclick="selec_usuario(),var_estado()">Enviar a usuario</button>
<button type="button" onclick="decidir_estado_cuenta()">Imprimir</button>

</div>

</form>

<div id="respuesta_estados"></div>

</div>

</div>

<label style="display: none;" id="lb_cel_re"></label>

<script>
ocultar_fecha();
ocultar_concep();
</script>


<input type="hidden" id="co_estado_cuenta" name="co_estado_cuenta">


<script>

function imprime_estado_correo()
{
    
    var b = document.getElementById('co_usuario_selec').value;

    document.getElementById('co_estado_cuenta').value = b;
    
    if (b == "") 
    {
    window.alert("No se ha seleccionado ningun registro.");    
    }
    else
    {
    var a = confirm("¿Desea enviar e imprimir el estado de cuenta?");
    if (a)
    {
        

        abrirNuevaPagina_estado_correo_usuario();
    }
    }
}

</script>

<script>

function var_estado()
{
    document.getElementById('identifica_envio').value = "estado_cuenta";
}

</script>

<script>
    function decidir_estado_cuenta()
    {

        var b = document.getElementById("id_pro_sc").value;
        var c = document.getElementById("txt_correo_estados").value;

        if(b == "")
        {
            window.alert("Por favor, seleccione un propietario.");
        }
        else
        {

            if(c == "")
            {

            var a = confirm("¿Esta seguro de imprimir el estado de cuenta?");
        if(a)
        {
            abrirNuevaPagina_estado();
        }
    }else
    {
        var a = confirm("Este propietario posee correo electronico \n¿Desea enviar el recibo al correo electronico e imprimirlo?");

        if(a)
        {
            abrirNuevaPagina_estado_correo();
        }
    }
    }
    }

    function abrirNuevaPagina_estado() {
        nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['rango_cuota','ranco_factura','desde_estado','hasta_estado','fecha_estado_hoy'
        ,'txt_cod_estados' ,'txt_propi_estados','id_pro_sc','todo_cuota','nombre_usuario','txt_correo_estados'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "3_estado_cuenta.php";
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

    limpiar_confirmar();
    cerrar_ingreso_lp_sal();
    
}

function abrirNuevaPagina_estado_correo() {
        nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['rango_cuota','ranco_factura','desde_estado','hasta_estado','fecha_estado_hoy'
        ,'txt_cod_estados' ,'txt_propi_estados','id_pro_sc','todo_cuota','nombre_usuario','txt_correo_estados'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "8_estado_cuenta_correo.php";
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

    limpiar_confirmar();
    cerrar_ingreso_lp_sal();
    
}

function abrirNuevaPagina_estado_correo_usuario() {
        nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['rango_cuota','ranco_factura','desde_estado','hasta_estado','fecha_estado_hoy'
        ,'txt_cod_estados' ,'txt_propi_estados','id_pro_sc','todo_cuota','nombre_usuario','txt_correo_estados'
        ,'co_estado_cuenta'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "11_estado_cuenta_correo_usuario.php";
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
    cerrar_ingreso_lp_sal();
    
}
</script>
