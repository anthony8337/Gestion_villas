

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

<table>
    <tr>
        <td rowspan="2">

        

        <div id="ta_cara">
    <?php

    echo"<table id='carac_vi' class='ta_ca_cont'>";

    echo"
    <tr>
    <th>Caracteristicas</th>
    <th><button type='button' onclick='agregarDato_cara()'>Agregar</button></th>
    </tr>
    ";

    echo"</table>";
    
    ?>
    </div>

        </td>
        <td>   
        <fieldset>
            <legend>Dirección</legend>
        <div class="div_otro">
        <textarea class="apo_villa" name="txa_direccion" id="txa_direccion"></textarea>
        </div>
        </fieldset>
        </td>
        </tr>

    <tr>
    <td>   
    <fieldset>
            <legend>Observaciones</legend>
        <div class="div_otro">
        <textarea class="apo_villa" name="txa_observa_villa" id="txa_observa_villa"></textarea>
        </div>
        </fieldset>
        </td>
    </tr>
</table>

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

    let accion = '';

    $('#agregar_villa').click(function() {
        accion = 'crear';
    });

    $('#modificar_concepto').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_concepto').click(function() {
        accion = 'eliminar';
    });

    $('#Formulario_villa').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/archivo/emergentes/subs/accion_villas/insertar_villa.php';
} else if (accion === 'modificar') {
    url = 'PHP/ventana_principal/principales/interno/sql/modificar_conceptos.php';
}   else if (accion === 'eliminar') {
    url = 'PHP/ventana_principal/principales/interno/sql/modificar_conceptos.php';
}     
        $.ajax({
            type: 'POST',
            url: url,
            data: $(this).serialize(),
            success: function(response){
                $('#respuesta_villa').html(response);

                /*
                $.ajax({
            type: 'GET',
            url: 'PHP/archivo/emergentes/subs/accion_moneda/tabla_moneda.php',
            data: $(this).serialize(),
            success: function(response){
                $('#interior_moneda').html(response);
            }
        });*/
            }
        });

    }); 
});
</script>