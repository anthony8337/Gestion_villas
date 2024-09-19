<div id="usuarios_ingreso" class="mod">

<div class="centro usuarios_form ventanas_medianas">

<div class="c1">

<h2 id="usu_titulo">Ingresar nuevo usuario</h2>
<button onclick="cerrar_usuario_in(),limpiar_confirmar()" type="button">X</button>

</div>

<form id="formulario_usuario">

<div class="c2">

<input type="hidden" name="txt_id" id="txt_id">

<input type="hidden" name="txt_estado_usu" id="txt_estado_usu">

<?php

$campos = ['Nombre','Apellido','DNI','Teléfono','Correo','Usuario','Contraseña','Tipo de usuario'];
$nombre_id =['txt_nombre','txt_apellido','txt_dni','txt_tele','txt_correo','txt_usuario','txt_clave','txt_tipo'];
$tipo = ['text','text','text','text','email','text','password','text'];

for ($i=0; $i < count($campos); $i++) 
{ 

    if($i == count($campos)-1)
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
    }
    else
    {
        echo"
        <fieldset>
        <legend>$campos[$i]</legend>
        <input id='$nombre_id[$i]' name='$nombre_id[$i]' type='$tipo[$i]' title='$campos[$i]' placeholder='$campos[$i]' required title='Por favor, llenar este campo'>
        </fieldset>
        ";    
    }


}?>


</div>

<div class="c2">
<fieldset id="fl_permisos">
    <legend>Permisos de acceso</legend>
    <fieldset>
        <legend>Impresión de reportes</legend>
        <input type="checkbox" name="pe_reporte" id="pe_reporte" value="1" checked>
    </fieldset>

    <fieldset>
        <legend>Edición de registros</legend>
        <input type="checkbox" name="pe_registro" id="pe_registro" value="1" checked>
    </fieldset>

    <fieldset>
        <legend>Eliminar registros</legend>
        <input type="checkbox" name="pe_eliminar" id="pe_eliminar" value="1" checked>
    </fieldset>
</fieldset>
</div>


<div class="c3">

<button id="crear_usuario" type="submit">Crear</button>
<button id="modificar_usuario" type="submit">Modificar</button>
<button id="borrar_usuario" type="submit">Suspender</button>
<button id="activar_usuario" type="submit">Activar</button>

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

    $('#borrar_usuario').click(function() {
        accion = 'borrar';
    });

    $('#activar_usuario').click(function() {
        accion = 'activar';
    });

    $('#formulario_usuario').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {

    var decidir = confirm("¿Deseas registrar este registro?");
    if(decidir)
    {
        url = 'PHP/ventana_principal/principales/interno/sql/insertar_usuarios.php';
    }
    else
    {
        url = '';
    }

   
} else if (accion === 'modificar') {

    var decidir = confirm("¿Deseas modificar este registro?");
    if(decidir)
    {
        url = 'PHP/ventana_principal/principales/interno/sql/modificar_usuarios.php';
    }
    else
    {
        url = '';
    }
    

} else if (accion === 'borrar'){
    var decidir = confirm("¿Deseas eliminar este registro?");
    if(decidir)
    {
        url = 'PHP/ventana_principal/principales/interno/sql/eliminar_usuarios.php';
    }
    else
    {
        url = '';
    }

} else if (accion === 'activar'){
    var decidir = confirm("¿Deseas reactivar este registro?");
    if(decidir)
    {
        url = 'PHP/ventana_principal/principales/interno/sql/acitvar_usuarios.php';
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