

<div id="ingreso_mod" class="mod">
<div id="interno_registrar">

<div class="cabezal_e">
    <h2>Ingresar nuevo propietario</h2>
    <button type="button"><img src="Imagenes/x-lg.svg"></button>
</div>

<div class="cuerpo_e">

<?php

$pal = ['Nombre Completo','DNI','Telefono','Correo','Estado','Fecha de ingreso'];


for ($i=0; $i < count($pal); $i++) { 

    if ($i == 4) {
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

<fieldset class="cuerpo_e_2">

<button type="button" class="sel_villa">Selec. Villa</button>

<fieldset class="cabezal_villa"></fieldset>

</fieldset>


<div>
</div>
