//propietario ingreso

function contactos() {
    document.getElementById('agre_contatos').style.display = 'flex';
}

function cerrar_contactos() {
    document.getElementById('agre_contatos').style.display = 'none';
}

function cerrar_ingreso()
{

    document.getElementById('pro').style.display = 'none';
    
}

function ingreso()
{
    document.getElementById('pro').style.display = 'flex';
    document.getElementById('tl_titulo').textContent = 'Ingresar nuevo propietario';

    document.getElementById('limpiar_propietario').style.display = 'block';
    document.getElementById('agregar_propietario').style.display = 'block';
    document.getElementById('eliminar_propietario').style.display = 'none';    
    document.getElementById('modificar_propietario').style.display = 'none';


}


function selecciona_villa_propi()
{
    document.getElementById('selec_villa_propietario').style.display = 'flex';
}

function cerrar_selecciona_villa_propi()
{
    document.getElementById('selec_villa_propietario').style.display = 'none';
}


//Villas ingeso
function cerrar_ingreso_vi()
{
    document.getElementById('vi').style.display = 'none';
}

function ingreso_vi()
{
    document.getElementById('vi').style.display = 'flex';
    document.getElementById('titulo_villa').textContent = 'Ingresar nueva villa';

    document.getElementById('btn_eli_villa').style.display = 'none';
    document.getElementById('btn_modi_villa').style.display = 'none';
    document.getElementById('btn_limpiar_villa').style.display = 'block';
    document.getElementById('btn_agregar_villa').style.display = 'block';

    actualizar_caracteristicas();
}

function ingreso_vi_2()
{

        
    document.getElementById('vi').style.display = 'flex';
    document.getElementById('titulo_villa').textContent = 'Modifícar villa';
    document.getElementById('btn_limpiar_villa').style.display = 'none';
    document.getElementById('btn_agregar_villa').style.display = 'none';


    if (modificar == "si") 
        {
            document.getElementById('btn_modi_villa').style.display = 'block';

        }
        else
        {
            document.getElementById('btn_modi_villa').style.display = 'block';
            document.getElementById('btn_modi_villa').disabled = true;
            document.getElementById('btn_modi_villa').title = "Esta opción no esta disponible.";
        }

    if (eliminar == "si") 
        {
            document.getElementById('btn_eli_villa').style.display = 'block';
        }
        else
        {
            document.getElementById('btn_eli_villa').style.display = 'block';
            document.getElementById('btn_eli_villa').disabled = true;
            document.getElementById('btn_eli_villa').title = "Esta opción no esta disponible.";
        }   


    actualizar_caracteristicas();
}


function ingreso_vi_propi()
{
    document.getElementById('vi').style.display = 'flex';
    document.getElementById('vi').style.zIndex = '10';
}

//Moneda ingeso
function cerrar_ingreso_moneda()
{
    document.getElementById('moneda').style.display = 'none';
}

function ingreso_moneda()
{
    document.getElementById('moneda').style.display = 'flex';
}

//Concepto ingeso
function cerrar_ingreso_concepto()
{
    document.getElementById('con_1').style.display = 'none';
}

function ingreso_concepto()
{
    document.getElementById('con_1').style.display = 'flex';
}

//intercambio villa
function v_cambio_abrir()
{
    document.getElementById('cambio_villa').style.display = 'flex';
}

function v_cambio_cerrar()
{
    document.getElementById('cambio_villa').style.display = 'none';
}

//pro_donante

function abrir_pro_donar()
{
    document.getElementById('pro_donar').style.display = 'flex';
}

function cerrar_pro_donar()
{
    document.getElementById('pro_donar').style.display = 'none';
}

//pro_donante

function abrir_pro_recibir()
{
    document.getElementById('pro_rec').style.display = 'flex';
}

function cerrar_pro_recibir()
{
    document.getElementById('pro_rec').style.display = 'none';
}

