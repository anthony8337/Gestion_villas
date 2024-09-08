<div id="vi_mostrar" class="mod">

<div class="centro ventanas_grandes">

<div class="c1">
<h2>Villas registradas</h2>
<button onclick="cerrar_villa_lista()" type="button">X</button>

</div>

<form id="Formulario_villa_registro">

<div class="c2">
    <fieldset>
        <legend>Buscar villa</legend>
        <input oninput="buscar_villas_tabla()" type="text" name="txt_busca_villa_r" id="txt_busca_villa_r" placeholder="Buscar por datos de la villa">
    </fieldset>

    <fieldset class="limite_tamaño">
        <legend style="visibility: hidden;">B</legend>
        <button type="button" onclick="cerrar_villa_lista(),ingreso_vi()">Crear nueva villa</button>
   
    </fieldset>


</div>

<div class="c4">
<div class="contenido_tabla tam_limite" id="tabla_ver_villas">

</div>
</div>
</form>
</div>

</div>



<script>
 $(document).ready(function(){
    $('#Formulario_villa_registro').submit(function(e){
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