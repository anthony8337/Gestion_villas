<link rel='stylesheet' type='text/css' media='screen' href='CSS/pan_confi.css'>

<div class="confi_base_datos" title="Configuración de la base de datos" onclick="login_bd_confi()">
    <img src="Imagenes/gear-fill.svg">
</div>

<h1>Gestión del propietario</h1>

<h2>Bienvenido Usuario</h2>


<div class="menu_ho">

<ul>

<li tittle='Usuario' onclick='cuerpo_usuario()'>
<img src='Imagenes/person-fill(1).svg'>
<span class='titulos_grandes'>Usuario</span>
</li>

<li tittle='Datos de villas' onclick='cuerpo_villa()'>
<img src='Imagenes/houses-fill.svg'>
<span class='titulos_grandes'>Datos de villas</span>
</li>

<li tittle='Datos de conceptos' onclick='cuerpo_concepto()'>
<img src='Imagenes/list-ul.svg'>
<span class='titulos_grandes'>Datos de conceptos</span>
</li>
<!--onclick='cuerpo_reporte()'-->
<li tittle='Reportes' class="dropdown" >
<img src='Imagenes/clipboard2-data.svg'>
<span class='titulos_grandes'>Reportes</span>

            <div id="menu_desple" class="dropdown-content">
            <span onclick="ingreso_lis_pro_sal(),cerrar_menu() ">
                <img src="Imagenes/person-lines-fill(1).svg" >
                Estados de cuentas</span>
                
            <span onclick="ingreso_lis_villa(),cerrar_menu() ">
                <img src="Imagenes/card-text.svg" >
                Reporte de villas</span>
                
            <span onclick="ingreso_lis_pro(),cerrar_menu() ">
                <img src="Imagenes/cash-coin.svg">
                Reporte de saldos</span>
            </div>
</li>

<li tittle='Gestión' onclick='redirigir_sistema()'>
<img src='Imagenes/journal-text.svg'>
<span class='titulos_grandes'>Gestión</span>
</li>

<li tittle='Salir' onclick='redirigir_login()'>
<img src='Imagenes/box-arrow-left.svg'>
<span class='titulos_grandes'>Salir</span>
</li>

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

<?php
include "PHP/reportes/unir_emergentes.php";
?>


<script src="JS/principal/ven_usuario.js"></script>

