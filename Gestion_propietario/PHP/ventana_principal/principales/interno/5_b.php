
<div id="usu_automatico" class="mod">

<div class="centro pro_centro ventanas_medianas">

<div class="c1">
<h2>Automatizar</h2>
<button onclick="cerrar_cuerpo_automatico(), limpiar_confirmar()" type="button">X</button>
</div>

<form id="Formulario_automatico">

<fieldset>
    <legend>Generar cuentas automaticas</legend>

    <div class="c2">

<fieldset>
    <legend>Concepto de abono</legend>
    <select name="combo_concep_abono" id="combo_concep_abono">
        
    <?php
    include "PHP/ventana_principal/principales/interno/sql/combo_concepto.php";
    ?>

    </select>
</fieldset>

<fieldset>
    <legend>Dia del mes a generar</legend>
    <select name="combo_dia_generar" id="combo_dia_generar">
        <?php
        for($i = 1; $i <= 28; $i++)
        {
            echo"
            <option value='$i'>$i</option>
            ";
        }
        ?>

        
    </select>
</fieldset>

<fieldset>
    <legend style="visibility: hidden;">Dia del mes a generar</legend>
    <button type="button" onclick="conocepto_cargo()">Seleccionar cargo</button>
</fieldset>

</div>

<div class="c2">
<div id="div_tabla_con_car" style="width: 100%;" class="contenido_tabla contenido_tabla_ultima principal_tabla_2 tam_limite">


<table id='tabla_concepto_cargo_1'>
    <tr>
    <th></th>
    <th colspan = '4'>Concepto de cuentas a generar</th>
   </tr>

   <tr>
    <th></th>
    <th>Concepto</th>
    <th>Valor</th>
    <th></th>
   </tr>

   <tbody id="tbody_concep_cargo" class="borrar_t">

   </tbody>

</table>


</div>
</div>
</fieldset>

<div class="c3">
<button type="submit">Guardar cambios</button>
</div>

<div id="respuesta_automatico"></div>


</form>


</div>

</div>

<script>
        $(document).ready(function() {
            $("#Formulario_automatico").submit(function(e) {
                e.preventDefault(); // Evita que se recargue la página
                
                // Obtener los datos de todas las columnas de la tabla
let table = $('#tabla_concepto_cargo_1');
let data = [];

table.find('tbody tr').each(function() {
    let row = {
        columna1: $(this).find('td').eq(0).text(),
        columna2: $(this).find('td').eq(3).text(),
        columna3: $(this).find('td').eq(4).text(),
    };
    data.push(row);
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'concep_generar', value: JSON.stringify(data) });

var a = confirm('¿Desea aplicar los cambios?');

if(a == true)
{

$.ajax({
    url: "PHP/ventana_principal/principales/interno/sql/accion_automatico/insertar_automatico.php",
    type: "POST",
    data: formData,
    success: function(respuesta) {
        $("#respuesta_automatico").html(respuesta);
        location.reload();
    }
});
}


            });
        });
    </script>