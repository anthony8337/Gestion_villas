
<div id="vi" class="mod">

<div class="centro ventanas_grandes">

<div class="c1">
<h2 id="titulo_villa">Ingresar nueva villa</h2>
<button onclick="cerrar_ingreso_vi(),limpiar_confirmar();" type="button">X</button>

</div>

<form id="Formulario_villa">
<div class="c2">

<input type="hidden" id="id_villa_super" name="id_villa_super">

<?php

$titulo = ['Número de villa','Número de medidor','Habitaciones','Area de construcción (metros)','Modelo de villa'];
$nombre_id=['txt_cod_villa','txt_eeh_villa','txt_cuarto_vi','txt_construc_vi','sel_villa'];
$tipo = ['text','text','text','text','text'];

for ($i=0; $i < count($titulo); $i++) { 

    if ($i == 0) 
    {
        echo"
        <fieldset class='contenido_fieldset'>
            <legend>$titulo[$i]</legend>
            <select id='cb_grupo' name='cb_grupo' >
            ",
            include "PHP/archivo/emergentes/subs/accion_villas/grupo_villa.php"
            ,"
            </select>
            <input  type='$tipo[$i]' name='$nombre_id[$i]' id='$nombre_id[$i]' placeholder='$titulo[$i]' title='$titulo[$i]' class='solo_numero'>
        </fieldset>
        ";
    }else if ($i == count($titulo)-1) 
    {
        echo"
        <fieldset>
            <legend>$titulo[$i]</legend>
            <select id='cb_modelo' name='cb_modelo'>
            ",
            include "PHP/archivo/emergentes/subs/accion_villas/grupo_modelo.php"
            ,"
            </select>
        </fieldset>
        ";
    }else{
        
        echo"
        <fieldset>
            <legend>$titulo[$i]</legend>
            <input type='$tipo[$i]' name='$nombre_id[$i]' id='$nombre_id[$i]' placeholder='$titulo[$i]' title='$titulo[$i]' class='solo_numero'>
        </fieldset>
        ";
}
    


}



?>

</div>

<div class="c4">
<div class="c4_interno">
<fieldset class="carac_opcion">
    <legend>Características</legend>
    <button type='button' onclick='agregarDato_cara()'>Agregar</button>
    <div id="carac_villa_partes" class="contenido_tabla contenido_tabla_ultima contenido_tabla_carac">
    <table id='carac_vi' class='ta_ca_cont'>
    <tbody class='borrar_t'>
    </tbody>
    </table>
    </div>
</fieldset>

</div>
<!--/////////-->
<div class="c4_interno">
<fieldset>
    <legend>Dirección</legend>
    <textarea class="apo_villa" name="txa_direccion" id="txa_direccion"></textarea>
</fieldset>

<fieldset>
    <legend>Observaciones</legend>
    <textarea class="apo_villa" name="txa_observa_villa" id="txa_observa_villa"></textarea>
</fieldset>
</div>


</div>



<div id="respuesta_villa_prin"></div>
</form>

<div class="c3">

<button id="btn_eli_villa" type="button" onclick="eliminar_propi_1()">Eliminar</button>

<button id="btn_modi_villa" type="button" onclick="actualizar_villa_1()">Modificar</button>

<button id="btn_limpiar_villa" type="button" onclick="limpiar_opcion();">Limpiar</button>

<button id="btn_agregar_villa" type="button" onclick="insertar_villa_1()">Agregar</button>


</div>
</div>

</div>


<!--
<script>
 $(document).ready(function(){
    $('#Formulario_villa').submit(function(e){
        e.preventDefault();

        // Obtener los datos de la primera columna de la tabla
        let table = $('#carac_vi');
        let data = [];

        table.find('tbody tr').each(function() {
            let firstCellText = $(this).find('td').eq(0).text().trim(); // Trim elimina espacios en blanco
            if (firstCellText) { // Solo agrega si no está vacío
                data.push(firstCellText);
            }
        });

        // Añadir los datos de la tabla al formulario
        let formData = $(this).serializeArray();
        formData.push({ name: 'tabla_villa_carac', value: JSON.stringify(data) });

        $.ajax({
            type: 'POST',
            url : 'PHP/archivo/emergentes/subs/accion_villas/insertar_villa.php',
            data: $.param(formData),
            success: function(response){
                $('#respuesta_villa').html(response);
                actualizar_villas_propietario(); 
                actualizar_villas_adicionar();
                eliminarTodosDatos_contac();
            }
        });
    });
});

</script>
-->