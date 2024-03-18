<div class="contanedores_configurado">
<h3>Conexión SQL</h3>
<br>


<table>
    <tr>
        <td style="padding-left: 50px; padding-right: 50px;">
        <fieldset>
            <table>
                <tr>
                    <td><input type="radio" name="activo" id="r_desactivar" onchange="deshabilitar()" checked>Desactivar edición</td>
                    <td><input type="radio" name="activo" id="r_activar" onchange="habilitar()">Activar edición</td>
                </tr>
            </table>
        </fieldset>
        </td>
    </tr>
</table>



<br>

<div id="funciones_sql" style="pointer-events: none; opacity: 0.6;">
<table class="conexion">


    <tr>
        <td><label>Nombre del servidor:</label></td>
        <td><input id="txt_servidor" type="text" placeholder="Ej: localhost" ></td>
    </tr>

    <tr>
        <td><label>Usuario:</label></td>
        <td><input type="text" placeholder="Ej: Juan"></td>
    </tr>

    <tr>
        <td><label>Contraseña:</label></td>
        <td><input type="password" placeholder="Ej: admin"></td>
    </tr>
</table>

<br>

<button type="button">Conectar</button>
</div>

</div>

<div class="contanedores_configurado">
<h3>Permisos a usuarios</h3>

<table>
    <tr>
        <td>
            <input type="checkbox" checked> Permitir alteración de datos
        </td>

        <td>
            <input type="checkbox" checked> Permitir eliminación de datos
        </td>
    </tr>
</table>

</div>