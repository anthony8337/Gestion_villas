

function insertar_propi()
{
    var form = document.getElementById("Formulario_pro");

    var villas = parseInt(document.getElementById("pro_villa_cont").value,10);

    if (form.checkValidity()) {

        if(villas > 0)
            {
        var alerta = confirm("Creara un nuevo registro. \n¿Está seguro de que desea continuar?");

    if (alerta) { 

                // Obtener los datos de la primera columna de la tabla
                let table = $('#tabla_villa_pro_selec');
                let data = [];
    
                table.find('tbody tr').each(function() {
                    let firstCellText = $(this).find('td').eq(0).text();
                    data.push(firstCellText);
                });
    
                // Añadir los datos de la tabla al formulario
                let formData = $(this).serializeArray();
                formData.push({ name: 'tabla_villa', value: JSON.stringify(data) });

                var txtnombre = document.getElementById("txtnombre").value;
                var txtid = document.getElementById("txtid").value;
                var txtcorreo = document.getElementById("txtcorreo").value;
                var txtfecha_i = document.getElementById("txtfecha_i").value;
                var txttelefono = document.getElementById("txttelefono").value;
                var obs_propietario = document.getElementById("obs_propietario").value;

                $.ajax({
                    type: 'POST',
                    url: 'PHP/archivo/emergentes/subs/accion_propietario/insertar_propietario.php',
                    data: 
                    {
                        txtnombre:txtnombre,txtid:txtid,txtcorreo:txtcorreo,
                        txtfecha_i,txttelefono,obs_propietario,
                        tabla_villa:JSON.stringify(data),
                    },
                    success: function(response){
                        $('#respuesta_propietario').html(response);
                        actualizar_propietarios();
                        actualizar_propietarios_cuenta();
                        actualizar_propietarios_multipago();
                        actualizar_villas_adicionar();
                        actualizar_villas_propietario(); 
                        actualizar_tabla_villa_pro();

                        
                    }
                });
            }
        }
        else
        {
            window.alert("Por favor, selecciona las villas solicitadas");
        }
        }
        else
        {
            form.reportValidity();
        }

}

function actualizar_propi()
{
    var alerta = confirm("Está a punto de alterar un registro. ¿Está seguro de que desea continuar?");

    if (alerta) {
let table = $('#tabla_villa_pro_selec');
let data = [];

table.find('tbody tr').each(function() {
    let firstCellText = $(this).find('td').eq(0).text();
    let sextaCellText = $(this).find('td').eq(6).text();
    let id_unir_vamos = $(this).find('td').eq(7).text();
    
    // Añadir ambos valores como un objeto al array
    data.push({
        firstCellText: firstCellText,
        sextaCellText: sextaCellText,
        id_unir_vamos:id_unir_vamos
    });
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'tabla_villa', value: JSON.stringify(data) });
                
                var id_propi_1 = document.getElementById("id_propi_1").value;
                var txtnombre = document.getElementById("txtnombre").value;
                var txtid = document.getElementById("txtid").value;
                var txtcorreo = document.getElementById("txtcorreo").value;
                var txtfecha_i = document.getElementById("txtfecha_i").value;
                var txttelefono = document.getElementById("txttelefono").value;
                var obs_propietario = document.getElementById("obs_propietario").value;
                var id_unir = document.getElementById("id_unir_pro1").value;

                $.ajax({
                    type: 'POST',
                    url: 'PHP/archivo/emergentes/subs/accion_propietario/editar_propietario.php',
                    data: 
                    {  id_unir:id_unir,id_propi_1:id_propi_1,
                        txtnombre:txtnombre,txtid:txtid,txtcorreo:txtcorreo,
                        txtfecha_i,txttelefono,obs_propietario,
                        tabla_villa:JSON.stringify(data),
                    },
                    success: function(response){
                        $('#respuesta_propietario').html(response);
                        actualizar_propietarios();
                        actualizar_propietarios_cuenta();
                        actualizar_propietarios_multipago();
                        actualizar_villas_propietario(); 
                        actualizar_villas_adicionar();

                        
                    }
                });
}
}

function eliminar_propi()
{
    var alerta = confirm("Está a punto de eliminar un registro. ¿Está seguro de que desea continuar?");

if (alerta) {
    
    // Obtener los datos de la primera y sexta columna de la tabla
let table = $('#tabla_villa_pro_selec');
let data = [];

table.find('tbody tr').each(function() {
    let firstCellText = $(this).find('td').eq(0).text();
    let sextaCellText = $(this).find('td').eq(6).text();
    let id_unir_vamos = $(this).find('td').eq(7).text();
    
    // Añadir ambos valores como un objeto al array
    data.push({
        firstCellText: firstCellText,
        sextaCellText: sextaCellText,
        id_unir_vamos:id_unir_vamos
    });
});

// Añadir los datos de la tabla al formulario
let formData = $(this).serializeArray();
formData.push({ name: 'tabla_villa', value: JSON.stringify(data) });
                
                var id_propi_1 = document.getElementById("id_propi_1").value;
                var txtnombre = document.getElementById("txtnombre").value;
                var txtid = document.getElementById("txtid").value;
                var txtcorreo = document.getElementById("txtcorreo").value;
                var txtfecha_i = document.getElementById("txtfecha_i").value;
                var txttelefono = document.getElementById("txttelefono").value;
                var obs_propietario = document.getElementById("obs_propietario").value;
                var id_unir = document.getElementById("id_unir_pro1").value;

                $.ajax({
                    type: 'POST',
                    url: 'PHP/archivo/emergentes/subs/accion_propietario/eliminar_propietario.php',
                    data: 
                    {  id_unir:id_unir,id_propi_1:id_propi_1,
                        txtnombre:txtnombre,txtid:txtid,txtcorreo:txtcorreo,
                        txtfecha_i,txttelefono,obs_propietario,
                        tabla_villa:JSON.stringify(data),
                    },
                    success: function(response){
                        $('#respuesta_propietario').html(response);
                        actualizar_propietarios();
                        actualizar_propietarios_cuenta();
                        actualizar_propietarios_multipago();
                        actualizar_villas_propietario(); 
                        actualizar_villas_adicionar();

                        
                    }
                });
}
}