<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_moneda_archivo.css'>

<div id="moneda_registro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_moneda_r_cerrar()" type="button">X</button>
<h2>Ingresar moneda</h2>
</div>

<div class="c2">

<?php

$pal = ['Nombre de la moneda','Simbolo','Valor en L.'];
$tipo = ['text','text','number'];

for ($i=0; $i < count($pal); $i++) { 
    echo"
    <input class='a_$i'; type='$tipo[$i]' placeholder='$pal[$i]'>
    ";
}

?>

<button type="button">Agregar</button>
    
</div>



</div>

</div>