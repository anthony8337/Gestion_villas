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
                    <fieldset>
                        <legend>Nombre de usuario</legend>
                        <input type="text" name="txt_nom_usuario" id="txt_nom_usuario" placeholder="Nombre de usuario" required>
                    </fieldset>
                
                <fieldset>
                <legend>Contraseña</legend>
                <input type="password" name="txt_cla_usuario" id="txt_cla_usuario" placeholder="Contraseña" required>
                </fieldset>

                <button type="submit" >Entrar</button>
                </form>

                <label onclick="recuperar()">¿Olvidaste tu contraseña?</label>

                <label onclick="cambiar_contraseña()">Cambiar contraseña</label>
               
</div>

<div id="recuperar">

            <img src="Imagenes/logo_principal.png">
                <h2>Gestión de propietario</h2>
                <form id="recupera_cuenta">
                <fieldset>
                    <legend>Ingresar correo electronico</legend>
                    <input required type="email" id="txt_email_recupera" name="txt_email_recupera" placeholder="Ingresar correo electronico">
                </fieldset>
                
                <button type="submit">Obtener contraseña</button>
                </form>

                <form id="cambiar_contra">
                <fieldset>
                <legend>Ingresar correo electronico</legend>
                <input required type="email" id="txt_email_cambiar" name="txt_email_cambiar" placeholder="Ingresar correo electronico">
                </fieldset>
                <button type="submit">Obtener clave temporal</button>
                
                </form>

                <form id="comprobar_cambio">
                <fieldset>
                <legend>Ingresar código de verificación</legend>
                <input required type="text" maxlength="6" id="txt_comprobante" name="txt_comprobante" placeholder="Ingresar código temporal">
                </fieldset>
                <button type="button" onclick="para_cambio()">Verificar</button>
                
                </form>

                <form id="confir_contra">

                
<input type="hidden" id="v_cla_tem" name="v_cla_tem">
<input type="hidden" id="id_usu_login" name="id_usu_login">
<input type="hidden" id="contra_antigua" name="contra_antigua">

                <fieldset>
                    <legend>Contraseña anterior</legend>
                <input required type="password" id="txt_contra_anterior" name="txt_contra_anterior" placeholder="Ingresar contraseña anterior">
                </fieldset>

                <fieldset>
                    <legend>Contraseña nueva</legend>
                <input required type="password" id="txt_contra_nueva" name="txt_contra_nueva" placeholder="Ingresar nueva contraseña">
                </fieldset>

                <fieldset>
                    <legend>Comprobar contraseña nueva</legend>
                <input required type="password" id="txt_contra_nueva_anterior" name="txt_contra_nueva_anterior" placeholder="Comprobar nueva contraseña">
                </fieldset>

                <button type="submit">Confirmar cambio</button>
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

<script>

$(document).ready(function(){
    $('#cambiar_contra').submit(function(e){
        e.preventDefault();

        var form =$('#cambiar_contra').serialize();
    $.ajax({
    type: 'POST',
    url : 'PHP/ventana_principal/cod_verificar.php',
    data: form,
    success: function(response){
        $('#respuesta_login').html(response);

    }
});
        

    });
});

</script>

<script>

function para_cambio() 
{

 var a = document.getElementById('v_cla_tem').value;
 var b = document.getElementById('txt_comprobante').value;

if (a == b) 
{
    cambiar_confirmar();    
}else
{
    window.alert('Contraseña temporal no valida');
    regresar();
    limpiar_confirmar();
}

}

</script>

<script>

$(document).ready(function(){
    $('#confir_contra').submit(function(e){
        e.preventDefault();

        var form =$('#confir_contra').serialize();
    $.ajax({
    type: 'POST',
    url : 'PHP/ventana_principal/cod_cambio.php',
    data: form,
    success: function(response){
        $('#respuesta_login').html(response);

    }
});
        

    });
});

</script>

</body>
