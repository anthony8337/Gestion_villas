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
    <li><a href="3_reportes.php"><table><tr><td class="imagen"><img src="imagenes/1.png" class="imagen"></td><td class="te_menu2">Reportes</td></tr></table></a></li>
    <li class="marcado"><a href="4_herramientas.php"><table><tr><td class="imagen"><img src="imagenes/3.png" class="imagen"></td><td class="te_menu2">Herramientas</td></tr></table></a></li>
    <li><a href="pantalla_inicio.php">Atras</a></li>
    </ul>
</nav>
<h1 class="centro">Gestion del propietario de villa</h1>

<nav class="divicion">

    <ul></ul>

</nav>

<div class="E_herramienta">

<table class="tabla_herramienta">
    <tr>
        <td>
        <div class="f_boton" onclick="mostrarcuadro()">
        <img class="im_ico" src="imagenes/1_ico.png" width="50px" height="50px">
        <br>
            <Label>Exportar a excel</Label>
            </div>
        </td>
        <td>
        <div class="f_boton" onclick="mostrarcuadro()">
        <img class="im_ico" src="imagenes/3_ico.png" width="50px" height="50px">
        <br>
        <Label>Exportar a pdf</Label>
        </div>
        </td>

        <td>
        <div class="f_boton" onclick="mostrarcuadro()">
        <img class="im_ico" src="imagenes/2_ico.png" width="50px" height="50px">
        <br>
        <Label>Exportar a word</Label>
        </div>
        </td>
    </tr>
</table>
</div>
<!--Llamado de las ventanas emergentes-->
<?php
//tabla de compra
include "Ventana_emergente/cliente_villa/e_nuevo.php";
?>

<?php
include "1_Raiz/final.php";
?>