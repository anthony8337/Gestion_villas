
<div id="pro" class="mod">

<div class="centro pro_centro ventanas_medianas_propi">

<div class="c1">
<h2 id="tl_titulo">Ingresar nuevo propietario</h2>
<button onclick="cerrar_ingreso(),limpiar_confirmar(),actualizar_tabla_villa_pro()" type="button">X</button>
</div>

<form id="Formulario_pro">

<input type="hidden" id="id_propi_1" name="id_propi_1">
<input type="hidden" id="id_unir_pro1" name="id_unir_pro1">
<input type="hidden" id="id_villa_pro1" name="id_villa_pro1">


<fieldset>
<legend>Datos del propietario</legend>
<div class="c2">

<fieldset>
<legend>Nombre completo</legend>
<input type='text' id = 'txtnombre' name = 'txtnombre' placeholder='Nombre completo' title='Nombre completo' required>
</fieldset>

<fieldset>
<legend>Número de identidad</legend>
<input class="solo_numero" type='text' id = 'txtid' name = 'txtid' placeholder='Número de identidad' title='Número de identidad'>
</fieldset>

<fieldset>
<legend>Fecha de nacimiento</legend>
<input type='date' id = 'txtfecha_i' name = 'txtfecha_i' placeholder='Fecha de nacimiento' title='Fecha de nacimiento' required>
</fieldset>

</div>

<div class="c2">

<fieldset>
<legend>Correo electrónico</legend>
<input type='email' id = 'txtcorreo' name = 'txtcorreo' placeholder='Correo electrónico' title='Correo electrónico'>
</fieldset>

<fieldset>
<legend>Teléfono 1</legend>
<input class="solo_numero" type='text' id = 'txttelefono' name = 'txttelefono' placeholder='Teléfono 1' title='Teléfono 1'>
</fieldset>

<fieldset>
<legend>Teléfono 2</legend>
<input class="solo_numero" type='text' id = 'txttelefono2' name = 'txttelefono2' placeholder='Teléfono 2' title='Teléfono 2'>
</fieldset>

<fieldset>
<legend>Teléfono 3</legend>
<input class="solo_numero" type='text' id = 'txttelefono3' name = 'txttelefono3' placeholder='Teléfono 3' title='Teléfono 3'>
</fieldset>

</div>
</fieldset>

<fieldset>
    <legend>Datos de la villa</legend>

<div class="c2">

<fieldset class="a_gru_villa" style="max-width: 100px;">
<legend>Villa</legend>
<select name="cb_grupo_villa" id="cb_grupo_villa">
    <?php
    include "PHP/archivo/emergentes/subs/accion_villas/grupo_villa.php"
    ?>
</select>
-
<input class="solo_numero" type='text' id = 'txt_n_villa' name = 'txt_n_villa' placeholder='Villa' title='Villa' required>
</fieldset>

        <fieldset>
            <legend>Modelo</legend>
            <select id='cb_mo_propi' name='cb_mo_propi'>
         
            <?php
            include "PHP/archivo/emergentes/subs/accion_villas/grupo_modelo.php";
            ?>
            
            </select>
        </fieldset>

        <fieldset>
<legend>Contador ENEE</legend>
<input type='text' id = 'txt_c_enee' name = 'txt_c_enee' placeholder='Contador ENEE' title='Contador ENEE' required>
</fieldset>        

<fieldset>
<legend>Numéro de habitaciones</legend>
<input class="solo_numero" type='text' id = 'txtnh' name = 'txtnh' placeholder='Numéro de habitaciones' title='Numéro de habitaciones' required>
</fieldset>

<fieldset>
<legend>Numéro de baños</legend>
<input class="solo_numero" type='text' id = 'txtbanio' name = 'txtbanio' placeholder='Numéro de baños' title='Numéro de baños' required>
</fieldset>


<fieldset>
<legend>Fecha de construcción</legend>
<input type='date' id = 'dt_fc' name = 'dt_fc' placeholder='Fecha de construcción' title='Fecha de construcción'>
</fieldset>



</div>
</fieldset>

<fieldset id="perso_auto_propi">
    <legend>Personas autorizadas a ingresar</legend>
    <div class="c2">

    <fieldset>
    <legend>Nombre</legend>
    <input type='text' id = 'txt_nom_x' name = 'txt_nom_x' placeholder='Nombre' title='Nombre'>
    </fieldset>

    <fieldset>
    <legend>Teléfono</legend>
    <input class="solo_numero" type='text' id = 'txt_tex_x' name = 'txt_tex_x' placeholder='Teléfono' title='Teléfono'>
    </fieldset>
    
    <fieldset>
    <legend>Correo</legend>
    <input type='email' id = 'txt_cor_x' name = 'txt_cor_x' placeholder='Correo' title='Correo'>
    </fieldset>

    <fieldset>
    <legend style="visibility: hidden;">Correo</legend>
    <button type="button" onclick="agregarDatos()">Agregar</button>
    </fieldset>
    </div>

    <div class="c4">
        <div id="div_tabla_villas_pro" class="contenido_tabla contenido_tabla_ultima">

<input type="hidden" name="pro_villa_cont" id="pro_villa_cont" value= "0">
    <table id="pro_autorizados">
    <tr>
    <th></th>
    <th style="width: 33%;">Nombre</th>
    <th style="width: 33%;">Número de teléfono</th>
    <th style="width: 33%;">Correo electronico</th>
                </tr>
        
                <tbody class="borrar_t">

                </tbody>
    </table>
    </div>
    </div>
</fieldset>

<fieldset>
<legend>Observaciones</legend>
<div class="c2">
<fieldset>
    <textarea id="obs_propietario" name="obs_propietario">
</textarea>
</div>
</fieldset>



<div class="c4">

<div class="btn_agregados_form">

</div>

</div>

<div class = "c3">
<button type="submit" onclick="limpiar_opcion();" id="limpiar_propietario">Limpiar</button>
<button type="submit" id="agregar_propietario">Agregar</button>
<button class="oculto"  onclick="eliminar_propi()" type="submit" id="eliminar_propietario">Eliminar</button>
<button class="oculto" type="submit" id="modificar_propietario">Modificar</button>
</div>



</form>


</div>

<div id="respuesta_propietario"></div>
</div>

<script>
        $(document).ready(function() {

            var accion = '';

            $('#agregar_propietario').click(function() {
            accion = 'crear';
            });

            $('#modificar_propietario').click(function() {
            accion = 'editar';
            });


            $("#Formulario_pro").submit(function(e) {
                e.preventDefault(); // Evita que se recargue la página
                
                // Obtener los datos de todas las columnas de la tabla
let table = $('#pro_autorizados');
let data = [];

table.find('tbody tr').each(function() {
    let row = {
        columna1: $(this).find('td').eq(1).text(),
        columna2: $(this).find('td').eq(2).text(),
        columna3: $(this).find('td').eq(3).text()
    };
    data.push(row);
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'pro_autorizados', value: JSON.stringify(data) });



var link = '';

if(accion == "crear")
{
    link = "PHP/archivo/emergentes/subs/accion_propietario/insertar_propietario.php";
}else if(accion == "editar")
{
    link = "PHP/archivo/emergentes/subs/accion_propietario/modificar_propietario.php";
}

$.ajax({
    url: link,
    type: "POST",
    data: formData,
    success: function(respuesta) {
        $("#respuesta_propietario").html(respuesta);
    }
});



            });
        });
    </script>

    <script src="JS\perso_autorizadas.js"></script>