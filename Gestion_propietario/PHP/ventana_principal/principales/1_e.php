<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/usuarios.css'>


<div class="encabezado">
<h1>Gestion de propietario</h1>

<h2>Bienvenido Usuario</h2>
</div>

<div id="acc_1">
    <?php
    $a = ['Inicio','Usuario','Actividad'];
    $b = ['cu_1()','cu_2()','cu_3()'];
    
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
    $a = ['Ingresar','Salir'];
    $b = ['redirigir_sistema()','redirigir_login()'];
    
    for($i = 0; $i < count($a); $i++)
    {
        echo"
        <button onclick ='$b[$i]' >$a[$i]</button>
        ";
    }
    ?>
</div>

<div id="ac_3">
    <button>Agregar nuevo</button>
    <input type="text" placeholder="Buscar usuario">

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
            for ($i=0; $i < 100; $i++) { 
              echo"
            <tr>
            <td>Usuario</td>
            <td>Nombre Completo</td>
            <td>DNI</td>
            <td>Teléfono</td>
            <td>Correo</td>
            <td>Tipo de usuario</td>
            <td>Contraseña</td>
            <td></td>
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

<script>

window.onload = cu_1();

</script>