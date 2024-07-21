<div class="q_2">

<fieldset>
<legend>Configuración de usuarios</legend>
<div class="contenido_tabla contenido_tabla_confi_usuarios" id="opciones_usuarios">
    <?php
    include "PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_tipo_usuarios.php";
    ?>
</div>
</fieldset>

<div class="agrupar_confi">

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
</div>

<script src="JS/principal/emergente.js"></script>

<script src="JS/buscar/subs/buscar_grupo_v.js"></script>

<script src="JS/buscar/subs/buscar_modelo_v.js"></script>

<script src="JS/buscar/subs/buscar_moneda.js"></script>

<script src="JS/buscar/subs/buscar_concepto.js"></script>