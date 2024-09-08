function atajo_multipago() 
{
    crear_multipago();
    datos_a_multipago();
    sele_con_multi();
    actualizar_tabla_conce_multi()    
    cerrar_ingreso_celda();
}

function atajo_cuenta() {
    crear_cuenta();
    datos_a_generar_cuenta();
    cerrar_ingreso_celda();
}

function atajo_cuenta_pagar() {
    cuentas_pagar();
    actualizar_cuentas_debe();
    cerrar_ingreso_celda();
}

function atajo_reimprimir() {
    re_factura();
    datos_a_generar_reimprecion();
    cuenta_propi_reim();
    cerrar_ingreso_celda();
}

function atajo_propietario() {
    
    ingreso_actu();
    modificar_propietario();
    actualizar_tabla_villa_pro();
    cerrar_ingreso_celda();
}