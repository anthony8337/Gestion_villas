<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="Reimpreso" class="mod">
    <fieldset class="mod_reimprimir">
    <legend class="titulo">Reimprecion de facturas</legend>
    <span onclick="cerrar_rei()" class="cerrar">&times;</span>
    <br>

    
    <div>
        <button type="button" class="regis_accion" onclick="abrir_reimpre_cliente()">Clientes</button>
        <fieldset style="height: 80px; width: 50%; padding: 0px; float: left;">
        <table style="height: 100%;">
            <tr>
                <td>
                <input type="radio" name="estilo de imprecion" id="rb_historia" onclick="no_mostrar()" checked>
                <label>imprimir todo el historial</label>
                </td>
                
                <td>
                <input type="radio" name="estilo de imprecion" id="rb_ultimo" onclick="no_mostrar()">
                <label>imprimir ultimo movimiento</label>
                </td>

                <td>
                <input type="radio" name="estilo de imprecion" id="rb_es_fecha" onclick="mostrar()">
                <label>Especificar fecha</label>
                </td>
            </tr>
        </table>
        </fieldset>

        <fieldset id="fiel_desde_hasta" style="height: 80px; width: 36%; padding: 0px; float: left;" disabled>
        <table style="height: 100%;">
            <tr>
                <td>
                <label>Desde:</label>
                </td>
                
                <td>
                <input type="date" style="width: 80%;">
                </td>

                <td>
                <label>Hasta:</label>
                </td>
                
                <td>
                <input type="date" style="width: 80%;">
                </td>
            </tr>
        </table>
        </fieldset>

        <button type="button" class="regis_accion" onclick="abrir_reimpre_fecha()">Imprimir</button>
    </div>
    <br>
    <fieldset style="width:68%; height:80px; padding: 0px;">
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

    <fieldset style="width:30%; height:80px; padding: 0px;">
       <table style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 50%;">
                <label>Saldo actual</label>
                </td>
            </tr>

            <tr>
                <td>
                <label id="lb_saldo_re"></label>
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




<script>

function mostrar()
{
    document.getElementById("fiel_desde_hasta").disabled = false;
}

function no_mostrar()
{
    document.getElementById("fiel_desde_hasta").disabled = true;
}


</script>