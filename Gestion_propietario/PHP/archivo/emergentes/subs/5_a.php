<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="selec_villa_adi" class="mod">

<div class="centro">

<div class="c1">
<h2>Seleccionar villa</h2>
<button onclick="cerrar_pro_adicionar_tabla()" type="button">X</button>

</div>

<div class="c2">
<fieldset>
    <legend>Buscar villa</legend>
<input type="text" placeholder="Buscar villa" name="txt_busca_adicional_propietario" id="txt_busca_adicional_propietario" class="buscador">
</fieldset>
</div>

<div class="c4">


    <div class="contenido_tabla" id="villa_propi_selec_adi">
        <?php
        include "PHP/archivo/emergentes/subs/adicion/tabla_villa_adi.php";
        ?>
    </div>


</div>

</div>


</div>

</div>
