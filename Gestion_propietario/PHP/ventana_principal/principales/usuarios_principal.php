<link rel='stylesheet' type='text/css' media='screen' href='CSS/pan_confi.css'>

<h1>Gestión de propietario</h1>

<h2>Bienvenido Usuario</h2>

<div class="menu_ho">

<ul>
<?php
    $a = ['Usuario','Actividad'];
    $b = ['cua_1()','cua_2()'];
    $c = ['Imagenes/perfil.png','Imagenes/configuracion.png'];
    
    for($i = 0; $i < count($a); $i++)
    {
        echo"
        <li tittle='$a[$i]' onclick='$b[$i]'><img src='$c[$i]'><label class='titulos_grandes'>$a[$i]</label></li>
        ";
    }
    ?>
</ul>


</div>

<div id="ac_1">
<?php
include 'PHP/ventana_principal/principales/interno/1_a.php';
?>
</div>

<div id="ac_2">
<?php
include 'PHP/ventana_principal/principales/interno/2_a.php';
?>
</div>

<?php
include 'PHP/ventana_principal/principales/unir_fracmento.php';
?>


<script src="JS/principal/ven_usuario.js"></script>