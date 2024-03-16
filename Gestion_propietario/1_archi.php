<?php
include "1_Raiz/cabezal.php";
?>

<div class="loader-wrapper">
        <div class="loader"></div>
        <label>Cargando...</label>
</div>


<nav class ="cuerpo" id="cuerpo">

<nav id="m2" class="menu2">
<ul>
<button type="button" id="b_des" class="menu_2" onclick="accion_menu_lateral()"> <img src="imagenes\7.png" width="32px" height="32px"></button>
    <li><table style="height: 150px; padding: 0px;"><tr><td class="t_l"><img id="logo" class="logo" src="imagenes/logo principal.png" ></td></tr></table></li>
    <li id="bb1"><a href="#Archivo" onclick="archivo()"><table class="tab_menu"><tr><td class="imagen"><img src="imagenes/2.png" class="imagen"></td><td id="a1" class="te_menu2">Archivo</td></tr></table></a></li>
    <li id="bb2"><a href="#Agregar" onclick="adicion()"><table class="tab_menu"><tr><td class="imagen"><img src="imagenes/6.png" class="imagen"></td><td id="a2" class="te_menu2">Agregar</td></tr></table></a></li>
    <li id="bb3"><a href="#Reportes" onclick="reporte()"><table class="tab_menu"><tr><td class="imagen"><img src="imagenes/1.png" class="imagen"></td><td id="a3" class="te_menu2">Reportes</td></tr></table></a></li>
    <li id="bb4"><a href="#Herramientas" onclick="herramenta()"><table class="tab_menu"><tr><td class="imagen"><img src="imagenes/3.png" class="imagen"></td><td id="a4" class="te_menu2">Herramientas</td></tr></table></a></li>
    <li id="bb5"><a href="pantalla_inicio.php"><table class="tab_menu"><tr><td class="imagen"><img src="imagenes/8.png" class="imagen"></td><td id="a5" class="te_menu2">Atras</td></tr></table></a></li>
    
    </ul>
</nav>

<h1 class="centro">Gestion de propietario</h1>
<h2 class="centrados">Villas palma real</h2>


<nav id="menu_archi" class="menu">

    <ul>
        <li><a href="#" onclick="abrir_Seleccion()">Nuevo</a></li>
        <li><a href="#" onclick="abrir_m_Seleccion()">Editar</a></li>
        <li><a href="#" onclick="seleccion_sus()">Suspender</a></li>
     </ul>
</nav>

<nav id="menu_edi" class="menu">

    <ul>
        <li><a href="#" onclick="abrir_moneda()">Monedas</a></li>
        <li><a href="#" onclick="abrir_co()">Conceptos</a></li>
        <li><a href="#" onclick="abrir_ges()"> G. Cuentas</a></li>
        <li><a href="#" onclick="abrir_concepto()">Pago multiple</a></li>
        <li><a href="#" onclick="abrir_rei()">Reimpresion</a></li>
     </ul>

</nav>

<nav id="menu_repor" class="menu">
<ul>
    <li><a href="#" onclick="abrir_saldo()">Saldos</a></li>
    <li><a href="">Estado de cuenta</a></li>
    <li><a href="">Cobro de facturas</a></li>
 </ul>

</nav>


<nav id="menu_her" class="menu">

    <ul>
        <li></li>
    </ul>

</nav>

<?php
//Tabla principal y busqueda
 include "Tablas/tabla_principal.php";
?>
</nav>
<?php
 include "a_edicion/e_e_l.php";
?>

<?php
 include "a_archivo/completar_archivo.php";
?>

</nav>



<script src="a_archivo/mostar.js"></script>

<script src="menu_izquierdo.js"></script>

<script src="a_reportes/Saldos/abrir_emergrnte.js"></script>

<script src="accionar.js"></script>

<script src="revelar.js"></script>
