<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/mod_pro.css'>

<div id="pro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso()" type="button">X</button>
<h2 id="titulo_pro">Ingresar nuevo propietario</h2>



</div>

<form id="miFormulario_pro">
<div class="c2">

<?php

$pal = ['Nombre Completo','DNI','Telefono','Correo','Estado','Fecha de ingreso'];
$id_nombre = ['nombre_pro','dni_pro','telefono_pro','correo_pro','estado_pro','fecha_pro'];

echo"<table>";
echo"<tr>";
for ($i=0; $i < 3; $i++) {

if($i == 2)
{
    echo"<td rowspan=2>";
    echo"<div title='Teléfono'>
    <table name='tele_agregar' id='tele_agregar' class='numeros'>
    <tr>
    <th>Teléfono</th>
    <th><button type='button' class='agre_tele' onclick='agregarDato_num()'>Agregar</button></th>
    </tr>

    </table>
    </div>";
    echo"</td>";
}
else
{
    echo"<td>";
    echo"<input type='text' name='$id_nombre[$i]' id='$id_nombre[$i]' title='$pal[$i]' placeholder='$pal[$i]'>";
    echo"</td>";
}
}
echo"</tr>";

echo"<tr>";
for ($i=0; $i < count($pal); $i++) {

    if($i == 3)
    {    
        echo"<td>";
        echo"<input type='email' title='$pal[$i]' name='$id_nombre[$i]' id='$id_nombre[$i]' placeholder='$pal[$i]'>";
        echo"</td>";
    }else if($i == 5)
    {
        echo"<td>";
        echo"<input type='date' title='$pal[$i]' name='$id_nombre[$i]' id='$id_nombre[$i]' placeholder='$pal[$i]'>";
        echo"</td>";
    }else
    {}

}
echo"</tr>";

echo"<tr>";
for ($i=0; $i < 3; $i++) {


    if($i == 0)
    {
        echo"<td>
        <button type='button' class='sel_villa' onclick='ingreso_pro_villa()'>Seleccionar Villa</button>
        </td>";
    }
    else if($i == 1)
    {
        echo"<td>
        <fieldset title='Codigo de villa'>
        <label>Villa:</label>
        <label id='cod_villa_p'></label>
        
        </fieldset>
        </td>";
    }else if($i == 2)
    {
        echo"<td>

        <select name='Estado_pro' id='Estado_pro'>
        <option id='es_cli1' value='es_cli1'>Aplica cuenta
        <option id='es_cli2' value='es_cli2'>Suspendido
        </option>
        </select>
        </td>";
    }

}
echo"</tr>";

echo"</table>";


?>
</div>

<div class="c3">

<fieldset id="id_direccion">
<legend>Datos de villa</legend>

<input type="text" id="id_vp" name="id_vp">

<table id="encabezado_villa">
    <tr>
        <td><label>Contador eeh:</label> <label id='cod_eeh_p'></label></td>
        <td><label>Cantidad de habitaciones:</label> <label id='habitacion_p'></label></td>
        <td><label>Modelo de villa:</label> <label id='modelo_p'></label></td>
    </tr>
</table>


</fieldset>

<fieldset class="mas_detalle">
    <legend>Detalles</legend>
</fieldset>

<fieldset class="mas_detalle">
<legend>Observaciones</legend>
<textarea id="observacion_pro" name="observacion_pro"></textarea>
</fieldset>

<button type="submit" id="agre_confirmar" >Agregar Nuevo</button>

<button type="button" id="agre_cance">Cancelar</button>
</div>


<div id="respuesta_pro"></div>
</form>

</div>

</div>

<script>
$(document).ready(function(){
    $('#miFormulario_pro').submit(function(e){
        e.preventDefault(); // Evitar el envío del formulario estándar
        
        if(document.getElementById("id_vp").value != "")
    {
        $.ajax({
            type: 'POST',
            url: 'PHP/archivo/sub_1_e/insertar.php',
            data: $(this).serialize(), // Serializar los datos del formulario
            success: function(response){
                $('#respuesta_pro').html(response); // Mostrar la respuesta del servidor en el div #respuesta
            }
        });
        cerrar_pro1();
    }
    else
    {
        window.alert('Por favor, selecciona una villa');
    }
    }); 
});

function cerrar_pro1()
{
    window.alert('Registro insertado con exito');
    document.getElementById('pro').style.display = "none";
}

</script>

