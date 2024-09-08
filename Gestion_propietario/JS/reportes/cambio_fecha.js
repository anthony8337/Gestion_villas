function ocultar_fecha()
{
    var fecha_sl = document.getElementById("ranco_factura").value;

    if (fecha_sl == "Historial completo") {

        document.getElementById("f_desde_sc").style.display = "none";
        document.getElementById("f_hasta_sc").style.display = "none";

    }else if (fecha_sl == "Periodo de fecha") {
        document.getElementById("f_desde_sc").style.display = "block";
        document.getElementById("f_hasta_sc").style.display = "block";
    }
    
}

function ocultar_concep() 
{
    var concep = document.getElementById("todo_cuota").value;

    if (concep == "Historial completo") {

        document.getElementById("indi_concepto").style.display = "none";

    }else if (concep == "Concepto específico") {

        document.getElementById("indi_concepto").style.display = "block";
    }
}