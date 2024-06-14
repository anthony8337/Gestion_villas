

<div id="vi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_vi()" type="button">X</button>
<h2>Ingresar nueva villa</h2>
</div>

<form id="Formulario_villa">
<div class="c2">

<table>
<tr>





<?php

$titulo = ['Número de villa','Contador de eeh','Habitaciones','Area de contrución','Modelo de villa'];
$nombre_id=['txt_cod_villa','txt_eeh_villa','txt_cuarto_vi','txt_construc_vi','sel_villa'];
$tipo = ['number','text','text','text','text'];

for ($i=0; $i < count($titulo); $i++) { 

    if ($i == 0) 
    {
        echo"
        <td>
        <fieldset>
            <legend>$titulo[$i]</legend>
            <select id='cb_grupo' name='cb_grupo'>
            ",
            include "PHP/archivo/emergentes/subs/accion_villas/grupo_villa.php"
            ,"
            </select>
            <input type='$tipo[$i]' name='$nombre_id[$i]' id='$nombre_id[$i]' placeholder='$titulo[$i]' title='$titulo[$i]'>
        </fieldset>
        </td>
        ";
    }else if ($i == count($titulo)-1) 
    {
        echo"
        <td>
        <fieldset>
            <legend>$titulo[$i]</legend>
            <select id='cb_modelo' name='cb_modelo'>
            ",
            include "PHP/archivo/emergentes/subs/accion_villas/grupo_modelo.php"
            ,"
            </select>
        </fieldset>
        </td>
        ";
    }else
    {
        echo"
        <td>
        <fieldset>
            <legend>$titulo[$i]</legend>
            <input type='$tipo[$i]' name='$nombre_id[$i]' id='$nombre_id[$i]' placeholder='$titulo[$i]' title='$titulo[$i]'>
        </fieldset>
        </td>
        ";
    }


}



?>
</tr>
</table>

</div>

<div class="c4">
<div class="c4_interno">
<fieldset>
    <legend>Características</legend>
    <div>
    <table id='carac_vi' class='ta_ca_cont'>
    <tr>
    <th colspan="2"><button type='button' onclick='agregarDato_cara()'>Agregar</button></th>
    </tr>
    <tbody>
        
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

<div class="c3">



<button id="agregar_villa" type="submit">Agregar</button>
</div>

<div id="respuesta_villa"></div>
</form>
</div>

</div>



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
            }
        });
    });
});

</script>

