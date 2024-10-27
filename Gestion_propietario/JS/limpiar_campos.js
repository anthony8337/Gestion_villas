function limpiar_span()
{
    var camposTexto = document.querySelectorAll('.dato');

    camposTexto.forEach(function(input){
        input.textContent='';
    });
}

function limpieza_text()
{
    var camposTexto = document.querySelectorAll('input[type="text"]');

    camposTexto.forEach(function(input){
        input.value='';
    });
    
}

function limpieza_hidden()
{
    var camposTexto = document.querySelectorAll('input[type="hidden"]');

    camposTexto.forEach(function(input){
        input.value='';
    });
    
}

function limpieza_textarea()
{
    var camposTexto = document.querySelectorAll('textarea');

    camposTexto.forEach(function(input){
        input.value='';
    });
    
}

function limpieza_email()
{
    var camposTexto = document.querySelectorAll('input[type="email"]');
    camposTexto.forEach(function(input){
        input.value='';
    }); 
}

function limpieza_checkbox() 
{
    var camposTexto = document.querySelectorAll('input[type="checkbox"]');
    camposTexto.forEach(function(input){
        input.checked = true;
    }); 
}

function limpieza_select_estado() 
{
    var selectElement = document.querySelector('#rango_cuota');
    selectElement.innerHTML = '';
}

function limpieza_solidos() 
{
document.getElementById('sp_codigo_multi').textContent = '';
document.getElementById('con_pago_multi').textContent = '';
}

function limpieza_clave()
{
    var camposTexto = document.querySelectorAll('input[type="password"]');
    camposTexto.forEach(function(input){
        input.value='';
    }); 
}

function limpiar_tablas()
{
 const campo = document.querySelector('tbody.borrar_t');
while (campo.firstChild) {
    campo.removeChild(campo.firstChild);
 }
}

function limpiar_tablas_carac()
{
 const campo = document.querySelector('#carac_vi tbody.borrar_t');
while (campo.firstChild) {
    campo.removeChild(campo.firstChild);
 }
}

function limpiar_tabla_adicionar() {
    var tbody = document.querySelector("#tabla_villa_adi tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function limpiar_tabla_contacto() {
    var tbody = document.querySelector("#tb_contactos tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function limpiar_tabla_cuentas_reim() {
    var tbody = document.querySelector("#tb_cuentas_reim tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function limpiar_tabla_estado() {
    var tbody = document.querySelector("#td_estados_cuerpo tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

  function limpiar_tablas_villa()
{
    const campo = document.querySelector('#tabla_villa_pro_selec tbody.borrar_t');
while (campo.firstChild) {
    campo.removeChild(campo.firstChild);
 }
}

function limpiar_confirmar()
{
limpieza_text();
limpieza_hidden();
limpieza_email();
limpieza_clave();
limpiar_tablas(); 
limpieza_checkbox();
limpieza_textarea();
limpiar_tabla_adicionar();  
limpiar_tabla_contacto(); 
limpiar_tablas_carac();
limpiar_tabla_cuentas_reim();
limpiar_tabla_estado();
limpiar_span();
limpieza_select_estado();
limpiar_tablas_villa();
limpieza_solidos();
}

function limpiar_opcion()
{

var elegir = confirm("¿Esta seguro de limpiar los datos agregados?");

if(elegir)
{
    limpieza_text();
    limpieza_hidden();
    limpieza_email();
    limpieza_clave();
    limpiar_tablas(); 
    limpieza_checkbox();
    limpieza_textarea();
    limpiar_tabla_adicionar();  
    limpiar_tabla_contacto(); 
    limpiar_tablas_carac();
    limpiar_tabla_cuentas_reim();
    limpiar_tabla_estado();
    limpiar_span();
    limpieza_select_estado();
    limpiar_tablas_villa();
    limpieza_solidos();
}  

}