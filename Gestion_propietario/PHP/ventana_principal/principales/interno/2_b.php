
<div id="usu_concepto" class="mod">

<div class="centro pro_centro">

<div class="c1">
<h2>Datos de conceptos</h2>
<button onclick="cerrar_cuerpo_concepto()" type="button">X</button>
</div>

<form id="Formulario_villa_usu">

<div class="c2">

<fieldset>
<legend>Conceptos registrados</legend>
<div class="opciones_villa">
<button type="button" onclick="ingreso_concepto_r()">Agregar</button>
<input type="text" name="bus_concepto" id="bus_concepto" placeholder="Buscar concepto" title="Buscar concepto" class="buscador">
</div>


<div class="contenido_tabla contenido_tabla_ultima principal_tabla_2" id="tabla_concepto">
<?php 
include "PHP/ventana_principal/principales/interno/sql/accion_concepto/tabla_concepto.php";
?>
</div>
</fieldset>

</div>

</form>


</div>

</div>