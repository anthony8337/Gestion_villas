
<div id="usu_villas" class="mod">

<div class="centro pro_centro">

<div class="c1">
<h2>Datos de villa</h2>
<button onclick="cerrar_cuerpo_villa()" type="button">X</button>
</div>

<form id="Formulario_villa_usu">

<div class="c2">

<fieldset>
<legend>Grupos de villa</legend>
<div class="opciones_villa">
<button type="button" onclick="abrir_grupo_villa()">Agregar</button>
<input type="text" name="txt_buscar_grupo_villa" id="txt_buscar_grupo_villa" placeholder="Buscar grupo de villa" title="Buscar grupo de villa" class="buscador">
</div>

<div class="contenido_tabla contenido_tabla_ultima principal_tabla_2" id="cont_grupo_villa">
<?php
include "PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_grupos_villas.php";
?>
</div>
</fieldset>

<fieldset>
<legend>Modelos de villa</legend>
<div class="opciones_villa">
<button type="button" onclick="abrir_modelos_villa()">Agregar</button>
<input type="text" name="buscar_modelo_villa" id="buscar_modelo_villa" placeholder="Buscar modelo de villa" title="Buscar grupo de villa" class="buscador">
</div>

<div class="contenido_tabla contenido_tabla_ultima principal_tabla_2" id="cont_modelo_villa">
    <?php
    include "PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_modelo_villas.php";
    ?>
</div>
</fieldset>



</div>

</form>


</div>

</div>