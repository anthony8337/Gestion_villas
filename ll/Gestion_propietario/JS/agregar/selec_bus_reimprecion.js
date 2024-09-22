function ultimo_reim()
{
    var selector = document.getElementById('sl_filtro_bus').value;

    if (selector == "ultima")
    {
        document.getElementById("f_pago_reim").style.display = "none";
        document.getElementById("cod_pago_reim").style.display = "none";
    }
    else if (selector == "fecha")
    {
        document.getElementById("f_pago_reim").style.display = "block";
        document.getElementById("cod_pago_reim").style.display = "none";
    }else if (selector == "codigo")
    {
        document.getElementById("f_pago_reim").style.display = "none";
        document.getElementById("cod_pago_reim").style.display = "block";
    }
}
