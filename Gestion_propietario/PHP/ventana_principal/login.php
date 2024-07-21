<link rel='stylesheet' type='text/css' media='screen' href='CSS/login.css'>

<body class="login">

<script>
window.history.pushState({ noBackExits: true }, "");
window.addEventListener("popstate", function(event) {
    if (event.state && event.state.noBackExits) {
        window.location.href = "index.php";
        window.history.pushState({ noBackExits: true }, "");
    }
});
</script>


<div class="mapa">

<div class="imagen">
<img src="Imagenes/logo_principal.png">
</div>


<div id="ingresar">
<img src="Imagenes/logo_principal.png">
                <h2>Gestión de propietario</h2>

                <form id="entrar_sistema_login">
                <input type="text" name="txt_usuario_l" id="txt_usuario_l" placeholder="Nombre de usuario" required>

                <input type="password" name="txt_clave_l" id="txt_clave_l" placeholder="Contraseña" required>

                <button type="submit" >Entrar</button>
                </form>

                <label onclick="recuperar()">Recuperar usuario y contraseña</label>
               
</div>

<div id="recuperar">

            <img src="Imagenes/logo_principal.png">
                <h2>Gestión de propietario</h2>
                
                <input type="text" placeholder="Ingresar numero de whatsapp o correo">
                <button onclick="">Obtener contraseña</button>
                <label onclick="regresar()">Regresar</label>
                
</div>

</div>

<div id="respuesta_login"></div>


<script>

$(document).ready(function(){
    $('#entrar_sistema_login').submit(function(e){
        e.preventDefault();

        var form =$('#entrar_sistema_login').serialize();
    $.ajax({
    type: 'POST',
    url : 'PHP/ventana_principal/principales/interno/sql/entrar_sistema.php',
    data: form,
    success: function(response){
        $('#respuesta_login').html(response);

    }
});
        

    });
});

</script>

</body>
