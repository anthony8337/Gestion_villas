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

<?php
include "PHP/raiz/salida.php";
?>