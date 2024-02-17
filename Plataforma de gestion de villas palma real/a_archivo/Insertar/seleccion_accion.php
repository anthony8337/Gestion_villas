


<form action="#" method="post" autocomplete="off">
    <div id="seleccionar_insertar" class="mod">
    <div class="mod_contenido_editar">
    <span onclick="cerrar_decision_insertar()" class="cerrar">&times;</span>

    
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
            <div class="f_boton" onclick="mostrar_insertar_cliente(),cerrar_decision_insertar()">
            <img class="im_ico" src="imagenes/cliente.png" width="50px" height="50px">
            <br>
            <label>Insertar Cliente</label>
            </div>
            </td>
            <td>
            <div class="f_boton" onclick="mostrar_insertar_villa(),limpiar_campos(),cerrar_decision_insertar()">
            <img class="im_ico" src="imagenes/casa.png" width="50px" height="50px">
            <br>
            <label>Insertar Villa</label>
    </div>
            </td>
        </tr>
    </table>

</div>
</div>
</form>
