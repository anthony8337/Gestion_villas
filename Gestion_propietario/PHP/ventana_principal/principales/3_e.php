<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/mod_usu.css'>

<div id="modelo_villa" class="mod">

<div class="centro">

<div class="c1">



<button onclick="cerrar_modelos_villa()" type="button">X</button>
<h2>Ingresar nuevo modelo</h2>
</div>

<form id="formulario_modelo_villa">

<div class="c2">

<table>
  

<?php
$campos = ['Grupo de villa',''];
$nombre_id =['txt_modelo_villa','id_modelo_villa'];
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