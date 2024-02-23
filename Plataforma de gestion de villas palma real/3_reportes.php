<?php
include "1_Raiz/cabezal.php";
?>

<nav class ="cuerpo">
<nav class="menu2">
<button type="button" class="menu_2"> <img src="imagenes\7.png" width="32px" height="32px"> </button>
    <ul>
    <li><table><tr><td class="t_l"><img class="logo" src="imagenes/logo principal.png" ></td></tr></table></li>
    <li><a href="1_archivo.php"><table><tr><td class="imagen"><img src="imagenes/2.png" class="imagen"></td><td class="te_menu2">Archivo</td></tr></table></a></li>
    <li><a href="2_edicion.php"><table><tr><td class="imagen"><img src="imagenes/6.png" class="imagen"></td><td class="te_menu2">Edición</td></tr></table></a></li>
    <li class="marcado"><a href="3_reportes.php"><table><tr><td class="imagen"><img src="imagenes/1.png" class="imagen"></td><td class="te_menu2">Reportes</td></tr></table></a></li>
    <li><a href="4_herramientas.php"><table><tr><td class="imagen"><img src="imagenes/3.png" class="imagen"></td><td class="te_menu2">Herramientas</td></tr></table></a></li>
    <li><a href="#5">Salir</a></li>
    <li><a href="login.php">Visualizar login</a></li>
    </ul>
</nav>
<h1 class="centro">Registro de villas Palma real </h1>

<nav class="menu">

    <ul>
        <li><a href="">Saldos</a></li>
        <li><a href="">Estado de cuenta</a></li>
        <li><a href="">Recuperaciones</a></li>
        <li><a href="">Cobro de facturas</a></li>
        <li><a href="">Docto. Cobrar</a></li>
     </ul>

</nav>

<div>
<?php
//Tabla principal y busqueda
 include "Tablas/tabla_principal.php";
?>

</div>

<?php
//tabla de compra
include "Ventana emergente/v_compra.php";
?>

<?php
include "1_Raiz/final.php";
?>