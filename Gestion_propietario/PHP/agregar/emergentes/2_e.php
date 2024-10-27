<div id="div_multipago" class="mod">

<div class="centro ventanas_muy_grandes">
<div class="c1">
<h2>Pago múltiple</h2>
<button onclick="cerrar_crear_multipago(),limpiar_confirmar(),recargar_tabla_multi()" type="button">X</button>
</div>

<form id="formulario_datos_multi">

<div class="c2">

    <?php
    $nombre=["Propietario","Limpiar","Ejecutar Pago"];
    $id=["btn_propi_multi","btn_limpiar_multi","btn_pago_multi"];
    $accion=["sele_pro_multi()","limpiar_confirmar(),recargar_tabla_multi(),limpiar_confirmar()",""];
    $tipo=["button","button","submit"];

    for($i = 0; $i < count($nombre); $i++)
    {
        echo"
        <button type='$tipo[$i]' id='$id[$i]' name='$id[$i]' onclick='$accion[$i]' >$nombre[$i]</button>
        ";
    }
    ?>

</div>


<div class="c4">

    <fieldset>
        <legend>Villa: <span id="sp_codigo_multi" name="sp_codigo_multi"></span></legend>
        <input type="hidden" id="codigo_villa_multi" name="codigo_villa_multi">
        <input type="hidden" name="hd_id_propietario" id="hd_id_propietario">
        <input type="hidden" name="hd_id_cuenta" id="hd_id_cuenta">
        <input type="hidden" name="hd_id_concepto" id="hd_id_concepto">
        <input type="hidden" name="hd_concepto_pago" id="hd_concepto_pago">
        <input type="hidden" name="hd_grupo" id="hd_grupo">

        
        

        <?php
        $nombre_dato = ['Nombre','Teléfono','Correo','Saldo'];
        $id_datos = ['txt_mn','txt_tl','hd_correo','txt_sal'];

        for ($i=0; $i < count($nombre_dato); $i++) { 
        echo"
            <fieldset>
            <legend>$nombre_dato[$i]</legend>
            <input type='text' name='$id_datos[$i]' id='$id_datos[$i]' readonly>
            </fieldset>
        ";
    }
        ?>

<fieldset id="dato_multi">
        <legend>Código de pago</legend>
        <input type="number" id="txt_cod_m" name="txt_cod_m" readonly value="<?php include "PHP/agregar/emergentes/subs/accion_generar/codigo_factura_multi.php"; ?>">
        <input type="date" id="txt_fecha_m" name="txt_fecha_m" readonly>
    </fieldset>


    </fieldset>
</div>

<div class="c4">
<span>Concepto de pago: </span> <span name="con_pago_multi" id="con_pago_multi"></span>
<br>
<div id="respuesta_cuenta_multi" class="contenido_tabla tabla_multi_cuentas contenido_tabla_ultima">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php";
    ?>
    
</div>

</div>

<div class="c5">

<div class="c4_acomodado_multi cuentas_multi_botones">

<button type='button' onclick="recargar_tabla_multi()">Recargar cuentas</button>

<button type='button' onclick="sele_cuentas()">Seleccionar cuentas</button>

<button type="button" onclick="sele_con_multi(),actualizar_tabla_conce_multi()">Cambiar concepto</button>

</div>



<div class="c4_acomodado_multi">

<input type="hidden" name="hd_tipo_pago" id="hd_tipo_pago">

    <fieldset>
    <legend>Total a pagar</legend>
    <input type="text" name="total_multi" id="total_multi" placeholder="Total a pagar" readonly>
    </fieldset>

    <fieldset id="fl_mp_b1">
    <legend>Cantidad recibida</legend>
    <input type="text" name="can_multi" id="can_multi" oninput="sumarInputs()" placeholder="Cantidad recibida">
    </fieldset>

    <fieldset id="fl_mp_a1" class="cortar_multi">
    <legend>Forma de pago</legend>
    <input type="text" name="txt_forma_pp" id="txt_forma_pp" placeholder="Forma de pago" readonly>
    </fieldset>

    <fieldset id="fl_mp_a2" class="cortar_multi">
    <legend>Número de referencia</legend>
    <input type="text" name="txt_nu_referencia" id="txt_nu_referencia" placeholder="Número de referencia" readonly>
    </fieldset>

    <fieldset id="fl_mp_b2">
    <legend>Cantidad a devolver</legend>
    <input type="text" name="devo_multi" id="devo_multi" placeholder="Cantidad a devulver" readonly>
    </fieldset>

</div>

