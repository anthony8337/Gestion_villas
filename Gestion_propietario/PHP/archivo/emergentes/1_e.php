
<div id="pro" class="mod">

<div class="centro pro_centro ventanas_muy_grandes">

<div class="c1">
<h2 id="tl_titulo">Ingresar nuevo propietario</h2>
<button onclick="cerrar_ingreso(),limpiar_confirmar(),actualizar_tabla_villa_pro()" type="button">X</button>
</div>

<form id="Formulario_pro">

<div class="c2">

<input type="hidden" id="id_propi_1" name="id_propi_1">
<input type="hidden" id="id_unir_pro1" name="id_unir_pro1">

<?php

$pal = ['Nombre completo', 'Número de identidad','Correo electrónico','Teléfono','Fecha de ingreso'];
$id = ['txtnombre','txtid','txtcorreo','txttelefono','txtfecha_i'];
$tipo = ['text','text','email','text','date','text'];
$clases = ['','solo_numero','','solo_numero',''];
$ocultar = ['','','','','oculto'];

for ($i=0; $i < count($pal); $i++) {

        echo"
        <fieldset class='$ocultar[$i]'>
        <legend>$pal[$i]</legend>
        <input class='$clases[$i]' type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]' required>
        </fieldset>
        ";
}
?>

<fieldset class="oculto">
    <legend style="visibility: hidden;">ff</legend>
    <button type="button" onclick="contactos()">Agregar contactos</button>
</fieldset>


<fieldset>
    <legend style="visibility: hidden;">ff</legend>
    <button id="btn_agre_villa_pro" type="button" onclick="selecciona_villa_propi()">Agregar villa</button>

</fieldset>
</div>


<div class="c4">

<div class="btn_agregados_form">

</div>

    <fieldset>
    <legend>Datos de villa</legend>

    <div id="div_tabla_villas_pro" class="contenido_tabla contenido_tabla_ultima">

    <input type="hidden" name="pro_villa_cont" id="pro_villa_cont" value="0">
        <table id="tabla_villa_pro_selec">
        <tr>
        <th></th>
        <th>Villa</th>
        <th>Número de medidor</th>
        <th>Modelo</th>
        <th>Habitaciones</th>
        <th>Condición</th>
                    </tr>
            
                    <tbody class="borrar_t">

                    </tbody>
        </table>
        </div>
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
<button type="button" onclick="limpiar_opcion();" id="limpiar_propietario">Limpiar</button>
<button type="button" onclick="insertar_propi()" id="agregar_propietario">Agregar</button>
<button class="oculto"  onclick="eliminar_propi()" type="button" id="eliminar_propietario">Eliminar</button>
<button class="oculto" onclick="actualizar_propi()" type="button" id="modificar_propietario">Modificar</button>
</div>



</form>


</div>

<div id="respuesta_propietario"></div>
</div>
