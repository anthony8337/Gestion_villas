<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="Reimpreso_fecha" class="mod">
    <fieldset class="mod_reimprimir">
    <legend class="titulo">Reimprecion de facturas</legend>
    <span onclick="cerrar_reimpre_fecha()" class="cerrar">&times;</span>
    <br>


    
    <div>
        <button type="button" class="regis_accion" >Imprimir todo</button>
        <button type="button" class="regis_accion" ></button>
        <button type="button" class="regis_accion" >Imprimir</button>
        
    </div>
    <br>
    <fieldset style="width:99%; height:80px; padding: 0px;">
       <table style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 50%; text-align: end;">
                <label>Clave:</label>
                </td>

                <td style="text-align: start;">
                <label style="margin-left: 20px;" id="id_clave_re"></label>
                </td>
            </tr>

            <tr>
            <td style="width: 50%; text-align: end;">
                <label>Nombre:</label>
                </td>

                <td style="text-align: start;">
                <label style="margin-left: 20px;" id="lb_nombre_re"></label>
                </td>
            </tr>
            
        </table>
    </fieldset>

    <div class="tabla_principal" style="width: 99%; height: 350px; overflow: auto; float: left; margin-bottom: 10px;">
    
    <table>
                    <tr>
                    <th>No. Recibo</th>    
                    <th>Clave</th>
                    <th>Nombre</th>
                    <th>Documento</th>
                    <th>Fecha de tramite</th>
                    <th>Pago</th>
                    </tr>
                    
                    <tr>
                    <td>No.Recibo</td>    
                    <td>Clave</td>
                    <td>Nombre</td>
                    <td>Documento</td>
                    <td>Fecha de tramite</td>
                    <td>Pago</td>
                    </tr>

                </table>

    </div>


    </div>

    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>