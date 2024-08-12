<div id="menu_lateral">
<img src="Imagenes/logo_principal.png" id="logo">
<ul>
<?php
$nombre_botones = ['Archivo','Agregar','Reportes','Principal','Salir'];
$imagenes_botones = ['Imagenes/folder-fill.svg','Imagenes/journal-text.svg','Imagenes/clipboard2-data.svg','Imagenes/person-fill(1).svg','Imagenes/box-arrow-left.svg'];
$titulos = ['Nueva información','Pago de propietario','Reportes de movimientos','Retornar a la plantilla administrador','Salir'];
$acciones = ['precionar_b0()','precionar_b1()','precionar_b2()','redirigir_principal()','redirigir_login()'];

for ($i=0; $i < count($nombre_botones); $i++) { 


echo"
<li id='li_$i' onclick='$acciones[$i]' title='$titulos[$i]'>

<img src='$imagenes_botones[$i]' id='icono'>
<span id='m_la_$i' >$nombre_botones[$i]</span>

</li>
";

}

?>
</ul>
</div>



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