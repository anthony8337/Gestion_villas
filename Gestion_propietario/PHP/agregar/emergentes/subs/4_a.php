<div id="multi_concepto" class="mod">

<div class="centro">

<div class="c1">

<h2 >Seleccionar concepto</h2>
<button onclick="cerrar_sele_con_multi()" type="button">X</button>

</div>

<form >

<div class="c2">

<fieldset>
    <legend>Buscar propietario</legend>
<input type="text" name="busca_pro_multi" id="busca_pro_multi" placeholder="Buscar propietario" class="buscador">
</fieldset>

</div>

<div class="c4 ">

<div id="tabla_concepto_multi" class="contenido_tabla completar_vista_cuadro">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_concepto_multi.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>


