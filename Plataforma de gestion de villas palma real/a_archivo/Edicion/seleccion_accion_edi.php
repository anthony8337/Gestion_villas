


<form action="#" method="post" autocomplete="off">
    <div id="seleccionar_editar" class="mod">
    <div class="mod_contenido_editar">
    <span onclick="cerrar_selec_editar()" class="cerrar">&times;</span>

    
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
            <div class="f_boton" onclick="selec_cliente_editar(),cerrar_selec_editar()">
            <img class="im_ico" src="imagenes/cliente.png" width="50px" height="50px">
            <br>
            <label>Editar Cliente</label>
            </div>
            </td>
            <td>
            <div class="f_boton" onclick="edicion_selec_villa(),cerrar_selec_editar()">
            <img class="im_ico" src="imagenes/casa.png" width="50px" height="50px">
            <br>
            <label>Editar Villa</label>
    </div>
            </td>
        </tr>
    </table>

</div>
</div>
</form>
