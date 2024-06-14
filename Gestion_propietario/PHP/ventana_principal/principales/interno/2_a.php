<div class="q_2">

<fieldset>
<legend>Configuración de usuarios</legend>
<div class="opciones_confi_usuario" id="opciones_usuarios">
    <?php
    include "PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_tipo_usuarios.php";
    ?>
</div>
</fieldset>

<fieldset>
<legend>Grupos de villa</legend>
<div class="opciones_villa">
<input type="text" name="txt_buscar_grupo_villa" id="txt_buscar_grupo_villa" placeholder="Buscar grupo de villa" title="Buscar grupo de villa">
<button type="button" onclick="abrir_grupo_villa()">Agregar</button>
</div>

<div class="opciones_confi_modelo_villa" id="cont_grupo_villa">
<?php
include "PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_grupos_villas.php";
?>
</div>
</fieldset>

<fieldset>
<legend>Modelos de villa</legend>
<div class="opciones_villa">
<input type="text" name="buscar_modelo_villa" id="buscar_modelo_villa" placeholder="Buscar modelo de villa" title="Buscar grupo de villa">
<button type="button" onclick="abrir_modelos_villa()">Agregar</button>
</div>

<div class="opciones_confi_modelo_villa" id="cont_modelo_villa">
    <?php
    include "PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_modelo_villas.php";
    ?>
</div>
</fieldset>

<fieldset>
<legend>Monedas registradas</legend>
<div class="opciones_villa">
<input type="text" id="bus_moneda" name="bus_moneda" placeholder="Buscar moneda" title="Buscar moneda">
<button type="button" onclick="ingreso_moneda_r()">Agregar</button>
</div>


<div class="opciones_confi_modelo_villa" id= "interior_moneda">
<?php 
include "PHP/ventana_principal/principales/interno/sql/accion_moneda/tabla_moneda.php";
?>
</div>
</fieldset>

<fieldset>
<legend>Conceptos registrados</legend>
<div class="opciones_villa">
<input type="text" name="bus_concepto" id="bus_concepto" placeholder="Buscar concepto" title="Buscar concepto">
<button type="button" onclick="ingreso_concepto_r()">Agregar</button>
</div>


<div class="opciones_confi_modelo_villa" id="tabla_concepto">
<?php 
include "PHP/ventana_principal/principales/interno/sql/accion_concepto/tabla_concepto.php";
?>
</div>
</fieldset>

</div>

<script src="JS/principal/emergente.js"></script>

<script src="JS/buscar/subs/buscar_grupo_v.js"></script>

<script src="JS/buscar/subs/buscar_modelo_v.js"></script>