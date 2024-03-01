<?php
include "1_Raiz/cabezal.php";
?>

<nav class ="cuerpo">
<nav class="menu2">
<button type="button" class="menu_2"> <img src="imagenes\7.png" width="32px" height="32px"> </button>
    <ul>
    <li><table><tr><td class="t_l"><img class="logo" src="imagenes/logo principal.png" ></td></tr></table></li>
    <li><a href="1_archi.php"><table><tr><td class="imagen"><img src="imagenes/2.png" class="imagen"></td><td class="te_menu2">Archivo</td></tr></table></a></li>
    <li class="marcado"><a href="2_edicion.php"><table><tr><td class="imagen"><img src="imagenes/6.png" class="imagen"></td><td class="te_menu2">Edición</td></tr></table></a></li>
    <li><a href="3_reportes.php"><table><tr><td class="imagen"><img src="imagenes/1.png" class="imagen"></td><td class="te_menu2">Reportes</td></tr></table></a></li>
    <li><a href="4_herramientas.php"><table><tr><td class="imagen"><img src="imagenes/3.png" class="imagen"></td><td class="te_menu2">Herramientas</td></tr></table></a></li>
    <li><a href="#5">Salir</a></li>
    <li><a href="login.php">Visualizar login</a></li>
    </ul>
</nav>
<h1 class="centro">Registro de villas Palma real </h1>

<nav class="menu">

    <ul>
        <li><a href="#" onclick="abrir_moneda()">Monedas</a></li>
        <li><a href="#" onclick="abrir_co()">Conceptos</a></li>
        <li><a href="#" onclick="abrir_mov()">Movimientos</a></li>
        <li><a href="#" onclick="abrir_ges()"> G. Cuentas</a></li>
        <li><a href="#" onclick="abrir_concepto()">Multipagos</a></li>
        <li><a href="#" onclick="abrir_rei()">Reimpresion</a></li>
     </ul>


<?php
//Tabla principal y busqueda
 include "Tablas/tabla_principal.php";
?>
</nav>


<?php
//Tabla principal y busqueda
 include "a_edicion/e_e_l.php";
?>


<script src="a_edicion/ventanas_emergentes.js"></script>

<script src="a_edicion/Moneda/trasladoMoneda.js"></script>

<script src="a_edicion/concepto/traslado_cocepto.js"></script>

<script src="a_edicion/Movimientos/cliente_mov_traslado.js"></script>

<script src="a_edicion/Movimientos/traslado_concepto.js"></script>

<script src="a_edicion/Reimpresion/traslado.js"></script>