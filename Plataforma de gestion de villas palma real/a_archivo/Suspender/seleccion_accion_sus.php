


<form action="#" method="post" autocomplete="off">
    <div id="seleccionar_suspender" class="mod">
    <div class="mod_contenido_editar">
    <span onclick="cerrar_seleccion_suspender()" class="cerrar">&times;</span>

    
    <style>
        .botones_tb td
        {
            width: 150px; 
            height: 150px;
            text-align: center;
            border: 0;
        }

        .botones_tb
        {
            margin-top: 18%;
        }
    </style>

    <table class="botones_tb">
        <tr>
            <td>
            <div class="f_boton" onclick="seleccionar_suspender_cliente(),cerrar_seleccion_suspender()">
            <img class="im_ico" src="imagenes/cliente.png" width="50px" height="50px">
            <br>
            <label>Suspender Cliente</label>
            </div>
            </td>
            <td>
            <div class="f_boton" onclick="seleccionar_suspender_villa(),cerrar_seleccion_suspender()">
            <img class="im_ico" src="imagenes/casa.png" width="50px" height="50px">
            <br>
            <label>Suspender Villa</label>
    </div>
            </td>
        </tr>
    </table>

</div>
</div>
</form>
