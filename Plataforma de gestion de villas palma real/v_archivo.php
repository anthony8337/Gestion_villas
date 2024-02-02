<?php
include "1_Raiz\cabezal.php";
?>



<nav class ="cuerpo">
<nav class="menu2">
    <ul>
    <li><img class="logo" src="imagenes/logo principal.png" width="150" height="150"></li>
    <li class="marcado"><a href="v_archivo.php">Archivo</a></li>
    <li><a href="v_edicion.php">Edicion</a></li>
    <li><a href="v_reportes.php">Reportes</a></li>
    <li><a href="v_herramientas.php">Herramientas</a></li>
    <li><a href="#5">Salir</a></li>
    <li><a href="login.php">Visualizar login</a></li>
    </ul>
</nav>
<h1 class="centro">Registro de villas Palma real </h1>

<nav class="menu">

    <ul>
        <li><a href="#" onclick="mostrarcuadro_selec_insertar()">Nuevo</a></li>
        <li><a href="#" onclick="mostrarcuadro_selec_editar()">Edicion</a></li>
        <li><a href="#" onclick="mostrarcuadro_selec_suspender()">Suspender</a></li>
     </ul>

</nav>

<div>

<?php
//tabla de editar
include "Ventana_emergente/edicion/seleccionar_editar.php";
?>

<?php
//tabla de suspender
include "Ventana_emergente/suspencion/seleccionar_suspender.php";
?>

<?php
//tabla de suspender
include "Ventana_emergente/cliente_villa/seleccionar_ingreso.php";
?>

<?php
//Tabla principal y busqueda
 include "Tablas/tabla_principal.php";
?>
</div>

<?php
//tabla de ingres
include "Ventana_emergente/cliente_villa/e_nuevo.php";
?>

<?php
//tabla de compra
include "Ventana_emergente/cliente_villa/e_venta.php";
?>


<?php
//tabla de villas ingreso
include "Ventana_emergente/cliente_villa/e_villa.php";
?>

<?php
//tabla de seleccion de cliente a editar
include "Ventana_emergente/edicion/selec_cliente.php";
?>

<?php
//tabla de seleccion de villa a editar
include "Ventana_emergente/edicion/selec_villa.php";
?>

<?php
//tabla de seleccion de cliente a editar
include "Ventana_emergente/edicion/editar_villa.php";
?>

<?php
//tabla de seleccion de cliente a editar
include "Ventana_emergente/edicion/editar_cliente.php";
?>

<?php
include "Ventana_emergente/suspencion/selec_villa_sus.php";
?>

<?php
include "Ventana_emergente/suspencion/decicion_sus_villa.php";
?>