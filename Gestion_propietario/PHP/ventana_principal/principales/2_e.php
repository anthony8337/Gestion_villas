<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/mod_usu.css'>

<div id="grupo_villa" class="mod">

<div class="centro">

<div class="c1">


<h2>Ingresar nuevo grupo</h2>
<button onclick="cerrar_grupo_villa()" type="button">X</button>

</div>

<form id="formulario_grupo_villa">

<div class="c2">

<table>
  

<?php
$campos = ['Grupo de villa',''];
$nombre_id =['txt_grupo_villa','id_grupo_villa'];
$tipo = ['text','text'];
echo"<tr>";
for ($i=0; $i < count($campos); $i++) {

    if($i == 1)
    {
        echo"
        <td class = 'interno'>
        <fieldset>
        <legend>$campos[$i]</legend>
        <input id='$nombre_id[$i]' name='$nombre_id[$i]' type='$tipo[$i]' title='$campos[$i]'>
        </fieldset>
        </td>
        ";
    }else
    {
       echo"
        <td>
        <fieldset>
        <legend>$campos[$i]</legend>
        <input id='$nombre_id[$i]' name='$nombre_id[$i]' type='$tipo[$i]' title='$campos[$i]' placeholder='$campos[$i]' required title='Por favor, llenar este campo'>
        </fieldset>
        </td>
        ";
    }
}
echo"</tr>";
?>
</table>

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