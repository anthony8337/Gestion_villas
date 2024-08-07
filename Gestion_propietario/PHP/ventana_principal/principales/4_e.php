<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_moneda_archivo.css'>

<div id="moneda_registro" class="mod">

<div class="centro centro_emergentes_admin">

<div class="c1">

<h2>Ingresar moneda</h2>
<button onclick="ingreso_moneda_r_cerrar(),limpiar_confirmar()" type="button">X</button>

</div>

<form id="formulario_moneda">
<div class="c2">
<input type="hidden" id="id_moneda" name="id_moneda">
<?php

$m_d= ['txt_m_1','txt_m_2','txt_m_3'];
$m_p= ['Nombre de moneda','Símbolo de moneda','Valor a lempira'];

for ($i=0; $i < count($m_d); $i++) { 
    echo"
    <fieldset>
    <legend>$m_p[$i]</legend>
    <input type='text' id='$m_d[$i]' name='$m_d[$i]' placeholder='$m_p[$i]' title='$m_p[$i]'>
    </fieldset>
    ";
}
?>

</div>

<div class="c3">
<button id='agre_moneda' name='agre_moneda' type='submit' >Agregar</button>
<button id='modi_moneda' name='modi_moneda' type='submit' >Modificar</button>
<button id='eli_moneda' name='eli_moneda' type='submit' >Eliminar</button>
</div>

</form>

<div id="resultado_moneda"></div>

</div>

</div>


<script>

$(document).ready(function(){

    let accion = '';

    $('#agre_moneda').click(function() {
        accion = 'crear';
    });

    $('#modi_moneda').click(function() {
        accion = 'modificar';
    });

    $('#eli_moneda').click(function() {
        accion = 'eliminar';
    });

    $('#formulario_moneda').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_moneda/insertar_moneda.php';
} else if (accion === 'modificar') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_moneda/modificar_moneda.php';
}   else if (accion === 'eliminar') {

    

var confirmar = window.confirm('¿Esta seguro de suspender este registro?');

if (confirmar) {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_moneda/eliminar_moneda.php';   
}
else
{
    url = '';
}
    
}     
        $.ajax({
            type: 'POST',
            url: url,
            data: $(this).serialize(),
            success: function(response){
                $('#interior_moneda').html(response);

                $.ajax({
            type: 'GET',
            url: 'PHP/ventana_principal/principales/interno/sql/accion_moneda/tabla_moneda.php',
            data: $(this).serialize(),
            success: function(response){
                $('#interior_moneda').html(response);
            }
        });
            }
        });

    }); 
});
</script>