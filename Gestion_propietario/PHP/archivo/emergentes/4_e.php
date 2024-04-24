<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/mod_consep.css'>

<div id="con_1" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_concepto()" type="button">X</button>
<h2>Conceptos registrados</h2>

</div>

<div class="c2">
   <button onclick="ingreso_concepto_r()">Agregar nuevo</button> 

   <input type="text" id="bus_concepto" placeholder="Buscar concepto">
</div>

<div class="c3">

<div id="interior_concepto" class= "interior">
    <?php include "PHP/archivo/sub_4_e/tabla.php";?>
</div>

</div>



</div>

</div>

<script src="JS/buscar/subs/buscar_concepto.js"></script>