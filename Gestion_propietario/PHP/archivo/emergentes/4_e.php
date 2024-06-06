

<div id="con_1" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_concepto()" type="button">X</button>
<h2>Conceptos registrados</h2>



</div>

<div class="c2">
<table>
   <tr>
      <td>
      <button onclick="ingreso_concepto_r()">Agregar nuevo</button>
      </td>

      <td>
      <input type="text" id="bus_concepto" placeholder="Buscar concepto">
      </td>
   </tr>
</table>
</div>

<div class="c4">

<div id="tabla_concepto">
<?php
include "PHP/archivo/emergentes/subs/accion_concepto/tabla_concepto.php";
?>
</div>

</div>

</div>

</div>

</div>