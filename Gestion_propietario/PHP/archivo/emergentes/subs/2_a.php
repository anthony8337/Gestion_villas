<div id="pro_rec" class="mod">

<div class="centro">

<div class="c1">
    
<h2 id="titulo_pro_rec">Seleccionar propietario</h2>
<button onclick="cerrar_pro_recibir()" type="button">X</button>


</div>

<form id="formulario_propietario_rec">

<div class="c2">
<fieldset>
    <legend>Buscar propietario</legend>
<input type="text" name="busca_pro_rec" id="busca_pro_rec" placeholder="Buscar por datos del propietario" class="buscador" oninput="bus_pro_recibe()">
</fieldset>
</div>

<div class="c4 ">

<div class="contenido_tabla" id="tabla_propietario_rec">
    <?php
    include "PHP/archivo/emergentes/subs/donante/tabla_pro_rec.php";
    ?>
</div>

</div>

<div id="respuesta_cuenta"></div>
</form>

</div>

</div>

