<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="Reimpreso" class="mod">
    <fieldset class="mod_reimprimir">
    <legend class="titulo">Reimprecion de facturas</legend>
    <span onclick="cerrar_rei()" class="cerrar">&times;</span>
    <br>

    
    <div>
        <button type="button" class="regis_accion" >Clientes</button>
        <button type="button" class="regis_accion" >Fechas</button>
        <button type="button" class="regis_accion" >Imprimir</button>
    </div>
    <br>
    <fieldset style="width:67%; height:80px;">
        <legend>Cliente</legend>


        <table style="margin-top: -5px;">
            <tr>
                <td style="text-align: end; width: 50px;">
                    <label>Clave:</label>
                </td>

                <td>
                <label>A-1</label>
                </td>
            </tr>

            <tr>
                <td style="text-align: end;"><label>Nombre:</label></td>
                <td><label>Anthony Clemente Oliva Murillo</label></td>
            </tr>
            <tr>
                <td style="text-align: end;"><label>Documento:</label></td>
                <td><label></label></td>
            </tr>
            
        </table>
    </fieldset>

    <fieldset class="peque_fecha" style="float: inline-end; margin-right: 6px;">
        <legend>Documento</legend>

        <table style="width: 100%; height: 100%;">
            <tr>
                <td>
                <input type="date" style="width: 180px;">
                </td>
            </tr>
        </table>
    </fieldset>

    <div class="tabla_principal" style="width: 99%; height: 230px; overflow: auto; float: left; margin-bottom: 10px;">
    
    <table>
                    <tr>
                    <th>No.Recibo</th>    
                    <th>Clave</th>
                    <th>Nombre</th>    
                    <th>Fecha</th>
                    <th>Total</th>   
                    </tr>
                    
                    <tr>
                    <td>A1234</td>    
                    <td>A-2</td>
                    <td>Anthony Clemente Oliva Murillo</td>    
                    <td>12-05-2024</td>
                    <td>$400</td> 
                    </tr>

                </table>

    </div>


    </div>

    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>