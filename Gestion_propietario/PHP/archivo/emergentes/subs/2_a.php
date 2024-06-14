<div id="pro_rec" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_pro_recibir()" type="button">X</button>
<h2 id="titulo_pro_rec">Seleccionar propietario</h2>

</div>

<form id="formulario_propietario_rec">

<div class="c2">

<input type="text" name="busca_pro_rec" id="busca_pro_rec" placeholder="Buscar propietario">

</div>

<div class="c4 ">

<div id="tabla_propietario_rec">
    <?php
    include "PHP/archivo/emergentes/subs/donante/tabla_pro_rec.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>

