<div id="cambio_villa" class="mod">

<div class="centro">

<div class="c1">
<h2>Intercambio de propietario de villa</h2>
<button onclick="limpiar_confirmar(),lim_tabla_donantes(),v_cambio_cerrar()" type="button">X</button>
</div>

<form id="Formulario_intercambio">
<div class="c2">

<fieldset class="cambio_villa">
    <legend>Donante de villa</legend>


<?php

$pal = ['Seleccionar','Nombre completo', 'Numero de identidad','Correo electrónico','Teléfono'];
$id = ['','txtnombre_do','txtrtn_do','txtcorreo_do','txttelefono_do'];
$tipo = ['button','text','text','text','text'];

for ($i=0; $i < count($pal); $i++) {

    if ($i == 0) {
        echo"
        <fieldset>
        <legend>Seleccionar</legend>
        <button type='button' onclick='abrir_pro_donar()'>Donante</button>
        </fieldset>
        ";
    }else {
        echo"
        <fieldset>
        <legend>$pal[$i]</legend>
        <input type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]' readonly required>
        </fieldset>
        ";
    }
}

?>
</fieldset>

</div>

<div class="c4">
    <fieldset>
    <div class="contenido_tabla">
        <table id="tabla_donante_villa">
            <thead>
        <tr>
        <th></th>
        <th>Villa</th>
        <th>Número de medidor</th>
        <th>Habitaciones</th>
        <th>Modelo</th>
        <th>Condición</th>
                    </tr>
            </thead>
                    <tbody class="borrar_t" id="tb_villas_donador">

                    </tbody>
        </table>
        </div>
        </fieldset>
</div>


<div class="c2">
<fieldset class="cambio_villa">
    <legend>Destino de villa</legend>

<input type="hidden" name="id_rec_pro" id="id_rec_pro">
<input type="date" name="txt_fecha_rec" id="txt_fecha_rec" class="interno">

<?php

$pal = ['Seleccionar','Nombre completo', 'Numero de identidad','Correo electrónico','Teléfono'];
$id = ['','txtnombre_rec','txtrtn_rec','txtcorreo_rec','txttelefono_rec'];
$tipo = ['button','text','text','text','text'];

for ($i=0; $i < count($pal); $i++) {

    if ($i == 0) {
        echo"
        <fieldset>
        <legend>Seleccionar</legend>
        <button type='button' onclick='abrir_pro_recibir()'>Destino</button>
        </fieldset>
        ";
    }else {
        echo"
        <fieldset>
        <legend>$pal[$i]</legend>
        <input type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]' readonly required>
        </fieldset>
        ";
    }
}

?>
</fieldset>
</div>

<div class="c4">
    <fieldset>
    <div class="contenido_tabla">
        <table id="tabla_destino_villa">
            <thead>
        <tr>
        <th></th>
        <th>Villa</th>
        <th>Número de medidor</th>
        <th>Habitaciones</th>
        <th>Modelo</th>
        <th>Condición</th>
                    </tr>
            </thead>
                    <tbody class="borrar_t">

                    </tbody>
        </table>
        </div>
        </fieldset>
</div>

<div class="c3">
<button type="button" onclick="limpiar_opcion();">Limpiar</button>
<button id="btn_cambio" type="submit">Cambio</button>
</div>

<div id="respuesta_cambio"></div>
</form>
</div>

</div>

<script>
 $(document).ready(function(){
        $('#Formulario_intercambio').submit(function(e){
            e.preventDefault();

            // Obtener los datos de la primera columna de la tabla
            let table = $('#tabla_destino_villa');
            let data = [];

            table.find('tbody tr').each(function() {
                let firstCellText = $(this).find('td').eq(0).text();
                data.push(firstCellText);
            });

            // Añadir los datos de la tabla al formulario
            let formData = $(this).serializeArray();
            formData.push({ name: 'tabla_destino_villa', value: JSON.stringify(data) });

            $.ajax({
                type: 'POST',
                url: 'PHP/archivo/emergentes/subs/cambio/insertar_intercambio.php',
                data: $.param(formData),
                success: function(response){
                    $('#respuesta_cambio').html(response);
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