<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/mod_usu.css'>

<div id="modelo_villa" class="mod">

<div class="centro centro_emergentes_admin ventanas_pequeñas">

<div class="c1">

<h2>Ingresar nuevo modelo</h2>
<button onclick="cerrar_modelos_villa(),limpiar_confirmar()" type="button">X</button>

</div>

<form id="formulario_modelo_villa">

<div class="c2">

<input type="hidden" name="id_modelo_villa" id="id_modelo_villa">

<fieldset>
    <legend>Grupo de villa</legend>
    <input type="text" id="txt_modelo_villa" name="txt_modelo_villa" title="Grupo de villa">
</fieldset>

</div>


<div class="c3">

<button id="crear_modelo" type="submit">Crear</button>
<button id="modificar_modelo" type="submit">Modificar</button>
<button id="eliminar_modelo" type="submit">Eliminar</button>


</div>
</form>

</div>
</div>

<script>

$(document).ready(function(){

    let accion = '';

    $('#crear_modelo').click(function() {
        accion = 'crear';
    });

    $('#modificar_modelo').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_modelo').click(function() {
        accion = 'eliminar';
    });

    $('#formulario_modelo_villa').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_modelo/insertar_modelo.php';
} else if (accion === 'modificar') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_modelo/modificar_modelo.php';
}   else if(accion === 'eliminar'){

    var decidir = confirm("¿Deseas eliminar este registro?");

    if(decidir)
    {
        url = 'PHP/ventana_principal/principales/interno/sql/accion_modelo/eliminar_modelo.php';
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
                $('#cont_modelo_villa').html(response);

                $.ajax({
            type: 'GET',
            url: 'PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_modelo_villas.php',
            data: $(this).serialize(),
            success: function(response){
                $('#cont_modelo_villa').html(response);
            }
        });
            }
        });

    }); 
});
</script>