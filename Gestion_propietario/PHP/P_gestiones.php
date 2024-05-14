<div id="menu_lateral">
<img src="Imagenes/logo_principal.png" id="logo">
<ul>
<?php
$nombre_botones = ['Archivo','Agregar','Reportes','Salir'];
$imagenes_botones = ['Imagenes/2.png','Imagenes/5.png','Imagenes/6.png','Imagenes/box-arrow-left.svg'];
$titulos = ['Nueva información','Pago de propietario','Reportes de movimientos','Salir'];
$acciones = ['precionar_b0()','precionar_b1()','precionar_b2()',''];

for ($i=0; $i < count($nombre_botones); $i++) { 


echo"
<li id='li_$i' onclick='$acciones[$i]' title='$titulos[$i]'>
<table>
<tr>
    <td id='i_la_$i'><img src='$imagenes_botones[$i]' id='icono'></td>
    <td id='m_la_$i' class='nombres_boton'>$nombre_botones[$i]</td>
</tr>
</table>
</li>
";

}

?>
</ul>
</div>

<div id="protector" onclick="minimizar()">

</div>

<div onclick="acciones_botones()" id="encojer_menu">
    <img src="Imagenes/7.png">
</div>

<!--cuerpo-->

<div id="cuerpo_pagina">

<!--Ajusta el interior-->



<h1>Gestión de Propietario</h1>
<h2 id="nombre_car">Archivo</h2>

<?php
include "PHP/unir_fragmentos.php";
?>

<?php
include "PHP/tablas/Buscardor_tabla.php";
?>

<?php
include "PHP/tablas/unir_tablas_principales.php";
?>
</div>

<?php
include "PHP/archivo/unir_emergentes.php";
?>

<?php
include "PHP/agregar/unir_emergentes.php";
?>

<?php
include "PHP/reportes/unir_emergentes.php";
?>

<?php
include "PHP/celda/unir_emergentes.php";
?>