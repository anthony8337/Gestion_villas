<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="G_cuenta" class="mod">
    <fieldset class="g_cuenta">
    <legend class="titulo">Generacion de cuentas por cobrar</legend>
    <span onclick="cerrar_ges()" class="cerrar">&times;</span>
    <br>
        <fieldset style="width:95%; height: 80px; ">
        <legend>Clientes</legend>

        <table>
            <tr>
                <td> 
                <label>Desde</label>
                <br>
                <input type="text">
                </td>

                <td> 
                <label>Hasta</label>
                <br>
                <input type="text">
                </td>
            </tr>
        </table>

    </fieldset>

    <fieldset style="width:95%; height: 80px; ">
        <legend>Fecha</legend>

        <table>
            <tr>
                <td> 
                <label>Desde</label>
                <br>
                <input type="date">
                </td>

                <td> 
                <label>Hasta</label>
                <br>
                <input type="date">
                </td>
            </tr>
        </table>

    </fieldset>

    <fieldset style="width:50%; height: 80px; ">
        <legend>Concepto</legend>

        <table>
            <tr>
                <td> 
                <input type="text" disabled>
                </td>

                <td> 
                    <button type="button" style="width: 100px; height: 50px; padding: 0px;">Buscar concepto</button>
                </td>
            </tr>
        </table>

    </fieldset>

    

    <div style="text-align: center;">
    <button type="button" style="margin-top: 20px;" onclick="abrir_gestion_resultado()"> Buscar</button>
    </div>
    

    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>