<?php
include "1_Raiz/cabezal.php";
?>

<nav class ="cuerpo">
<nav class="menu2">
<button type="button" class="menu_2"> <img src="imagenes\7.png" width="32px" height="32px"> </button>
    <ul>
    <li><table><tr><td class="t_l"><img class="logo" src="imagenes/logo principal.png" ></td></tr></table></li>
    <li><a href="1_archi.php"><table><tr><td class="imagen"><img src="imagenes/2.png" class="imagen"></td><td class="te_menu2">Archivo</td></tr></table></a></li>
    <li><a href="2_edicion.php"><table><tr><td class="imagen"><img src="imagenes/6.png" class="imagen"></td><td class="te_menu2">Edición</td></tr></table></a></li>
    <li class="marcado"><a href="3_reportes.php"><table><tr><td class="imagen"><img src="imagenes/1.png" class="imagen"></td><td class="te_menu2">Reportes</td></tr></table></a></li>
    <li><a href="4_herramientas.php"><table><tr><td class="imagen"><img src="imagenes/3.png" class="imagen"></td><td class="te_menu2">Herramientas</td></tr></table></a></li>
    <li><a href="pantalla_inicio.php">Atras</a></li>
    </ul>
</nav>
<h1 class="centro">Gestion de propietario</h1>
<h2 class="centrados">Villas palma real</h2>

<nav id="menu_repor" class="menu">

    <ul>
        <li><a href="#" onclick="abrir_saldo()">Saldos</a></li>
        <li><a href="">Estado de cuenta</a></li>
        <li><a href="">Recuperaciones</a></li>
        <li><a href="">Cobro de facturas</a></li>
        <li><a href="">Docto. Cobrar</a></li>
     </ul>

</nav>

<nav id="menu_her" class="divicion">

    <ul></ul>

</nav>

<div>
<?php
//Tabla principal y busqueda
 include "Tablas/tabla_principal.php";
?>

</div>

<?php
//tabla de compra
include "a_reportes/r_r.php";
?>

<?php
include "1_Raiz/final.php";
?>

<script src="a_reportes/Saldos/abrir_emergrnte.js"></script>