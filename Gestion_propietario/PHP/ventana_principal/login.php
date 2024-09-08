<link rel='stylesheet' type='text/css' media='screen' href='CSS/login.css'>

<body class="login">

<div class="mapa">

<div class="imagen">
<img src="Imagenes/logo_principal.png">
</div>


<div id="ingresar">
<img src="Imagenes/logo_principal.png">
                <h2>Gestión de propietario</h2>

                <form id="entrar_sistema_login">
                <input type="text" name="txt_nom_usuario" id="txt_nom_usuario" placeholder="Nombre de usuario" required>

                <input type="password" name="txt_cla_usuario" id="txt_cla_usuario" placeholder="Contraseña" required>

                <button type="submit" >Entrar</button>
                </form>

                <label onclick="recuperar()">Recuperar usuario y contraseña</label>
               
</div>

<div id="recuperar">

            <img src="Imagenes/logo_principal.png">
                <h2>Gestión de propietario</h2>
                <form id="recupera_cuenta">
                <input type="email" id="txt_email_recupera" name="txt_email_recupera" placeholder="Ingresar correo electronico">
                <button type="submit">Obtener contraseña</button>
                </form>
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

<script>

$(document).ready(function(){
    $('#recupera_cuenta').submit(function(e){
        e.preventDefault();

        var form =$('#recupera_cuenta').serialize();
    $.ajax({
    type: 'POST',
    url : 'PHP/ventana_principal/correo.php',
    data: form,
    success: function(response){
        $('#respuesta_login').html(response);

    }
});
        

    });
});

</script>

</body>
