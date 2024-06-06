<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="selec_villa_propietario" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_selecciona_villa_propi()" type="button">X</button>
<h2>Seleccionar villa</h2>
</div>

<div class="c4">

<input type="text" placeholder="Buscar villa" name="txt_busca_villa_propietario" id="txt_busca_villa_propietario">

 <fieldset>
    <fieldset>
    <div id="villa_propi_selec">
        <?php
        include "PHP/archivo/emergentes/subs/accion_propietario/tabla_propietario_villa.php";
        ?>
    </div>
</fieldset>
</fieldset>


</div>

</div>


</div>

</div>
