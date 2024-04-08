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


for ($i=0; $i < count($pal); $i++) { 

    if($i == 2)
    {
        echo"<input type='text' placeholder='$pal[$i]'>";
    }
    else if ($i == 4) {
    echo"<input type='date' placeholder='$pal[$i]'>";
    }
    else if($i == 5)
    {
        echo"
        <fieldset>
        <input type='radio' name='Estado' id='es_cli1' checked>Aplica cuenta
        <input type='radio' name='Estado' id='es_cli2'>Suspendido
        </fieldset>
        ";
    }else
    {
        echo"<input type='text' placeholder='$pal[$i]'>";
    }
   
}

?>
</div>

<div class="c3">

<button type="button" class="sel_villa">Selec. Villa</button>

<fieldset class="cabezal_villa">
    <table>
        <tr>
            <td><Label>Codigo: </Label><Label>A-1</Label></td>
            <td><Label>Cont. EEH: </Label><Label>A12345678</Label></td>
        </tr>
    </table>
</fieldset>

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