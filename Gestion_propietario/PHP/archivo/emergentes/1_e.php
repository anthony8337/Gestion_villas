
<div id="pro" class="mod">

<div class="centro pro_centro">

<div class="c1">
<h2>Ingresar nuevo propietario</h2>
<button onclick="cerrar_ingreso(),limpiar_confirmar();" type="button">X</button>
</div>

<form id="Formulario_pro">

<div class="c2">
<?php

$pal = ['Nombre completo', 'Numero de identidad','Correo electrónico','Teléfono','Fecha de ingreso'];
$id = ['txtnombre','txtid','txtcorreo','txttelefono','txtfecha_i'];
$tipo = ['text','text','email','text','date','text'];

for ($i=0; $i < count($pal); $i++) {

        echo"
        <fieldset>
        <legend>$pal[$i]</legend>
        <input type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]'>
        </fieldset>
        ";
}

?>
</div>


<div class="c4">

<div class="btn_agregados_form">
<button type="button" onclick="contactos()">Agregar contactos</button>
<button type="button" onclick="selecciona_villa_propi()">Agregar villa</button>
</div>

    <fieldset>
    <legend>Datos de villa</legend>
    <div class="contenido_tabla contenido_tabla_ultima">
        <table id="tabla_villa_pro_selec">
            <thead>
        <tr>
        <th></th>
        <th>Villa</th>
        <th>Número de medidor</th>
        <th>Modelo</th>
        <th>Habitaciones</th>
        <th>Condición</th>
                    </tr>
            </thead>
                    <tbody class="borrar_t">

                    </tbody>
        </table>
        </div>
        </fieldset>

<fieldset class="observaciones">
    <legend>
    Observaciones
    </legend>
<div>
            <textarea id="obs_propietario" name="obs_propietario">

            </textarea>
        </div>
</fieldset>

</div>

<div class = "c3">
    <button type="submit" id="agregar_propietario">Agregar</button>
    <button type="button" onclick="limpiar_opcion();">Limpiar</button>
</div>



</form>


</div>

<div id="respuesta_propietario"></div>
</div>

<script>
 $(document).ready(function(){
        $('#Formulario_pro').submit(function(e){
            e.preventDefault();

            // Obtener los datos de la primera columna de la tabla
            let table = $('#tabla_villa_pro_selec');
            let data = [];

            table.find('tbody tr').each(function() {
                let firstCellText = $(this).find('td').eq(0).text();
                data.push(firstCellText);
            });

            // Añadir los datos de la tabla al formulario
            let formData = $(this).serializeArray();
            formData.push({ name: 'tabla_villa', value: JSON.stringify(data) });

            $.ajax({
                type: 'POST',
                url: 'PHP/archivo/emergentes/subs/accion_propietario/insertar_propietario.php',
                data: $.param(formData),
                success: function(response){
                    $('#respuesta_propietario').html(response);
                    actualizar_propietarios();
                    actualizar_propietarios_cuenta();
                    actualizar_propietarios_multipago();
                    actualizar_villas_propietario(); 
                    actualizar_villas_adicionar();
                }
            });
        });
    });

</script>