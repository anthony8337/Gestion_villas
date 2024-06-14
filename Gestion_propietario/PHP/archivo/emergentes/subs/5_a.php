<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="selec_villa_adi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_pro_adicionar_tabla()" type="button">X</button>
<h2>Seleccionar villa</h2>
</div>

<div class="c4">

<input type="text" placeholder="Buscar villa" name="txt_busca_villa_propietario" id="txt_busca_villa_propietario">

 <fieldset>
    <fieldset>
    <div id="villa_propi_selec_adi">
        <?php
        include "PHP/archivo/emergentes/subs/adicion/tabla_villa_adi.php";
        ?>
    </div>
</fieldset>
</fieldset>


</div>

</div>


</div>

</div>
