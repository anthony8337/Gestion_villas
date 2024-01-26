<?php
include "1_Raiz/cabezal.php";
?>

<style>
    body
    { 
    background: linear-gradient(to right,rgb(255, 249, 161), rgb(207, 141, 94))
    }
   
</style>

<link rel="stylesheet" href="../CSS/login_estilo.css">

<form>
<img class="log_imagen" src="imagenes/logo principal.png" width="150" height="150">
    <div class="panel">
        <h1 class="centro">iniciar seccion</h1>
        <div class="centrar">
        <div><label>Ingrese su nombre de usuario o correo</label></div>
        <div><input type="text" id="Usuario" name="Usuario"></div>
        <div><label>Ingrese su contraseña</label></div>
        <div><input type="password" id="Clave" name="Clave"></div>
        <button class="ingresar" type="button">Entrar</button>
        </div>
    </div>
</form>