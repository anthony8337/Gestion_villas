function cambio()
{
    var cuadro_cambio = document.getElementById("sl_pro_gc").value;
    
    if (cuadro_cambio == "Unico") 
    {
    document.getElementById("propi_desde_hasta").style.display = "none";  
    document.getElementById("propi_unico").style.display = "inline-flex";  
    }
    else
    {
        document.getElementById("propi_desde_hasta").style.display = "inline-flex";  
        document.getElementById("propi_unico").style.display = "none";  
    }
}