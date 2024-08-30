<div id="login_base_datos_form" class="mod">

<div class="centro centro_emergentes_admin">

<div class="c1">
<h2>Login base de datos</h2>
<button onclick="cerrar_login_bd_confi()" type="button">X</button>

</div>

<form id="login_form_bd">

<div class="c2">

<fieldset>
    <legend>Usuario</legend>
    <input type="text" id="txt_ususario_db" name="txt_ususario_db">
</fieldset>

<fieldset>
    <legend>Contraseña</legend>
    <input type="password" id="txt_clave_db" name="txt_clave_db">
</fieldset>

<fieldset>
    <legend style="visibility: hidden;">Contraseña</legend>
    <button type="button" onclick="acceso()">Entrar</button>
</fieldset>

</div>

<div id="respuesta_bd_login"></div>

</form>

</div>
</div>

<script>

function acceso()
{
    var usuario;
    var clave;

    var txt_usuarios = document.getElementById("txt_ususario_db").value;
    var txt_clave = document.getElementById("txt_clave_db").value;

    usuario = sessionStorage.getItem("usuario_n");
    clave = sessionStorage.getItem("clave");

    if (txt_usuarios == usuario && txt_clave == clave) 
    {
        bd_confi();
        cerrar_login_bd_confi();
    }
    else
    {
        window.alert('Usuario o contraseña invalido.');
    }


}

</script>
