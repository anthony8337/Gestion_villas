<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_moneda_archivo.css'>

<div id="moneda_registro" class="mod">

<div class="centro centro_emergentes_admin">

<div class="c1">

<h2>Ingresar moneda</h2>
<button onclick="ingreso_moneda_r_cerrar()" type="button">X</button>

</div>

<form id="formulario_moneda">
<div class="c2">
<input type="hidden" id="id_moneda" name="id_moneda">
<?php

$m_d= ['txt_m_1','txt_m_2','txt_m_3'];
$m_p= ['Nombre de moneda','Simbolo de moneda','Valor a lempira'];

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
<?php

$m_d= ['txt_m_1','txt_m_2','txt_m_3'];
$m_p= ['Nombre de moneda','Simbolo de moneda','Valor a lempira'];

for ($i=0; $i < count($m_d); $i++) { 
    echo"
    <button id='agre_moneda' name='agre_moneda' type='submit' >Agregar</button>
    ";
}
?>
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

    $('#modificar_concepto').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_concepto').click(function() {
        accion = 'eliminar';
    });

    $('#formulario_moneda').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_moneda/insertar_moneda.php';
} else if (accion === 'modificar') {
    url = 'PHP/ventana_principal/principales/interno/sql/modificar_conceptos.php';
}   else if (accion === 'eliminar') {
    url = 'PHP/ventana_principal/principales/interno/sql/modificar_conceptos.php';
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