<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="Reimpreso" class="mod">
    <fieldset class="mod_reimprimir">
    <legend class="titulo">Reimprecion de facturas</legend>
    <span onclick="cerrar_rei()" class="cerrar">&times;</span>
    <br>

    
    <div>
        <button type="button" class="regis_accion" onclick="abrir_reimpre_cliente()">Clientes</button>
        <button type="button" class="regis_accion" >Imprimir</button>
    </div>
    <br>
    <fieldset style="width:50%; height:80px; padding: 0px;">
       <table style="width: 100%; height: 100%;">
            <tr>
                <td style="text-align: end; width: 100px; margin-left: 20px">
                    <label>Clave:</label>
                </td>

                <td>
                <label id="id_clave_re"></label>
                </td>
            </tr>

            <tr>
                <td style="text-align: end; margin-left: 20px;"><label>Nombre:</label></td>
                <td><label id="lb_nombre_re"></label></td>
            </tr>
            
        </table>
    </fieldset>

    <fieldset style="width:30%; height:80px; padding: 0px;">
       <table style="width: 100%; height: 100%;">
            <tr>
                <td style="text-align: end; width: 100px; margin-left: 20px">
                    <label>Fecha de imprecion:</label>
                </td>

                <td>
                <input type="date" name="" id="">
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