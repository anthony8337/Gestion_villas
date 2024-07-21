<?php
include "PHP/raiz/entrada.php";
?>



<script>
var usuario;
usuario = sessionStorage.getItem("usuario");
if(usuario == null)
{
    window.location.href = "index.php";
}
</script>

<?php
include "PHP/P_gestiones.php";
?>

<?php
include "PHP/raiz/salida.php";
?>