//adicionar villa
function abrir_adicionar()
{
    document.getElementById('adicionar_villas').style.display = 'flex';
}

function cerrar_adicionar()
{
    document.getElementById('adicionar_villas').style.display = 'none';
}

//adicionar villa
function abrir_pro_adicionar()
{
    document.getElementById('pro_adi').style.display = 'flex';
}

function cerrar_pro_adicionar()
{
    document.getElementById('pro_adi').style.display = 'none';
}

//adicionar villa tabla
function abrir_pro_adicionar_tabla()
{
    document.getElementById('selec_villa_adi').style.display = 'flex';
}

function cerrar_pro_adicionar_tabla()
{
    document.getElementById('selec_villa_adi').style.display = 'none';
}

//confirma villas

function confi_villa()
{
    document.getElementById('confirma_villa_pro').style.display = 'flex';
    document.getElementById('confirma_villa_pro').style.zIndex = '13'
}

function cerrar_confi_villa()
{
    document.getElementById('confirma_villa_pro').style.display = 'none';
}

//confirmar propietario

function confi_propietario()
{
    document.getElementById('confirma_pro').style.display = 'flex';
}

function cerrar_confi_propietario()
{
    document.getElementById('confirma_pro').style.display = 'none';
}

//confirmar cambio

function confi_cambio()
{
    document.getElementById('confirma_cambio').style.display = 'flex';
}

function cerrar_confi_cambio()
{
    document.getElementById('confirma_cambio').style.display = 'none';
}

//confirmar cambio

function confi_adicion()
{
    document.getElementById('confirma_adicion').style.display = 'flex';
}

function cerrar_confi_adicion()
{
    document.getElementById('confirma_adicion').style.display = 'none';
}


//////Actualizar

function ingreso_actu()
{
    document.getElementById('pro').style.display = 'flex';
    
    document.getElementById('tl_titulo').textContent = 'Modificar propietario';


    document.getElementById('limpiar_propietario').style.display = 'none';
    document.getElementById('agregar_propietario').style.display = 'none';   
   
    if (modificar == "si") 
        {
            document.getElementById('modificar_propietario').style.display = 'block';

        }
        else
        {
            document.getElementById('modificar_propietario').style.display = 'block';
            document.getElementById('modificar_propietario').disabled = true;
            document.getElementById('modificar_propietario').title = "Esta opción no esta disponible.";
        }

    if (eliminar == "si") 
        {
            document.getElementById('eliminar_propietario').style.display = 'block';
        }
        else
        {
            document.getElementById('eliminar_propietario').style.display = 'block';
            document.getElementById('eliminar_propietario').disabled = true;
            document.getElementById('eliminar_propietario').title = "Esta opción no esta disponible.";
        }    
   

}

function villa_lista()
{
    document.getElementById('vi_mostrar').style.display = 'flex';
    tabla_villas_ver();
}

function cerrar_villa_lista()
{
    document.getElementById('vi_mostrar').style.display = 'none';
}

function ingreso_vi_alterar()
{
    document.getElementById('titulo_villa').value = 'Edítar villa';
    actualizar_caracteristicas();
    document.getElementById('btn_eli_villa').style.display = 'block';
    document.getElementById('btn_modi_villa').style.display = 'block';
    document.getElementById('btn_limpiar_villa').style.display = 'none';
    document.getElementById('btn_agregar_villa').style.display = 'none';
}

function ver_descrip_cambio()
{
    document.getElementById('descripcion_cambio').style.display = 'flex';
    actializar_descripcion();
}

function cerrar_ver_descrip_cambio()
{
    document.getElementById('descripcion_cambio').style.display = 'none';
}
//////////////

function ver_descrip_adicion()
{
    document.getElementById('descripcion_adicion').style.display = 'flex';
    actializar_descripcion_adicion();
}

function cerrar_ver_descrip_adicion()
{
    document.getElementById('descripcion_adicion').style.display = 'none';
}