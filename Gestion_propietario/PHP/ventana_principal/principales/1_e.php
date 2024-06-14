<link rel='stylesheet' type='text/css' media='screen' href='CSS/ventana_principal/mod_usu.css'>

<div id="usuarios_ingreso" class="mod">

<div class="centro">

<div class="c1">



<button onclick="cerrar_usuario_in()" type="button">X</button>
<h2>Ingresar nuevo usuario</h2>
</div>

<form id="formulario_usuario">

<div class="c2">

<table>
    <tr>

<?php

$campos = ['Usuario','Nombre Completo','DNI','Teléfono','Correo','Contraseña','Tipo de usuario','Estado',''];
$nombre_id =['txt_usuario','txt_nombre','txt_dni','txt_tele','txt_correo','txt_clave','txt_tipo','txt_estado','txt_id'];
$tipo = ['text','text','text','text','text','password','text','text','text'];




    echo"<tr>";

for ($i=0; $i < count($campos) - 5; $i++) {
    
        echo"
        <td>
        <fieldset>
        <legend>$campos[$i]</legend>
        <input id='$nombre_id[$i]' name='$nombre_id[$i]' type='$tipo[$i]' title='$campos[$i]' placeholder='$campos[$i]' required title='Por favor, llenar este campo'>
        </fieldset>
        </td>
        ";
    }

echo"</tr>";

echo"<tr>";

for ($i=4; $i < count($campos); $i++) { 

    if($i == count($campos)-1)
    {
    echo"
    <td>
    <fieldset class='interno'>
    <legend>$campos[$i]</legend>
    <input id='$nombre_id[$i]' name='$nombre_id[$i]' type='$tipo[$i]' title='$campos[$i]' placeholder='$campos[$i]'>
    </fieldset>
    </td>
    ";
    }else if($i == count($campos)-2)
    {
        echo"
        <td>
        <fieldset id='estado_usuario'>
        <legend>$campos[$i]</legend>
        <select id='$nombre_id[$i]' name='$nombre_id[$i]'>",
        include "PHP/ventana_principal/principales/interno/sql/estado_usuario.php"
        ,"
        </select>
        </fieldset>
        </td>
        ";


        
    }
    else

    if($i == count($campos)-3)
    {
    echo"
    <td>
    <fieldset>
    <legend>$campos[$i]</legend>
    <select id='$nombre_id[$i]' name='$nombre_id[$i]'>",
    include "PHP/ventana_principal/principales/interno/sql/tipo_usuario.php"
    ,"
    </select>
    </fieldset>
    </td>
    ";
    }else{

    echo"
    <td>
    <fieldset>
    <legend>$campos[$i]</legend>
    <input id='$nombre_id[$i]' name='$nombre_id[$i]' type='$tipo[$i]' title='$campos[$i]' placeholder='$campos[$i]'>
    </fieldset>
    </td>
    ";
    }
}
echo"</tr>";
    



?>


</tr>
</table>

</div>


<div class="c3">

<button id="crear_usuario" type="submit">Crear</button>
<button id="modificar_usuario" type="submit">Modificar</button>


</div>
</form>

</div>
</div>



<script>

$(document).ready(function(){

    let accion = '';

    $('#crear_usuario').click(function() {
        accion = 'crear';
    });

    $('#modificar_usuario').click(function() {
        accion = 'modificar';
    });

    $('#formulario_usuario').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/ventana_principal/principales/interno/sql/insertar_usuarios.php';
} else if (accion === 'modificar') {
    url = 'PHP/ventana_principal/principales/interno/sql/modificar_usuarios.php';
}       
        $.ajax({
            type: 'POST',
            url: url,
            data: $(this).serialize(),
            success: function(response){
                $('#lista_usuarios').html(response);

                $.ajax({
            type: 'GET',
            url: 'PHP/ventana_principal/principales/tabla_usuarios.php',
            data: $(this).serialize(),
            success: function(response){
                $('#lista_usuarios').html(response);
            }
        });
            }
        });

    }); 
});
</script>