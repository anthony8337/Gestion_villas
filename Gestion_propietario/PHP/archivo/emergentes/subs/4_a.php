<div id="pro_adi" class="mod">

<div class="centro">

<div class="c1">

<h2 id="titulo_pro_adi">Seleccionar propietario</h2>
<button onclick="cerrar_pro_adicionar()" type="button">X</button>


</div>

<form id="formulario_propietario_adi">

<div class="c2">
<fieldset>
    <legend>Buscar propietario</legend>
<input type="text" name="busca_pro_adi" id="busca_pro_adi" placeholder="Buscar propietario">
</fieldset>
</div>

<div class="c4 ">
<div class="contenido_tabla" id="tabla_propietario_adi">
    <?php
    include "PHP/archivo/emergentes/subs/adicion/tabla_pro_adi.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>

