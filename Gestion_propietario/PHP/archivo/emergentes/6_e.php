<div id="cuentas_auto_ver" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">
<h2>Cuentas automaticas registradas</h2>
<button onclick="cerrar_cuentas_auto_ver()" type="button">X</button>

</div>

<form id="Formulario_auto_cuenta_indi">

<div class="c2">
<fieldset>
    <legend>Buscar concepto</legend>
<input type="text" name="busca_concep_automa" id="busca_concep_automa" placeholder="Buscar cuenta automatica" class="buscador" oninput="buscar_cunta_auto_tabla()">
</fieldset>
</div>

<div class="c4 ">

<div id="tabla_concep_auto" class="contenido_tabla tam_limite">
    <?php
    include "PHP/celda/emergentes/sql/tabla_cuentas_auto.php";
    ?>
</div>

</div>

<div class="c3">
    <button type="submit">Aplicar cambios</button>
</div>


<div id="respuesta_au_indi"></div>
</form>
</div>

</div>

<script>
        $(document).ready(function() {
            $("#Formulario_auto_cuenta_indi").submit(function(e) {
                e.preventDefault(); // Evita que se recargue la página
                
                // Obtener los datos de todas las columnas de la tabla
let table = $('#tabla_auto_individial');
let data = [];

table.find('tbody tr').each(function() {
    let row = {
        columna1: $(this).find('td').eq(0).text(),
        columna2: $(this).find('td').eq(1).text(),
        columna3: $(this).find('td').eq(3).text(),
        columna4: $(this).find('td').eq(4).find('input[type="checkbox"]').prop('checked') ? 1 : 0
    };
    data.push(row);
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'tabla_auto_individial', value: JSON.stringify(data) });

$.ajax({
    url: "PHP/archivo/emergentes/subs/accion_propietario/editar_cuenta_auto.php",
    type: "POST",
    data: formData,
    success: function(respuesta) {
        $("#respuesta_au_indi").html(respuesta);
    }
});



            });
        });
    </script>