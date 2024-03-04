<nav>
    <form action="#" method="post" autocomplete="off">

    <div id="cuadro_seleccion_insertar" class="mod">
    <div class="mod_contenido_editar">
    <span onclick="cerrarcuadro_selec_insertar()" class="cerrar">&times;</span>

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
            <div class="f_boton" onclick="mostrarcuadro_ingreso(),cerrarcuadro_selec_insertar()">
            <img class="im_ico" src="imagenes/cliente.png" width="50px" height="50px">
            <br>
            <label>Insertar Cliente</label>
            </div>
            </td>
            <td>
            <div class="f_boton" onclick="mostrarcuadro_villa(),cerrarcuadro_selec_insertar()">
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
</nav>