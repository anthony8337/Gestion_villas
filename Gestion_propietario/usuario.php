<?php
include "PHP/raiz/entrada.php";
?>

<script>
var admin;
admin = sessionStorage.getItem("admin");

if(admin == null)
{
    window.location.href = "index.php";
}

</script>

<?php
include "PHP/ventana_principal/principales/usuarios_principal.php";
?>

<script>
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