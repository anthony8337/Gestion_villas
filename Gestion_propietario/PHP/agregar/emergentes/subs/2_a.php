<div id="gc_concepto" class="mod">

<div class="centro">

<div class="c1">

<h2 >Seleccionar concepto</h2>
<button onclick="cerrar_sele_concep_gp()" type="button">X</button>

</div>

<form id="formulario_propietario_gc">

<div class="c2">

<input type="text" name="busca_con_gc" id="busca_con_gc" placeholder="Buscar propietario" class="buscador">

</div>

<div class="c4 ">

<div id="tabla_concepto_gc" class="contenido_tabla">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_concepto.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>


