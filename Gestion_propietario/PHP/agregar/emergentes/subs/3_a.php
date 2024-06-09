<div id="multi_propietario" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_sele_pro_multi()" type="button">X</button>
<h2 id="titulo_pro">Seleccionar propietario</h2>

</div>

<form id="formulario_propietario_gc">

<div class="c2">

<input type="text" name="busca_pro_gc" id="busca_pro_gc" placeholder="Buscar propietario">

</div>

<div class="c4 ">

<div id="tabla_propietario_gc">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_propietarios_multi.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>


