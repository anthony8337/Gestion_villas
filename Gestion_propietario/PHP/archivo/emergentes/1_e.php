
<div id="pro" class="mod">

<div class="centro">

<div class="c1">
<button onclick="cerrar_ingreso()" type="button">X</button>
<h2 id="titulo_pro">Ingresar nuevo propietario</h2>
</div>

<form id="miFormulario_pro">


<div class="c2">

<table>
<tr>
<?php

$pal = ['Nombre completo', 'Numero de identidad','Correo electronico','Fecha de ingreso'];
$id = ['txtnombre','txtid','txtcorreo','txtfecha_i'];
$tipo = ['text','number','email','date'];

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

<td>
<fieldset>
<legend>Agregar contactos</legend>
<button type="button">Contactos</button>
</fieldset>
</td>
</tr>

<tr>
<td>

</td>
</tr>
</table>
</div>


<div class="c4">


<fieldset>
    
    <button type="button">Agregar una villa</button>
    <fieldset>
    <legend>Datos de villa</legend>
    <div>
        <table>
                    <tr>
                        <th>Villa</th>
                        <th>Cont. eeh</th>
                        <th>Modelo</th>
                        <th>Habitaciones</th>
                        <th>Costo</th>
                    </tr>
        </table>
        </div>
        </fieldset>
</fieldset>

<fieldset class="observaciones">
    <legend>
    Observaciones
    </legend>
<div>
            <textarea>

            </textarea>
        </div>
</fieldset>

</div>

<div class = "c3">
    <button type="submit">Agregar</button>
    <button type="button">Limpiar</button>
    <button type="button">Cancelar</button>
</div>



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

