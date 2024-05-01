<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/usuarios.css'>


<div  class="encabezado">
<h1>Gestion de propietario</h1>

<h2>Bienvenido Usuario</h2>

<div onclick="redirigir_login()" class="retorno" title="Salir">
<img src="Imagenes/box-arrow-in-left.svg">
</div>

<div onclick="redirigir_sistema()" class="entrada" title="Entrar a gestión">
    <img src="Imagenes/box-arrow-in-right.svg">
</div>

</div>

<div id="acc_1">
    <?php
    $a = ['Usuario','Actividad'];
    $b = ['cu_2()','cu_3()'];
    
    for($i = 0; $i < count($a); $i++)
    {
        echo"
        <button onclick='$b[$i]'>$a[$i]</button>
        ";
    }
    ?>
</div>

<div id="ac_2">
    <?php
    $a = ['Ingresar'];
    $b = ['redirigir_sistema()'];
    
    for($i = 0; $i < count($a); $i++)
    {
        echo"
        <button onclick ='$b[$i]' >$a[$i]</button>
        ";
    }
    ?>
</div>

<div id="ac_3">
    <button onclick="ingresar_usuario_in()">Agregar nuevo</button>
    <input type="text" placeholder="Buscar usuario">
    <select title="Estado">
        <option>Activos</option>
        <option>Suspendidos</option>
        <option>Todo</option>
    </select>
    <div>
        <table>
            <tr>
                <th>Usuario</th>
                <th>Nombre Completo</th>
                <th>DNI</th>
                <th>Teléfono</th>
                <th>Correo</th>
                <th>Tipo de usuario</th>
                <th>Contraseña</th>
                <th>Estado</th>
                <th></th>
            </tr>

            <?php

include "PHP/tablas/datos_random.php";

            for ($i=0; $i < 9; $i++) { 
              echo"
            <tr>
            <td>",$nombre[rand(0,count($nombre)-1)],"</td>
            <td>",$nombre[rand(0,count($nombre)-1)]," ",$Snombre[rand(0,count($Snombre)-1)]," ",
            $apellido[rand(0,count($apellido)-1)]," ",$sapellido[rand(0,count($sapellido)-1)],"</td>
            <td>0101-",rand(1950,2000),"-",rand(10000,50000),"</td>
            <td>+504 ",rand(80000000,99999999),"</td>
            <td>ejemplo@gmail.com</td>
            <td>Usuario</td>
            <td>12345678</td>
            <td>
            <button id='modi_carac'>
            <img src='Imagenes/pencil-fill.svg'>
            </button>
            <button id='eli_carac'>
                <img src='Imagenes/trash3-fill.svg'>
            </button>
            </td>
            </tr>
              ";
            }
            ?>
        </table>
    </div>
</div>

<div id="ac_4">

<div class="q_1">

<label>Numero de Whatsaap Bussunes</label>
<input type="text">

</div>

<div class="q_2">
<h3>Configurar usuarios</h3>
<table>
    <tr>
        
        <?php
        $a = ['Permitir Edición','Permitir Suspención','Acceso a reportes'];

        for ($i=0; $i < count($a); $i++) { 
           echo"
           <td>
           <input id='cu_$i' type='checkbox' checked> $a[$i]
           </td>
           ";
        }
        ?>
    </tr>
</table>

</div>

</div>
