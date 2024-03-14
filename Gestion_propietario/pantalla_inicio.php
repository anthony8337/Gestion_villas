<?php
include "1_Raiz/cabezal.php";
?>

<div class="loader-wrapper">
        <div class="loader"></div>
        <label>Cargando...</label>
</div>

<div class="cuerpo_principal">

<h1 class="centro">BIENVENIDO Usuario</h1>

<div class="perfil">
    <img src="imagenes/perfil.png" height="45px" width="45px">
</div>

<div class="ajuste">
<img src="imagenes/configuracion.png" height="50px" width="50px">
</div>

<button onclick="inicio_principal()" id="b_p1" type="button" class="b_principal">Inicio</button>
<button onclick="perfiles_principal()" id="b_p2" type="button" class="b_principal">Perfiles</button>
<button onclick="ajustes_principal()"id="b_p3" type="button" class="b_principal">Ajustes</button>

<!--Inicio-->
<div id="pp1" class="cuerpo_inicio">
<?php
include "pantalla_principal/p1.php";
?>
</div>

<!--Perfiles-->
<div id="pp2" class="cuerpo_perfiles">

<?php
include "pantalla_principal/p2.php";
?>
</div>

<!--Ajustes-->
<div  id="pp3"  class="cuerpo_ajustes">
<?php
include "pantalla_principal/p3.php";
?>
</div>


<script src="redirigir.js"></script>
<script src="compor_p_p/abrir_paneles.js"></script>
<script src="compor_p_p/ventanas_emergentes.js"></script>
<script src="revelar.js"></script>
</div>

<?php
include "pantalla_principal/Agre_perfiles.php";
?>

<?php
include "1_Raiz/final.php";
?>
