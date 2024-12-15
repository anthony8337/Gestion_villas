<div id="elegir_concep_cargo" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">
<h2>Seleccionar concepto de cargo</h2>
<button onclick="conocepto_cargo_cerrar()" type="button">X</button>
</div>

<form id="concep_cargo_form">


<div class="c2">
<fieldset>
    <legend>Buscar concepto</legend>
<input type="text" name="bus_concep_cargo" id="bus_concep_cargo" placeholder="Buscar concepto" class="buscador" oninput="bus_propi_estado()">
</fieldset>
</div>

<div class="c4">

<div class="contenido_tabla tam_limite">
<?php 
include "PHP/ventana_principal/principales/interno/sql/accion_concepto/tabla_concepto_cargo_selec.php";
?>
</div>

</div>

<div id="respuesta_cuenta"></div>


</form>

</div>
</div>