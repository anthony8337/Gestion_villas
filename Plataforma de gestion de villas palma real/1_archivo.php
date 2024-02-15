<?php
include "1_Raiz/cabezal.php";
?>



<nav class ="cuerpo">

<nav class="menu2">
    <ul>
    <li><img class="logo" src="imagenes/logo principal.png" width="150" height="150"></li>
    <li class="marcado"><a href="1_archivo.php">Archivo</a></li>
    <li><a href="2_edicion.php">Edicion</a></li>
    <li><a href="3_reportes.php">Reportes</a></li>
    <li><a href="4_herramientas.php">Herramientas</a></li>
    <li><a href="#5">Salir</a></li>
    <li><a href="login.php">Visualizar login</a></li>
    </ul>
</nav>
<h1 class="centro">Registro de villas Palma real </h1>

<nav class="menu">

    <ul>
        <li><a href="#" onclick="mostrar_decision_insertar()">Nuevo</a></li>
        <li><a href="#" onclick="selec_editar()">Edicion</a></li>
        <li><a href="#" onclick="mostrarcuadro_selec_suspender()">Suspender</a></li>
     </ul>

</nav>


<?php
//Tabla principal y busqueda
 include "Tablas/tabla_principal.php";
?>
</nav>

<?php
//Cuadros emergentes
 include "a_archivo/r_e_i.php";
?>

<script src="a_archivo/cuadro_emergente.js"></script>
<script src="a_archivo/Edicion/Traslado_edicion.js"></script>
<script src="a_archivo/Edicion/Traslado_edicion_villa.js"></script>

<?php
include "1_Raiz/final.php";
?>