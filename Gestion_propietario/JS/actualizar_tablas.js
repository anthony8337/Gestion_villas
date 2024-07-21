function actualizar_villas_propietario() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/archivo/emergentes/subs/accion_propietario/tabla_propietario_villa.php',
        data: $(this).serialize(),
        success: function(response){
            $('#villa_propi_selec').html(response);
        }
    });   
}

function actualizar_villas_adicionar() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/archivo/emergentes/subs/adicion/tabla_villa_adi.php',
        data: $(this).serialize(),
        success: function(response){
            $('#villa_propi_selec_adi').html(response);
        }
    });   
}

function actualizar_propietarios() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/tablas/mostar_propietarios.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tbody_propietarios').html(response);
        }
    });   
}

function actualizar_propietarios_cuenta() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_propietarios.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_gc').html(response);
        }
    });   
}

function actualizar_propietarios_multipago() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_propietarios_multi.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_multi').html(response);
        }
    });   
}