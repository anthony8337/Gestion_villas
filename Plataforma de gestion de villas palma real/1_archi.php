<?php
include "1_Raiz/cabezal.php";
?>

<nav class ="cuerpo">
<nav class="menu2">
<button type="button" class="menu_2"> <img src="imagenes\7.png" width="32px" height="32px"> </button>
    <ul> 
    <li><table><tr><td class="t_l"><img class="logo" src="imagenes/logo principal.png" ></td></tr></table></li>
    <li class="marcado"><a href="1_archivo.php"><table><tr><td class="imagen"><img src="imagenes/2.png" class="imagen"></td><td class="te_menu2">Archivo</td></tr></table></a></li>
    <li><a href="2_edicion.php"><table><tr><td class="imagen"><img src="imagenes/6.png" class="imagen"></td><td class="te_menu2">Edición</td></tr></table></a></li>
    <li><a href="3_reportes.php"><table><tr><td class="imagen"><img src="imagenes/1.png" class="imagen"></td><td class="te_menu2">Reportes</td></tr></table></a></li>
    <li><a href="4_herramientas.php"><table><tr><td class="imagen"><img src="imagenes/3.png" class="imagen"></td><td class="te_menu2">Herramientas</td></tr></table></a></li>
    <li><a href="#5">Salir</a></li>
    <li><a href="login.php">Visualizar login</a></li>
    <li><a href="pantalla_inicio.php">menu mi rey</Menu></a></li>
    </ul>
</nav>
<h1 class="centro">Registro de villas Palma real </h1>

<nav class="menu">

    <ul>
        <li><a href="#" onclick="abrir_Seleccion()">Nuevo</a></li>
        <li><a href="#" onclick="abrir_m_Seleccion()">Editar</a></li>
        <li><a href="#" onclick="abrir_mov()">Suspender</a></li>
     </ul>


<?php
//Tabla principal y busqueda
 include "Tablas/tabla_principal.php";
?>
</nav>


<?php
//Tabla principal y busqueda
 include "a_archivo/completar_archivo.php";
?>


<script src="a_archivo\mostar.js"></script>