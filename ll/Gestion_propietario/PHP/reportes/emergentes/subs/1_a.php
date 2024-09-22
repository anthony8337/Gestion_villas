<div id="rp_propietario" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">
<h2 >Seleccionar propietario</h2>
<button onclick="cerrar_selec_pro_estado()" type="button">X</button>
</div>

<form>

<div class="c2">
<fieldset>
    <legend>Buscar propietario</legend>
<input type="text" name="busca_pro_sc" id="busca_pro_sc" placeholder="Buscar por datos del propietario" class="buscador" oninput="bus_propi_estado()">
</fieldset>
</div>

<div class="c4">

<div id="tabla_propietario_estado" class="contenido_tabla tam_limite">
    <?php
    include "PHP/reportes/emergentes/subs/sql/tabla_propietarios_estado.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>

