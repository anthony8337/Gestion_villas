
<div id="agre_perfil" class="mod">
<fieldset class="mod_agre_usuaro">
<legend class="titulo">Insertar nuevo usuario</legend>
<span onclick="insertar_usuario_cerrar()" class="cerrar">&times;</span>

<br>
<table class="alinear_titulo" >
    
    <tr>

    <td><label for="nombre">Nombre completo:</label></td>
    <td><input type="text" style="width: 80%;"></td>
    <td><label for="nombre">Usuario:</label></td>
    <td><input type="text" style="width: 80%;"></td>
            

             </tr>

            <tr>
                <td><label for="edad">DNI:</label></td>
                <td ><input type="number" style="width: 80%;"></td>

                <td><label for="correo">Correo electrónico:</label></td>
                <td><input type="text" style="width: 80%;"></td>
            </tr>



            <tr>
                <td><label for="acceso">Tipo de Acceso:</label></td>
                <td>
                    <select style="width: 80%;">
                    <option>Usuario</option>
                    <option>Tecnico</option>
                    </select>
                </td>

                <td><label for="acceso">Contraseña:</label></td>
                <td><input type="text" style="width: 80%;"></td>
            </tr>
        </table>

        <br>

        <button type="button" onclick="insertar_usuario_cerrar()">Insertar nuevo</button>

</fieldset>
</div>