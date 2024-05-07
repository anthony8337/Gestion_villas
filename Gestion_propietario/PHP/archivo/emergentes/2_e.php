

<div id="vi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_vi()" type="button">X</button>
<h2>Ingresar nueva villa</h2>




</div>

<form id="miFormulario_villa">
<div class="c2">

<?php

$p1 = ['Codigo de villa','Contador de eeh','Estado'];
$p1_ni=['txt_cod_villa','txt_eeh_villa','txt_estado'];

echo"<table>";
echo"<tr>";
for($i = 0; $i < count($p1); $i++)
{


if($i == (count($p1) - 1))
{
    echo"<td>
    <select name='$p1_ni[$i]' id='$p1_ni[$i]' title='$p1[$i]'>
    <option value='Activo'>Activo</option>
    <option value='Mantenimiento'>Mantenimiento</option>
    <option value='Suspendida'>Suspendida</option>
    </select>
    </td>";
}
else
{
    echo"<td>
    <input type='text' name='$p1_ni[$i]' id='$p1_ni[$i]' placeholder='$p1[$i]' title='$p1[$i]'>
    </td>";
}

}
echo"</tr>";

$p2 = ['Habitaciones','Area del lote','Area de contrución'];
$p2_ni = ['txt_cuarto_vi','txt_lote_vi','txt_construc_vi'];
echo"<tr>";
for($i = 0; $i < count($p2); $i++)
{
    echo"<td>
    <input type='number' name='$p2_ni[$i]' id='$p2_ni[$i]' placeholder='$p2[$i]' title='$p2[$i]'>
    </td>";
}
echo"</tr>";
echo"</table>";

?>

</div>

<div class="c3">

<fieldset id="id_direccion">
<legend>Direccion</legend>
<textarea name="txa_direccion" id="txa_direccion"></textarea>
</fieldset>


<fieldset id="cara" class="mas_detalle">
<legend>Detalles</legend>

    <table  title="Modelo de villa">
        <tr>
        <?php
            
            $detalles = ['Caracol','Arrecife','Carey'];

            for ($i=0; $i < count($detalles); $i++) { 

                if($i == 0)
                {
                    echo"
                    <td>
                    <input type='radio' name='modelo' id='modelo[$i]' value='$detalles[$i]' checked> $detalles[$i]
                    </td>
                    ";
                }
                else if($i == 1)
                {
                    echo"
                    <td>
                    <input type='radio' name='modelo' id='modelo[$i]' value='$detalles[$i]' > $detalles[$i]
                    </td>
                    ";
                }
                else if($i == 2)
                {
                    echo"
                    <td>
                    <input type='radio' name='modelo' id='modelo[$i]' value='$detalles[$i]' > $detalles[$i]
                    </td>
                    ";
                }

            }
            ?>
        </tr>
    </table>

    <div id="ta_cara">
    <?php

    echo"<table id='carac_vi' class='ta_ca_cont'>";

    echo"
    <tr>
    <th>Caracteristicas</th>
    <th><button type='button' onclick='agregarDato_cara()'>Agregar</button></th>
    </tr>
    ";

    echo"</table>";
    
    ?>
        </table>
    </div>

</fieldset>

<fieldset id="observa" class="mas_detalle">
<legend>Observaciones</legend>
<textarea name="txa_observacion" id="txa_observacion"></textarea>
</fieldset>


</div>

<div class="c4">
<button id="agre_confirmar">Agregar Nuevo</button>

<button id="agre_cance">Cancelar</button>
</div>

<div id="respuesta_villa"></div>
</form>
</div>

</div>


<script>
$(document).ready(function(){
    $('#miFormulario_villa').submit(function(e){
        e.preventDefault(); // Evitar el envío del formulario estándar
        
        $.ajax({
            type: 'POST',
            url: 'PHP/archivo/sub_2_e/insertar.php',
            data: $(this).serialize(), // Serializar los datos del formulario
            success: function(response){
                $('#respuesta_villa').html(response); // Mostrar la respuesta del servidor en el div #respuesta
                cerrar_villa1();
            }
        });
    }); 
});

function cerrar_villa1()
{
    window.alert('Registro insertado con exito');
    document.getElementById('vi').style.display = "none";
}

</script>
