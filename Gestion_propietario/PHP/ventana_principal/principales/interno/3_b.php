
<div id="usu_informe" class="mod">

<div class="centro pro_centro">

<div class="c1">
<h2>Reportes</h2>
<button onclick="cerrar_cuerpo_reporte()" type="button">X</button>
</div>

<form id="Formulario_villa_usu">

<div class="c2">
<fieldset>
<legend>Monedas registradas</legend>
<div class="opciones_villa">
<button type="button" onclick="ingreso_moneda_r()">Agregar</button>
<input type="text" id="txt_bus_moneda" name="txt_bus_moneda" placeholder="Buscar moneda" title="Buscar moneda" class="buscador">
</div>


<div class="contenido_tabla contenido_tabla_ultima principal_tabla_2" id= "interior_moneda">
<?php 
include "PHP/ventana_principal/principales/interno/sql/accion_moneda/tabla_moneda.php";
?>
</div>
</fieldset>

</div>

</form>


</div>

</div>