<?php
include "1_Raiz\cabezal.php";
?>

<nav class ="cuerpo">
<nav class="menu2">
    <ul>
    <li><img class="logo" src="imagenes/logo principal.png" width="150" height="150"></li>
    <li><a href="1_archivo.php">Archivo</a></li>
    <li><a href="2_edicion.php">Edicion</a></li>
    <li><a href="3_reportes.php">Reportes</a></li>
    <li class="marcado"><a href="4_herramientas.php">Herramientas</a></li>
    <li><a href="#5">Salir</a></li>
    <li><a href="login.php">Visualizar login</a></li>
    </ul>
</nav>
<h1 class="centro">Registro de villas Palma real </h1>

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