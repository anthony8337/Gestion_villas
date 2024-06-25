<div id="pro_donar" class="mod">

<div class="centro">

<div class="c1">
<h2 id="titulo_pro_do">Seleccionar propietario</h2>
<button onclick="cerrar_pro_donar()" type="button">X</button>

</div>

<form id="formulario_propietario_do">

<div class="c2">
<fieldset>
    <legend>Buscar propietario</legend>
<input type="text" name="busca_pro_do" id="busca_pro_do" placeholder="Buscar propietario" class="buscador">
</fieldset>
</div>

<div class="c4 ">

<div class="contenido_tabla" id="tabla_propietario_do">
    <?php
    include "PHP/archivo/emergentes/subs/donante/tabla_pro_do.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>

