
<div id="adicionar_villas" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">
<h2 >Adicionar villa a propietario</h2>
<button onclick="cerrar_adicionar(),limpiar_confirmar()" type="button">X</button>
</div>

<form id="Formulario_adicionar">


<div class="c2">

<input type="hidden" name="id_pro_adi" id="id_pro_adi">

        <fieldset>
        <legend style="visibility: hidden;">Seleccionar</legend>
        <button type='button' onclick='abrir_pro_adicionar()'>Seleccionar propietario</button>
        </fieldset>

        <fieldset>
        <legend style="visibility: hidden;">Teléfono</legend>
        <button type="button" onclick="abrir_pro_adicionar_tabla()">Agregar una villa</button>
        </fieldset>

        <fieldset>
        <legend>Nombre completo</legend>
        <input type='text' id = 'txtnombre_adi' name = 'txtnombre_adi' placeholder='Nombre completo' title='Nombre completo' readonly required>
        </fieldset>

        <fieldset>
        <legend>Número de identidad</legend>
        <input type='text' id = 'txtrtn_adi' name = 'txtrtn_adi' placeholder='Número de identidad' title='Número de identidad' readonly required>
        </fieldset>

        <fieldset class="oculto">
        <legend>Correo electrónico</legend>
        <input type='text' id = 'txtcorreo_adi' name = 'txtcorreo_adi' placeholder='Correo electrónico' title='Correo electrónico' readonly required>
        </fieldset>

        <fieldset class="oculto">
        <legend>Teléfono</legend>
        <input type='text' id = 'txttelefono_adi' name = 'txttelefono_adi' placeholder='Teléfono' title='Teléfono' readonly required>
        </fieldset>



</div>


<div class="c4">



    <fieldset>
    <legend>Datos de villa</legend>
    <div class="contenido_tabla contenido_tabla_ultima">
    <input type="hidden" name="sum_select_adi" id="sum_select_adi" value="0">
        <table id="tabla_villa_adi">
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
<button type="button" onclick="limpiar_opcion()">Limpiar</button>
<button type="submit" id="adicionar_villa_btn">Agregar</button>
</div>



</form>


</div>

<div id="respuesta_propietario_adi"></div>
</div>

<script>
 $(document).ready(function(){
        $('#Formulario_adicionar').submit(function(e){
            e.preventDefault();

            var a = document.getElementById("id_pro_adi").value;

            var villa = parseInt(document.getElementById("sum_select_adi").value,10);

            if(a == "" || villa <= 0)
            {
                window.alert("Por favor, completa los campos pendientes");
            }
            else
            {
            var confir = confirm("Se realizara una adición de villa \n¿Esta seguro que desea continuar?");

            if (confir) {
            // Obtener los datos de la primera columna de la tabla
            let table = $('#tabla_villa_adi');
            let data = [];

            table.find('tbody tr').each(function() {
                let firstCellText = $(this).find('td').eq(0).text();
                data.push(firstCellText);
            });

            // Añadir los datos de la tabla al formulario
            let formData = $(this).serializeArray();
            formData.push({ name: 'tabla_villa_adi', value: JSON.stringify(data) });

            $.ajax({
                type: 'POST',
                url: 'PHP/archivo/emergentes/subs/adicion/insertar_pro_vi_adi.php',
                data: $.param(formData),
                success: function(response){
                    $('#respuesta_propietario_adi').html(response);
                    actualizar_propietarios();
                    actualizar_propietarios_cuenta();
                    actualizar_propietarios_multipago();
                    actualizar_villas_propietario(); 
                    actualizar_villas_adicionar();
                }
            });
        }
    }
        });
    });

</script>