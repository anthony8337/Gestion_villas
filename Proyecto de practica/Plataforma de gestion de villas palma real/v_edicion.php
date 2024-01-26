<?php
include "1_Raiz\cabezal.php";
?>

<nav class ="cuerpo">
<nav class="menu2">
    <ul>
    <li><img class="logo" src="imagenes/logo principal.png" width="150" height="150"></li>
    <li><a href="v_archivo.php">Archivo</a></li>
    <li class="marcado"><a href="v_edicion.php">Edicion</a></li>
    <li><a href="v_reportes.php">Reportes</a></li>
    <li><a href="v_herramientas.php">Herramientas</a></li>
    <li><a href="#5">Salir</a></li>
    <li><a href="login.php">Visualizar login</a></li>
    </ul>
</nav>
<h1 class="centro">Registro de villas Palma real </h1>

<nav class="menu">

    <ul>
        <li><a href="">Monedas</a></li>
        <li><a href="">Conceptos</a></li>
        <li><a href="">Movimientos</a></li>
        <li><a href="">G. Cuentas</a></li>
        <li><a href="">Multipagos</a></li>
        <li><a href="">Reimpresion</a></li>
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