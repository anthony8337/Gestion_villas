<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/mod_pro.css'>

<div id="pro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso()" type="button">X</button>
<h2 id="titulo_pro">Ingresar nuevo propietario</h2>



</div>

<div class="c2">
<?php

$pal = ['Nombre Completo','DNI','Telefono','Correo','Estado','Fecha de ingreso'];

echo"<table>";
echo"<tr>";
for ($i=0; $i < 3; $i++) {

if($i == 2)
{
    echo"<td rowspan=2>";
    echo"<div title='Teléfono'>
    <table id='tele_agregar' class='numeros'>
    <tr>
    <th colspan = 3>Teléfono <button class='agre_tele' onclick='agregarDato_num()'>Agregar</button></th>
    </tr>

    </table>
    </div>";
    echo"</td>";
}
else
{
    echo"<td>";
    echo"<input type='text' title='$pal[$i]' placeholder='$pal[$i]'>";
    echo"</td>";
}
}
echo"</tr>";

echo"<tr>";
for ($i=0; $i < count($pal); $i++) {

    if($i == 3)
    {    
        echo"<td>";
        echo"<input type='text' title='$pal[$i]' placeholder='$pal[$i]'>";
        echo"</td>";
    }else if($i == 5)
    {
        echo"<td>";
        echo"<input type='date' title='$pal[$i]' placeholder='$pal[$i]'>";
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
        <fieldset>
        <label>Villa:</label>
        <label>A-1</label>

        <label>Cont. eeh:</label>
        <label>A12345678</label>
        </fieldset>
        </td>";
    }else if($i == 2)
    {
        echo"<td>
        <fieldset>
        <input type='radio' name='Estado' id='es_cli1' checked>Aplica cuenta
        <input type='radio' name='Estado' id='es_cli2'>Suspendido
        </fieldset>
        </td>";
    }

}
echo"</tr>";

echo"</table>";


?>
</div>

<div class="c3">
        
<fieldset id="id_direccion">
<legend>Direccion</legend>
</fieldset>

<fieldset class="mas_detalle">
    <legend>Detalles</legend>
</fieldset>

<fieldset class="mas_detalle">
<legend>Observaciones</legend>
<textarea></textarea>
</fieldset>

<button id="agre_confirmar">Agregar Nuevo</button>

<button id="agre_cance">Cancelar</button>
</div>



</div>

</div>