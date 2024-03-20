<div id="menu_lateral">
<img src="Imagenes/logo_principal.png" id="logo">
<ul>
<?php
$nombre_botones = ['Archivo','Agregar','Reportes','Herraminetas','Salir'];
$imagenes_botones = ['Imagenes/2.png','Imagenes/5.png','Imagenes/6.png','Imagenes/3.png','Imagenes/8.png'];

for ($i=0; $i < count($nombre_botones); $i++) { 


echo"
<li>
<table>
<tr>
    <td id='i_la_$i'><img src='$imagenes_botones[$i]' id='icono'></td>
    <td id='m_la_$i'>$nombre_botones[$i]</td>
</tr>
</table>
</li>
";

}

?>
</ul>
</div>

<div onclick="acciones_botones()" id="encojer_menu">
    <img src="Imagenes/7.png">
</div>

<!--cuerpo-->

<div id="cuerpo_pagina">
<!--Ajusta el interior-->
<div>

<h1>Gestion de propietario</h1>
<h2>villa palma real</h2>

<?php
include "PHP/archivo/archi.php";
?>

<div id="ver_cuadros">

<table>
    <tr>
        <td>
        <input type="radio" name="v_lista" id="rb_pro" checked>Ver propietarios
        <br>
        <input type="radio" name="v_lista" id="rb_villas">Ver villas
        </td>
        
        <td>
        <input type="text" name="Busca_prin" id="Busca_prin" placeholder="Buscar propietario">
        </td>

        <td><button type="button">Imprimir</button></td>
    </tr>
</table>







</div>


</div>

</div>