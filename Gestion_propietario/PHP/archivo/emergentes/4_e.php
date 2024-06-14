
<div id="adicionar_villas" class="mod">

<div class="centro">

<div class="c1">
<button onclick="cerrar_adicionar()" type="button">X</button>
<h2 id="titulo_pro">Adicionar villa a propietario</h2>
</div>

<form id="Formulario_adicionar">


<div class="c2">

<input type="hidden" name="id_pro_adi" id="id_pro_adi">
<table>
<tr>
<?php

$pal = ['Seleccionar','Nombre completo', 'Numero de identidad','Correo electronico','Teléfono'];
$id = ['','txtnombre_adi','txtrtn_adi','txtcorreo_adi','txttelefono_adi'];
$tipo = ['button','text','number','text','number'];

for ($i=0; $i < count($pal); $i++) {
    if ($i == 0) {
        echo"
        <td>
        <fieldset>
        <legend>Seleccionar</legend>
        <button type='button' onclick='abrir_pro_adicionar()'>Propietario</button>
        </fieldset>
        </td>
        ";
    }else {
        echo"
        <td>
        <fieldset>
        <legend>$pal[$i]</legend>
        <input type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]'>
        </fieldset>
        </td>
        ";
    }
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
    
    <button type="button" onclick="abrir_pro_adicionar_tabla()">Agregar una villa</button>
    <fieldset>
    <legend>Datos de villa</legend>
    <div>
        <table id="tabla_villa_adi">
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
    <button type="submit" id="adicionar_villa_btn">Agregar</button>
    <button type="button">Limpiar</button>
    <button type="button">Cancelar</button>
</div>



</form>


</div>

<div id="respuesta_propietario_adi"></div>
</div>

<script>
 $(document).ready(function(){
        $('#Formulario_adicionar').submit(function(e){
            e.preventDefault();

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
                }
            });
        });
    });

</script>