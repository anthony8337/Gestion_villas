

<div id="moneda" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_moneda()" type="button">X</button>
<h2>Monedas registradas</h2>



</div>

<div class="c2">
<table>
   <tr>
      <td>
      <button onclick="ingreso_moneda_r()">Agregar nueva</button>
      </td>

      <td>
      <input type="text" id="bus_moneda" placeholder="Buscar moneda">
      </td>
   </tr>
</table>
</div>

<div class="c4">
<div id= "interior_moneda">
<?php 
include "PHP/archivo/emergentes/subs/accion_moneda/tabla_moneda.php";
?>
</div>



</div>

</div>

</div>

<script src="JS/buscar/subs/buscar_moneda.js"></script>