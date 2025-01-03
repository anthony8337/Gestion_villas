
<div id="usu_perso_auto" class="mod">

<div class="centro pro_centro ventanas_medianas_pro_extra">

<div class="c1">
<h2>Personas autorizadas</h2>
<button onclick="cerrar_personas_autorizadas_atajo()" type="button">X</button>
</div>

<form id="Formulario_perso_auto">

    <input type="hidden" id="id_unir_aper" name="id_unir_aper">
    <input type="hidden" id="villa_aper" name="villa_aper">
    <input type="hidden" id="pro_aper" name="pro_aper">
    <div class="c2">

    <fieldset>
    <legend>Nombre</legend>
    <input type='text' id = 'txt_nom_x_2' name = 'txt_nom_x_2' placeholder='Nombre' title='Nombre'>
    </fieldset>

    <fieldset>
    <legend>Teléfono</legend>
    <input class="solo_numero" type='text' id = 'txt_tex_x_2' name = 'txt_tex_x_2' placeholder='Teléfono' title='Teléfono'>
    </fieldset>
    
    <fieldset>
    <legend>Correo</legend>
    <input type='email' id = 'txt_cor_x_2' name = 'txt_cor_x_2' placeholder='Correo' title='Correo'>
    </fieldset>

    <fieldset>
    <legend style="visibility: hidden;">Correo</legend>
    <button type="button" onclick="agregarDatos_2()">Agregar</button>
    </fieldset>
    </div>

    <div class="c4">
        <div  class="ulti_movi_extra_pro principal_tabla_pro_extra contenido_tabla">

    <table id="pro_autorizados_2">
    <tr>
    <th></th>
    <th style="width: 33%;">Nombre</th>
    <th style="width: 33%;">Número de teléfono</th>
    <th style="width: 33%;">Correo electronico</th>
                </tr>
        
                <tbody id="tbody_agregar_perso_adi" class="borrar_t">

                </tbody>
    </table>
    </div>
    </div>





<div class="c3">
<button type="button" onclick="abrirNuevaPagina_personas_auto()">Imprimir</button>
<button type="submit">Guardar cambios</button>

</div>

<div id="respuesta_perso_auto"></div>


</form>


</div>

</div>

<script>
        $(document).ready(function() {
            $("#Formulario_perso_auto").submit(function(e) {
                e.preventDefault(); // Evita que se recargue la página
                
                // Obtener los datos de todas las columnas de la tabla
let table = $('#pro_autorizados_2');
let data = [];

table.find('tbody tr').each(function() {
    let row = {
        columna1: $(this).find('td').eq(0).text(),
        columna2: $(this).find('td').eq(1).text(),
        columna3: $(this).find('td').eq(2).text(),
        columna4: $(this).find('td').eq(3).text(),
        columna5: $(this).find('td').eq(5).text(),
        columna6: $(this).find('td').eq(6).text(),
    };
    data.push(row);
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'perso_auto_g', value: JSON.stringify(data) });

var a = confirm('¿Desea aplicar los cambios?');

if(a == true)
{

$.ajax({
    url: "PHP/celda/emergentes/sql/cambios_perso_autorizada.php",
    type: "POST",
    data: formData,
    success: function(respuesta) {
        $("#respuesta_perso_auto").html(respuesta);
        location.reload();
    }
});
}


            });
        });
    </script>

    <script>
        
    function abrirNuevaPagina_personas_auto() {
    nombrar_usuario();
    // IDs de los inputs que quieres enviar
    var inputIDs = ['id_unir_aper','villa_aper','pro_aper','nombre_usuario'];
    
    // Crea un formulario
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "12_autorizado_pro.php";
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