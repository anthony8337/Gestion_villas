<?php
include "1_Raiz/cabezal.php";
?>
<br>
<h1 class="centro">BIENVENIDO Usuario</h1>

<button type="button" id="b_1" class="boton_inicio" style="background-color: rgb(170, 170, 170);" onclick="inicio()" >Inicio</button>
<button type="button" id="b_2" class="boton_perfil" onclick="perfil()">Perfil</button>
<button type="button" id="b_3" class="boton_usuario" onclick="a_usuario()">Agregar usuario</button>
<!--<button type="button" id="b_4" class="boton_confi" onclick="confi()">Configuracion</button>-->

<div style="border: 1px solid grey; height: 560px;" id="p1">

<div style="margin-top: 10px;">
<button type="button" style="width: 150px; height: 50px; float: left;" onclick="salir_login()">Cerrar</button>
<button type="button" style="width: 150px; height: 50px; float: left;" onclick="abrir_principal()">Gestionar Cobros</button>

<img class="ajus_imajen_principal" src="imagenes/logo principal.png">

</div>
</div>

<div style="padding-left: 30%; border: 1px solid grey; height: 560px; display: none; text-align: center;" id="p2">

<div style="margin-top: 25px; width: 450px; height: 450px; border: 2px solid black; border-radius: 10px; padding-right: 20px; padding-left: 20px;">
            <h2 class="centro_subtitulo">Perfil de Usuario</h2>
            
    <table class="alinear_titulo" style="height: 350px;">
    
    <tr>
    <td><label for="nombre">Usuario:</label></td>
    <td style="text-align: center;"><label id="nombre">anthonyoliva</label></td>
    </tr>

    <tr>                
                <td><label for="nombre">Nombre completo:</label></td>
                <td style="text-align: center;"><label id="nombre">Anthony Clemente Oliva Murillo</label></td>
            </tr>

            <tr>
                <td><label for="edad">DNI:</label></td>
                <td style="text-align: center;"><label id="edad">0101199903209</label></td>
            </tr>

            <tr>
                <td><label for="Fecha de nacimiento">Fecha de nacimiento:</label></td>
                <td style="text-align: center;"><label id="f_nac">12-08-1999</label></td>
            </tr>

            <tr>
                <td><label for="correo">Correo electrónico:</label></td>
                <td style="text-align: center;"><label id="correo">anthony@gmail.com</label></td>
            </tr>

            <tr>
                <td><label for="ciudad">Residencia:</label></td>
                <td style="text-align: center;"><label id="ciudad">La ceiba</label></td>
            </tr>

            <tr>
                <td><label for="acceso">Tipo de Acceso:</label></td>
                <td style="text-align: center;"><label id="acceso">Usuario</label></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center;">
                <button type="button">Editar perfil</button>
                </td>
            </tr>
        </table>

    </div>

    

</div>

<div style="border: 1px solid grey; height: 560px; display: none;" id="p3">
<div style="margin-top: 10px;">
<button type="button" class="boto_agre" onclick="insertar_usuario()">Agregar nuevo usuario</button>
<button type="button" class="boto_agre">Imprimir lista de usuarios</button>
</div>

<?php
include "pantalla_principal/Agre_perfiles.php";
?>

<div style="margin-top: 10px; width: 100%; height: 480px; border: 2px solid black; border-radius: 10px; float: inline-end;">

<table>
    <tr>
        <th>Usuario</th>
        <th>Nombre Completo</th>
        <th>DNI</th>
        <th>Fecha Nac.</th>
        <th>Correo Electronico.</th>
        <th>Residencia</th>
        <th>Tipo de acceso</th>
        <th>contraseña</th>
    </tr>

    <tr>
        <td>anthonyoliva</td>
        <td>Anthony Clemente Oliva Murillo</td>
        <td>0101199903209</td>
        <td>12/08/1999</td>
        <td>anthony@gmail.com</td>
        <td>La ceiba</td>
        <td>Usuario</td>
        <td>HolaMundo</td>
    </tr>
</table>

</div>

</div>

<div style="border: 1px solid grey; height: 560px; display: none;" id="p4">
pollo
</div>







<script src="redirigir.js"></script>

<script src="compor_p_p/abrir_paneles.js"></script>
<script src="compor_p_p/ventanas_emergentes.js"></script>

<?php
include "1_Raiz/final.php";
?>