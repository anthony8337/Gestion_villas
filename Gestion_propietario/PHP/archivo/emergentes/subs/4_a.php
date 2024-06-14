<div id="pro_adi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_pro_adicionar()" type="button">X</button>
<h2 id="titulo_pro_adi">Seleccionar propietario</h2>

</div>

<form id="formulario_propietario_adi">

<div class="c2">

<input type="text" name="busca_pro_adi" id="busca_pro_adi" placeholder="Buscar propietario">

</div>

<div class="c4 ">

<div id="tabla_propietario_adi">
    <?php
    include "PHP/archivo/emergentes/subs/adicion/tabla_pro_adi.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>