</div>

<div id="respuesta_multi"></div>

</form>

</div>

</div>

<script>

$(document).ready(function(){
    
    $('#formulario_datos_multi').submit(function(e){
        e.preventDefault();

       var a1 = document.getElementById("codigo_villa_multi").value;
       var a2 = document.getElementById("hd_id_propietario" ).value;
       var a3 = document.getElementById("hd_id_cuenta" ).value;
       var a4 = document.getElementById("hd_id_concepto" ).value;
       var a5 = document.getElementById("hd_concepto_pago" ).value;
       var a6 = document.getElementById("hd_grupo").value;
       

       if(a6 == "")
       {

       if( a1 == "" || a2 == "" || a3 == "" || a4 == "" || a5 == "")
       {
        window.alert("Por favor, complete todos los campos.");
       }
       else
       {

        var a = confirm("¿Esta seguro de continuar el pago?");

        if (a) 
        {

        var id_cuenta = document.getElementById('hd_id_cuenta').value;

    if(id_cuenta != "")
    {

    var form =$('#formulario_datos_multi').serialize();
    $.ajax({
    type: 'POST',
    url : 'PHP/agregar/emergentes/subs/accion_generar/insertar_multipago.php',
    data: form,
    success: function(response){
        $('#respuesta_multi').html(response);
    }

});


    }
    else
    {
        let table = $('#multi_tabla_cuentas');
        let data = [];

        table.find('tbody tr').each(function() {
            let firstCellText = $(this).find('td').eq(0).text().trim(); // Trim elimina espacios en blanco
            if (firstCellText) { // Solo agrega si no está vacío
                data.push(firstCellText);
            }
        });

        // Añadir los datos de la tabla al formulario
        let formData = $(this).serializeArray();
        formData.push({ name: 'tabla_cuenta_multi', value: JSON.stringify(data) });
    
    $.ajax({
        type: 'POST',
        url : 'PHP/agregar/emergentes/subs/accion_generar/insertar_multipago_grupo.php',
        data: $.param(formData),
        success: function(response){
            $('#respuesta_multi').html(response);
        }
    });
    
    }
       }


    }
}
    else
    {
        var a = confirm("¿Esta seguro de continuar el pago?");

        if (a) {

        var id_cuenta = document.getElementById('hd_id_cuenta').value;

    if(id_cuenta != "")
    {

    var form =$('#formulario_datos_multi').serialize();
    $.ajax({
    type: 'POST',
    url : 'PHP/agregar/emergentes/subs/accion_generar/insertar_multipago.php',
    data: form,
    success: function(response){
        $('#respuesta_multi').html(response);
    }

});


    }
    else
    {
        let table = $('#multi_tabla_cuentas');
        let data = [];

        table.find('tbody tr').each(function() {
            let firstCellText = $(this).find('td').eq(0).text().trim(); // Trim elimina espacios en blanco
            if (firstCellText) { // Solo agrega si no está vacío
                data.push(firstCellText);
            }
        });

        // Añadir los datos de la tabla al formulario
        let formData = $(this).serializeArray();
        formData.push({ name: 'tabla_cuenta_multi', value: JSON.stringify(data) });
    
    $.ajax({
        type: 'POST',
        url : 'PHP/agregar/emergentes/subs/accion_generar/insertar_multipago_grupo.php',
        data: $.param(formData),
        success: function(response){
            $('#respuesta_multi').html(response);
        }
    });
    
    }
       

    }
}

    });
});

</script>

<script>

    function saber_correo()
    {
        var a7 = document.getElementById("hd_correo").value;

        if(a7 != "")
        {
            var b = confirm("Este propietario posee correo electronico \n¿Desea enviar el recibo al correo electronico e imprimirlo?");
            if (b) 
            {
                abrirNuevaPagina_miltipago_correo();
            }
            else
            {
                abrirNuevaPagina_miltipago();
            }

        }
            else
            {
                abrirNuevaPagina_miltipago();
            }
    }


    function abrirNuevaPagina_miltipago() {
    
    nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['txt_cod_m','txt_mn','codigo_villa_multi','txt_fecha_m','hd_grupo',
    'total_multi','devo_multi','nombre_usuario','can_multi','hd_correo'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "2_multipago.php";
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
}


function abrirNuevaPagina_miltipago_correo() {
    
    nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['txt_cod_m','txt_mn','codigo_villa_multi','txt_fecha_m','hd_grupo',
    'total_multi','devo_multi','nombre_usuario','can_multi','hd_correo'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "6_multipago_correo.php";
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