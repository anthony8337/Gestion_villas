<div id="multi_propietario" class="mod">

<div class="centro">

<div class="c1">

<h2 >Seleccionar propietario</h2>
<button onclick="cerrar_sele_pro_multi()" type="button">X</button>

</div>

<form id="formulario_propietario_gc">

<div class="c2">

<fieldset>
    <legend>Buscar propietario</legend>
<input type="text" name="busca_pro_multi" id="busca_pro_multi" placeholder="Buscar propietario" class="buscador">
</fieldset>

</div>

<div class="c4 ">

<div id="tabla_propietario_multi" class="contenido_tabla">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_propietarios_multi.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>


