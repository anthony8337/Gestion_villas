<div id="cambio_villa" class="mod">

<div class="centro">

<div class="c1">

<button onclick="v_cambio_cerrar()" type="button">X</button>
<h2>Intercambio de propietario de villa</h2>
</div>

<form id="Formulario_intercambio">
<div class="c2">

<fieldset>
    <legend>Donante de villa</legend>
<table>
<tr>

<?php

$pal = ['Seleccionar','Nombre completo', 'Numero de identidad','Correo electronico','Teléfono'];
$id = ['','txtnombre_do','txtrtn_do','txtcorreo_do','txttelefono_do'];
$tipo = ['button','text','number','text','number'];

for ($i=0; $i < count($pal); $i++) {

    if ($i == 0) {
        echo"
        <td>
        <fieldset>
        <legend>Seleccionar</legend>
        <button type='button' onclick='abrir_pro_donar()'>Donante</button>
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
</table>
</fieldset>
</div>
<div class="c4">
    <div>
        <table id="tabla_donante_villa">
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
                    <tbody id="tb_villas_donador">

                    </tbody>
        </table>
        </div>
</div>


<div class="c2">
<fieldset>
    <legend>Destino de villa</legend>
<table>
<tr>

<input type="hidden" name="id_rec_pro" id="id_rec_pro">
<input type="date" name="txt_fecha_rec" id="txt_fecha_rec" class="interno">

<?php

$pal = ['Seleccionar','Nombre completo', 'Numero de identidad','Correo electronico','Teléfono'];
$id = ['','txtnombre_rec','txtrtn_rec','txtcorreo_rec','txttelefono_rec'];
$tipo = ['button','text','number','text','number'];

for ($i=0; $i < count($pal); $i++) {

    if ($i == 0) {
        echo"
        <td>
        <fieldset>
        <legend>Seleccionar</legend>
        <button type='button' onclick='abrir_pro_recibir()'>Destino</button>
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
</table>
</fieldset>
</div>

<div class="c4">
    <div>
        <table id="tabla_destino_villa">
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
</div>

<div class="c3">
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
                }
            });
        });
    });

</script>