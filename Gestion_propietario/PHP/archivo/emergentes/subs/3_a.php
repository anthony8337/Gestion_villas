<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="selec_villa_propietario" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">

<h2>Seleccionar villa</h2>
<button onclick="cerrar_selecciona_villa_propi()" type="button">X</button>

</div>

<div class="c2 cuadros_fieldset">
<fieldset>
    <legend>Buscar villa</legend>
<input type="text" placeholder="Buscar villa" name="txt_bvp" id="txt_bvp" class="buscador" oninput="bus_villa_propi()">
</fieldset>

<fieldset>
    <legend class="no_ver">Buscar villa</legend>
    <button type="button" onclick="ingreso_vi_propi()">Crear Villa</button>
</fieldset>

</div>

<div class="c4">

    <div class="contenido_tabla tam_limite" id="villa_propi_selec">
        <?php
        include "PHP/archivo/emergentes/subs/accion_propietario/tabla_propietario_villa.php";
        ?>
    </div>


</div>

</div>


</div>

</div>
