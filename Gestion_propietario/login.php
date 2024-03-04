<?php
include "1_Raiz/cabezal.php";
?>

<style>
    body
    { 
    background: linear-gradient(to right,rgb(255, 249, 161), rgb(207, 141, 94))
    }
   
</style>

<img class="log_imagen" src="imagenes/logo principal.png" width="150" height="150">



    <div class="panel" id="inicio">
        <h1 class="centro">iniciar seccion</h1>
        
        <div style="text-align: center; margin-top: 25px;">
        <input type="text" id="usuario" name="Usuario" placeholder="Ingrese su usuario">
        </div>

        <div style="text-align: center; margin-top: 25px;">
        <input type="password" id="clave" name="Usuario" placeholder="Ingrese su contraseña">
        </div>

        <div style="text-align: center; margin-top: 25px;">
        <a href="#" onclick="recu()" style="margin-top: 20px;">¿Olvidaste tu usuario o contraseña?</a>
        </div>

        <button class="ingresar" type="button" onclick="abrir()">Entrar</button>
    </div>

    <div class="panel_contra" id="soli">
        <h1 class="centro">Solicitar usuario y contraseña</h1>
        

        <div style="text-align: center; margin-top: 50px;">
        <input type="text" id="clave" name="Usuario" placeholder="ejemplo@email.com">
        </div>



        <button class="ingresar" type="button" onclick="cargar()">Enviar</button>
    </div>

    


<script src="Extencion/ac_login.js"></script>
<script src="compor_p_p/recupera.js"></script>