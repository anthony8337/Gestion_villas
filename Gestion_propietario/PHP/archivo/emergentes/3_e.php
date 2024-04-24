

<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/mod_moneda.css'>

<div id="moneda" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_moneda()" type="button">X</button>
<h2>Monedas registradas</h2>



</div>

<div class="c2">
   <button onclick="ingreso_moneda_r()">Agregar nueva</button> 

   <input type="text" id="bus_moneda" placeholder="Buscar moneda">
</div>

<div class="c3">

<div id= "interior_moneda" class= "interior">
<?php include "PHP/archivo/sub_3_e/tabla.php"; ?>
</div>

</div>

</div>

</div>

<script src="JS/buscar/subs/buscar_moneda.js"></script>