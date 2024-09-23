<div id="menu_lateral">
<img src="Imagenes/logo_principal.png" id="logo">
<ul>
<?php
$nombre_botones = ['Inicio','Archivo','Agregar','Reportes','Salir'];
$imagenes_botones = ['Imagenes/house-door-fill.svg','Imagenes/folder.svg','Imagenes/journal-text.svg','Imagenes/clipboard2-data.svg','Imagenes/box-arrow-left.svg'];
$titulos = ['Retornar a la plantilla administrador','Nueva información','Pago de propietario','Reportes de movimientos','Salir'];
$acciones = ['redirigir_principal()','precionar_b0()','precionar_b1()','precionar_b2()','redirigir_login()'];
$id_menu = ['li_3','li_0','li_1','li_2','li_4'];

for ($i=0; $i < count($nombre_botones); $i++) { 


echo"
<li id='$id_menu[$i]' onclick='$acciones[$i]' title='$titulos[$i]'>

<img src='$imagenes_botones[$i]' class='icono'>
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



<h1>Gestión del propietario</h1>
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

