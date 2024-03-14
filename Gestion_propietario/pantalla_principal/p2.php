
<button onclick="insertar_usuario()" style="float: inline-start;" type="button">Crear nuevo</button>

<input id="bus_usuarios" type="text" placeholder="Buscar usuario" style="width: 30%; position: relative; left: 10px;">

<button style="float: inline-end;" type="button">Imprimir Lista</button>
<!--panel en adelante-->
<div id="div_grupo" style="width: 90%; height: 550px;  overflow: auto; padding-left: 10%;">



<?php

include 'Tablas/datos_random.php';

$puesto;

for ($i=0; $i < count($nombre); $i++) { 

    if($i % 5 ==0)
    {
        $puesto = "Tecnico";
    }
    else
    {
        $puesto = "Usuario";
    }
    
    echo"
    <div class='formato_perfiles'>
    <div class='contenidos'>

    <div class='confi_perfiles'>
    <img src='imagenes/configuracion.png' width='50px' height='50px'>
    </div>

    <div class='per_usuarios'>
    <img src='imagenes/perfil.png' width='110px' height='110px'>
    </div>

    <div class='datos_usuarios'>
    <table class='b_t_perfiles'>
        <tr>
        <td>
        <label>$nombre[$i] $apellido[$i]</label>
        </td>
        </tr>

        <tr>
        <td>
        <label>$nombre[$i]$apellido[$i]@gmail.com</label>
        </td>
        </tr>

        <tr>
        <td>
        <label>$puesto</label>
        </td>
        </tr>
        </table>
    </div>

    </div>
    </div>
    ";

}

?>
</div>

<script src="pantalla_principal/bus_perfil.js"></script>