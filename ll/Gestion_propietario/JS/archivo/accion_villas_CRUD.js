function vacio_insertar_villa() 
{

    var form = document.getElementById("Formulario_villa");

    if (form.checkValidity()) {
        
        var a = confirm("Creara una nueva villa. \n¿Desea continuar con la operación?");

        if (a) {

        }
    }

}



function insertar_villa_1()
{

    var form = document.getElementById("Formulario_villa");

    if (form.checkValidity()) {
        
        var a = confirm("Creara una nueva villa. \n¿Desea continuar con la operación?");

        if (a) {
    let table = $('#carac_vi');
let data = [];

table.find('tbody tr').each(function() {
    let firstCellText = $(this).find('td').eq(1).text();
    
    // Añadir ambos valores como un objeto al array
    data.push({
        celda_1: firstCellText,
    });
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'tabla_caracteristica', value: JSON.stringify(data) });

    var txt_cod_villa = document.getElementById("txt_cod_villa").value;
    var txt_eeh_villa = document.getElementById("txt_eeh_villa").value;
    var txt_cuarto_vi = document.getElementById("txt_cuarto_vi").value;
    var txt_construc_vi = document.getElementById("txt_construc_vi").value;
    var txa_direccion = document.getElementById("txa_direccion").value;
    var txa_observa_villa = document.getElementById("txa_observa_villa").value;
    var selectElement = document.getElementById("cb_modelo");
    var tex_selec = selectElement.options[selectElement.selectedIndex].text;
    var selectElement2 = document.getElementById("cb_grupo");
    var tex_selec2 = selectElement2.options[selectElement2.selectedIndex].text;

    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/accion_villas/agregar_villas.php',
        data:{ 

            txt_cod_villa:txt_cod_villa,
            txt_eeh_villa:txt_eeh_villa,
            txt_cuarto_vi:txt_cuarto_vi,
            txt_construc_vi:txt_construc_vi,
            txa_direccion:txa_direccion,
            txa_observa_villa:txa_observa_villa,
            tex_selec:tex_selec,
            tex_selec2:tex_selec2,
            tabla_caracteristica:JSON.stringify(data),
        },
        success: function(response){
            $('#respuesta_villa_prin').html(response);
            actualizar_villas_propietario(); 
            actualizar_villas_adicionar();
        }

    });
}

}else
{
    form.reportValidity();
}
}

function actualizar_villa_1()
{
    var form = document.getElementById("Formulario_villa");

    if (form.checkValidity()) {
        
        var alerta = confirm("Está a punto de alterar un registro. ¿Está seguro de que desea continuar?");

    if (alerta) {    
    
    let table = $('#carac_vi');
let data = [];

table.find('tbody tr').each(function() {
    let id_lado = $(this).find('td').eq(0).text();
    let firstCellText = $(this).find('td').eq(1).text();
    
    // Añadir ambos valores como un objeto al array
    data.push({
        celda_0: id_lado,
        celda_1: firstCellText,
    });
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'tabla_caracteristica', value: JSON.stringify(data) });

    var id_villa_super = document.getElementById("id_villa_super").value;
    var txt_cod_villa = document.getElementById("txt_cod_villa").value;
    var txt_eeh_villa = document.getElementById("txt_eeh_villa").value;
    var txt_cuarto_vi = document.getElementById("txt_cuarto_vi").value;
    var txt_construc_vi = document.getElementById("txt_construc_vi").value;
    var txa_direccion = document.getElementById("txa_direccion").value;
    var txa_observa_villa = document.getElementById("txa_observa_villa").value;
    var selectElement = document.getElementById("cb_modelo");
    var tex_selec = selectElement.options[selectElement.selectedIndex].text;
    var selectElement2 = document.getElementById("cb_grupo");
    var tex_selec2 = selectElement2.options[selectElement2.selectedIndex].text;

    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/accion_villas/editar_villas.php',
        data:{ 
            id_villa_super:id_villa_super,
            txt_cod_villa:txt_cod_villa,
            txt_eeh_villa:txt_eeh_villa,
            txt_cuarto_vi:txt_cuarto_vi,
            txt_construc_vi:txt_construc_vi,
            txa_direccion:txa_direccion,
            txa_observa_villa:txa_observa_villa,
            tex_selec:tex_selec,
            tex_selec2:tex_selec2,
            tabla_caracteristica:JSON.stringify(data),
        },
        success: function(response){
            $('#respuesta_villa_prin').html(response);
        }

    });
}
}
else
{
    form.reportValidity();
}
}

function eliminar_propi_1()
{
    var alerta = confirm("Está a punto de eliminar un registro. ¿Está seguro de que desea continuar?");

if (alerta) {
    var id_villa_super = document.getElementById("id_villa_super").value;
    

                $.ajax({
                    type: 'POST',
                    url: 'PHP/archivo/emergentes/subs/accion_villas/eliminar_villas.php',
                    data: 
                    {  
                        id_villa_super:id_villa_super,
                    },
                    success: function(response){
                        $('#respuesta_propietario').html(response);
                        actualizar_propietarios();
                        actualizar_propietarios_cuenta();
                        actualizar_propietarios_multipago();
                        actualizar_villas_propietario(); 
                        actualizar_villas_adicionar();
                        cerrar_ingreso_vi();
                        limpiar_confirmar();

                        
                    }
                });
}
}