
<div id="pro" class="mod">

<div class="centro">

<div class="c1">
<button onclick="cerrar_ingreso()" type="button">X</button>
<h2 id="titulo_pro">Ingresar nuevo propietario</h2>
</div>

<form id="Formulario_pro">


<div class="c2">

<table>
<tr>
<?php

$pal = ['Nombre completo', 'Numero de identidad','Correo electronico','Fecha de ingreso','Teléfono'];
$id = ['txtnombre','txtid','txtcorreo','txtfecha_i','txttelefono'];
$tipo = ['text','number','text','date','number'];

for ($i=0; $i < count($pal); $i++) {
        echo"
        <td>
        <fieldset>
        <legend>$pal[$i]</legend>
        <input type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]'>
        </fieldset>
        </td>
        ";
}

?>
</tr>

<tr>
<td>

</td>
</tr>
</table>
</div>


<div class="c4">


<fieldset>
    
    <button type="button" onclick="selecciona_villa_propi()">Agregar una villa</button>
    <fieldset>
    <legend>Datos de villa</legend>
    <div>
        <table id="tabla_villa_pro_selec">
            <thead>
        <tr>
        <th></th>
        <th>Villa</th>
        <th>Cont. eeh</th>
        <th>Modelo</th>
        <th>Habitaciones</th>
        <th>Condición</th>
                    </tr>
            </thead>
                    <tbody>

                    </tbody>
        </table>
        </div>
        </fieldset>
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
    <button type="button">Limpiar</button>
    <button type="button">Cancelar</button>
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
                }
            });
        });
    });

</script>