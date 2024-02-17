//Mostrar cuadro decisivo en insertar
function mostrar_decision_insertar()
{
    document.getElementById('seleccionar_insertar').style.display = 'flex';
}

function cerrar_decision_insertar()
{
    document.getElementById('seleccionar_insertar').style.display = 'none'; 
}

//Mostrar cuadro insertar villa
function mostrar_insertar_villa()
{
    document.getElementById('ingresar_villa').style.display = 'flex';
    document.getElementById('lg_titulo').textContent = 'Insertar villa';
}

function mostrar_editar_villa()
{
    document.getElementById('ingresar_villa').style.display = 'flex';
    document.getElementById('lg_titulo').textContent = 'Modificar villa';
}

function cerrar_insertar_villa()
{
    document.getElementById('ingresar_villa').style.display = 'none';
}

//Mostrar cuadro insertar cliente
function mostrar_insertar_cliente()
{
    document.getElementById('ingresar_cliente').style.display = 'flex';
}

function cerrar_insertar_cliente()
{
    document.getElementById('ingresar_cliente').style.display = 'none'; 
}
//Mostrar cuadro de ejecutar compra
function mostrar_compra()
{
    document.getElementById('venta').style.display = 'flex';
}

function cerrar_compra()
{
    document.getElementById('venta').style.display = 'none'; 
}

//Mostrar cuadro de ejecutar renta
function mostrar_renta()
{
    document.getElementById('renta').style.display = 'flex';
}

function cerrar_renta()
{
    document.getElementById('renta').style.display = 'none'; 
}

//Mostrar cuadro de ejecutar renta
function mostrar_caracteristica()
{
    document.getElementById('caracteristica').style.display = 'flex';
}

function cerrar_caracteristica()
{
    document.getElementById('caracteristica').style.display = 'none'; 
}

//Mostrar cuadro de ejecutar insertar
function mostrar_insertar_carac()
{
    document.getElementById('carac_nuevo').style.display = 'flex';
}

function cerrar_insertar_carac()
{
    document.getElementById('carac_nuevo').style.display = 'none'; 
}


//Mostrar confirmacion
function confirmacion_carac()
{
    var resultado = window.confirm("La caracteristica fue agregada exitosamente.\n¿deseas continuar agregando?");

if (resultado) {
    document.getElementById('a_caracter').value = "";
} else {
    document.getElementById('a_caracter').value = "";
    document.getElementById('carac_nuevo').style.display = 'none'; 
}
}

//Mostrar cuadro de editar
function selec_editar()
{
    document.getElementById('seleccionar_editar').style.display = 'flex';
}

function cerrar_selec_editar()
{
    document.getElementById('seleccionar_editar').style.display = 'none'; 
}

//Mostrar cuadro para seleccionar el cliente a editar
function selec_cliente_editar()
{
    document.getElementById('seleccionar_editar_C').style.display = 'flex';
}

function cerrar_selec_cliente_editar()
{
    document.getElementById('seleccionar_editar_C').style.display = 'none'; 
}

//Mostrar cuadro de editar cliente
function edicion_cliente()
{
    document.getElementById('Editar_cliente').style.display = 'flex';
}

function cerrar_edicion_cliente()
{
    document.getElementById('Editar_cliente').style.display = 'none'; 
}

//Mostrar cuadro de mosificar estadia
function edicion_Estadia()
{
    document.getElementById('ejecutar_estadia').style.display = 'flex';
}

function cerrar_edicion_Estadia()
{
    document.getElementById('ejecutar_estadia').style.display = 'none'; 
}

//Mostrar cuadro de mosificar estadia
function edicion_selec_villa()
{
    document.getElementById('Selec_villa').style.display = 'flex';
}

function cerrar_selec_edicion_villa()
{
    document.getElementById('Selec_villa').style.display = 'none';
}

//Mostrar cuadro de mosificar estadia
function edicion_villa()
{
    document.getElementById('modificar_villa').style.display = 'flex';
}

function cerrar_edicion_villa()
{
    document.getElementById('modificar_villa').style.display = 'none'; 
}

//Mostrar cuadro de suspencion
function seleccionar_suspender()
{
    document.getElementById('seleccionar_suspender').style.display = 'flex';
}

function cerrar_seleccion_suspender()
{
    document.getElementById('seleccionar_suspender').style.display = 'none'; 
}

//Mostrar lista a eliminar cliente
function seleccionar_suspender_cliente()
{
    document.getElementById('seleccionar_suspender_cliente').style.display = 'flex';
}

function cerrar_suspencion_cliente()
{
    document.getElementById('seleccionar_suspender_cliente').style.display = 'none'; 
}

//Mostrar lista a eliminar
function confirmar_suspender_cliente()
{
    document.getElementById('confi_sus_cliente').style.display = 'flex';
}

function cerrar_confirmar_suspencion_cliente()
{
    document.getElementById('confi_sus_cliente').style.display = 'none'; 
}

//Mostrar lista de villa a eliminar
function seleccionar_suspender_villa()
{
    document.getElementById('Selec_villa_sus').style.display = 'flex';
}

function cerrar_seleccionar_suspender_villa()
{
    document.getElementById('Selec_villa_sus').style.display = 'none'; 
}

//Mostrar confirmar villa
function confirma_eliminar_villa()
{
    document.getElementById('confi_sus_villa').style.display = 'flex';
}

function cerrar_confirma_eliminar_villa()
{
    document.getElementById('confi_sus_villa').style.display = 'none'; 
}

//alertar ejecucion
function suspencion_exitosa_villa()
{
    window.alert("Accion ejecutada con exito"); 
    document.getElementById('confi_sus_villa').style.display = 'none'; 
}

function suspencion_exitosa_cliente()
{
    window.alert("Accion ejecutada con exito");  
    document.getElementById('confi_sus_cliente').style.display = 'none'; 
}