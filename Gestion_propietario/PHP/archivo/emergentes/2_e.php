

<div id="vi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_vi()" type="button">X</button>
<h2>Ingresar nueva villa</h2>




</div>

<form id="miFormulario_villa">
<div class="c2">

<?php

$p1 = ['Número de villa','Contador de eeh','Habitaciones','Area del lote','Area de contrución','Modelo de villa'];
$p1_ni=['txt_cod_villa','txt_eeh_villa','txt_cuarto_vi','txt_lote_vi','txt_construc_vi','sel_villa'];
$tipo = ['number','text','text','text','text',''];

echo"<table>";
echo"<tr>";
for($i = 0; $i < count($p1); $i++)
{
    if($i == 0)
    {
        echo"<td>
        <select name='n_$p1_ni[$i]' id='n_$p1_ni[$i]' title = 'Grupo de villa'>
        ",include 'PHP/archivo/sub_2_e/seleccion.php',"
        </select>
        <input type='$tipo[$i]' name='$p1_ni[$i]' id='$p1_ni[$i]' placeholder='$p1[$i]' title='$p1[$i]'>
        </td>";
    }
    else if($i == (count($p1) - 1))
    {
        echo"<td>
        <select name='n_$p1_ni[$i]' id='n_$p1_ni[$i]' title = '$p1[$i]'>
        <option>Caracol</option>
        <option>Arrecife</option>
        <option>Carey</option>
        </select>
        </td>";
    } 
    else
    {
        echo"<td>
        <input type='$tipo[$i]' name='$p1_ni[$i]' id='$p1_ni[$i]' placeholder='$p1[$i]' title='$p1[$i]'>
        </td>";
    }
}
echo"</tr>";
echo"</table>";

?>

</div>

<div class="c4">

<table>
    <tr>
        <td rowspan="2">

        

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
    </div>

        </td>

        <td>   
        <div class="div_otro">
        Dirección
        <textarea name="txa_direccion" id="txa_direccion"></textarea>
        </div>
        </td>
        </tr>

    <tr>
    <td>   
        <div class="div_otro">
        Observaciones
        <textarea name="txa_observacion" id="txa_observacion"></textarea>
        </div>
        </td>
    </tr>
</table>

</div>

<div class="c3">
<button id="agre_confirmar">Agregar Nuevo</button>

<button id="agre_cance">Cancelar</button>
</div>

<div id="respuesta_villa"></div>
</form>
</div>

</div>