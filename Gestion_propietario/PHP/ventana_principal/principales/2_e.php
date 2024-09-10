<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/mod_usu.css'>

<div id="grupo_villa" class="mod">

<div class="centro centro_emergentes_admin ventanas_pequeñas">

<div class="c1">


<h2 id="titulo_grupo_villa">Ingresar nuevo grupo</h2>
<button onclick="cerrar_grupo_villa(),limpiar_confirmar()" type="button">X</button>

</div>

<form id="formulario_grupo_villa">

<div class="c2">

<input type="hidden" id="id_grupo_villa" name="id_grupo_villa">

<fieldset>
    <legend>Grupo de villa</legend>
    <input type="text" name="txt_grupo_villa" id="txt_grupo_villa" title="Grupo de villa" required>
</fieldset>

</div>


<div class="c3">

<button id="crear_grupo" type="submit">Crear</button>
<button id="modificar_grupo" type="submit">Modificar</button>
<button id="eliminar_grupo" type="submit">Eliminar</button>

</div>
</form>

</div>
</div>

<script>

$(document).ready(function(){

    let accion = '';

    $('#crear_grupo').click(function() {
        accion = 'crear';
    });

    $('#modificar_grupo').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_grupo').click(function() {
        accion = 'eliminar';
    });

    $('#formulario_grupo_villa').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_grupo/insertar_grupo.php';
} else if (accion === 'modificar') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_grupo/modificar_grupo.php';
}   else if(accion === 'eliminar'){

    var decidir = confirm("¿Deseas eliminar este registro?");

    if(decidir)
    {
        url = 'PHP/ventana_principal/principales/interno/sql/accion_grupo/eliminar_grupo.php';
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
                $('#cont_grupo_villa').html(response);

                $.ajax({
            type: 'GET',
            url: 'PHP/ventana_principal/principales/interno/sql/pantalla_2/tabla_grupos_villas.php',
            data: $(this).serialize(),
            success: function(response){
                $('#cont_grupo_villa').html(response);
            }
        });
            }
        });

    }); 
});
</script>