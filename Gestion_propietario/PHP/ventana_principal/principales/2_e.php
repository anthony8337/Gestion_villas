<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/mod_usu.css'>

<div id="usuarios_ingreso" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_usuario_in()" type="button">X</button>
<h2>Ingresar nuevo usuario</h2>
</div>

<div class="c2">



<?php

$campos = ['Usuario','Nombre Completo','DNI','Telefono','Correo','Contraseña','Tipo de usuario','Estado'];

for ($i=0; $i < count($campos); $i++) { 

    if($i == (count($campos) - 2))
    {
        echo"
        <select title='$campos[$i]'>
        <option>Tecnicó</option>
        <option>Usuario</option>
        </select>";
    } 
    else if($i == (count($campos) - 1))
    {
    echo"
    <select title='$campos[$i]'>
    <option>Activo</option>
    <option>Descartado</option>
    </select>";
    }
    else if($i == 5)
    {
        echo"
        <input type='password' title='$campos[$i]' placeholder='$campos[$i]'>
        ";
    }
    else
    {
    echo"
    <input type='text' title='$campos[$i]' placeholder='$campos[$i]'>
    ";
}
}

?>

</div>


<div class="c3">

<button>Crear nuevo</button>

</div>