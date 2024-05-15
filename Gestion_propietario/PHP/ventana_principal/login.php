<link rel='stylesheet' type='text/css' media='screen' href='CSS/login.css'>

<body class="login">

<div class="mapa">

<div class="imagen">
<img src="Imagenes/logo_principal.png">
</div>


<div id="ingresar">
    <table>
        <tr>
            <td>
                <h2>Gestión de propietario</h2>
            </td>
        </tr>

        
        <tr>
            <td>
                
                <input type="text" placeholder="Nombre de usuario" selected>
            </td>
        </tr>

        <tr>
            <td>
                <input type="password" placeholder="Contraseña">
            </td>
        </tr>

        <tr>
            <td>
                <label onclick="recuperar()">Recuperar usuario y contraseña</label>
            </td>
        </tr>

        <tr>
            <td>
                <button onclick="redirigir()">Entrar</button>
            </td>
        </tr>
    </table>
</div>

<div id="recuperar">
    <table>
        <tr>
            <td>
                <h2>Gestión de propietario</h2>
            </td>
        </tr>

        
        <tr>
            <td>
                
                <input type="text" placeholder="Ingresar numero de whatsaap o correo" selected>
            </td>
        </tr>

        <tr>
            <td>
                <label onclick="regresar()">Regresar</label>
            </td>
        </tr>

        <tr>
            <td>
                <button onclick="redirigir()">Obtener contraseña</button>
            </td>
        </tr>
    </table>
</div>

</div>




</body>