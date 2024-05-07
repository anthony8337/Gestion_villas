
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
$id = ['txt1','txt2','txt3','txt4'];
$tipo = ['text','number','email','date'];

for ($i=0; $i < count($pal); $i++) {
        echo"
        <td>
        <input type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]'>
        </td>
        ";
}

?>

<td>
<button type="button">Contactos</button>
</td>

<td>
<button type="button">Seleccionar <br> villa</button>
</td>
</tr>
</table>
</div>


<div class="c4">

<table>
    <tr>
        <td rowspan="2">
            <div>
                <table>
                    <tr>
                        <th>Detalles</th>
                    </tr>
                </table>
            </div>
        </td>
        <td>
        <div class="div_otro">
        <table>
                    <tr>
                        <th colspan="2">Datos de villa</th>
                    </tr>

                    <tr>
                        <td>Villa:</td>
                        <td>A-1</td>
                    </tr>

                    <tr>
                        <td>Cont. eeh:</td>
                        <td>123456789</td>
                    </tr>

                    <tr>
                        <td>Modelo:</td>
                        <td>Villa caracol</td>
                    </tr>

                    <tr>
                        <td>Habitaciones:</td>
                        <td>5</td>
                    </tr>
        </table>
        </div>
        </td>
    </tr>

    <tr>
        <td>
        <div class="div_otro">Observaciones
            <br>
            <textarea>

            </textarea>
        </div>
        </td>
    </tr>

</table>

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

