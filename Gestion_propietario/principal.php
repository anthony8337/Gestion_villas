<?php
include "PHP/raiz/entrada.php";
?>



<script>
var usuario;
var reporte,modificar,eliminar;

usuario = sessionStorage.getItem("usuario");
reporte = sessionStorage.getItem("reporte");
modificar =sessionStorage.getItem("modificar");
eliminar =sessionStorage.getItem("eliminar");


if(usuario == null)
{
    window.location.href = "index.php";
}
</script>

<?php
include "PHP/P_gestiones.php";
?>

<script>
if(usuario != null)
{
    document.getElementById('li_3').style.display = "none";
}

if (reporte == "si") 
{

}
else
{
    document.getElementById("li_2").style.display = "none";
}

setTimeout(function () {
window.history.forward();
}, 0);

window.onunload = function () {
    null;
};
</script>



<?php
include "PHP/raiz/salida.php";
?>