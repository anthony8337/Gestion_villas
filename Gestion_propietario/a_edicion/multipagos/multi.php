<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="multipa" class="mod">
    <fieldset class="mod_moviliario">
    <legend class="titulo">Recepcion de pagos multiples</legend>
    <span onclick="cerrar_concepto()" class="cerrar">&times;</span>
    <br>

    <div style=" height: 48px;">
        <button type="button" class="botones_multipagos">Cliente</button>
        <button type="button" class="botones_multipagos">G. cuentas</button>
        <button type="button" class="botones_multipagos">Selección</button>
        <button type="button" class="botones_multipagos">Limpiar</button>
        <button type="button" class="botones_multipagos">Observacion</button>
        <button type="button" class="botones_multipagos">Guardar</button>


        <fieldset class="peque_fecha">

            <legend>Saldo</legend>
            <table>
                <tr>
                    <td>
                    <label style="font-weight: bold;">$16,000.00</label>
                    </td>
                </tr>
            </table>
            
        </fieldset>


    </div>

    <div style=" height: 110px; margin-top: 10px;">

        <fieldset style="width:79%; height: 80px; text-align: center;">
        <legend>Cliente: A-1</legend>
        <table class="tabla_movi" style="height: 100%;">
            <tr>
                <td><label>Nombre:</label></td>
                <td><label>Anthony Clemente Oliva Murillo</label></td>
            </tr>
            <tr>
                <td><label>Numero:</label></td>
                <td><label>94816463</label></td>
            </tr>
        </table>

        


    </fieldset>

   

    <fieldset class="peque">
        <legend>Documento</legend>

        <table>
            <tr>
                <td>
                    <input type="date" style="width: 80%;">
                </td>
            </tr>

            <tr>
                <td>
                    <label>Recibo: R3301</label>
                </td>
            </tr>
        </table>

    </fieldset>


    </div>


    

    <div class="tabla_principal" style="width: 99.5%; height: 150px; overflow: auto; float: left; margin-bottom: 10px;">
                <table id="tabla_multi">
                    <tr>
                    <th>Concepto</th>    
                    <th>Documento</th>
                    <th>Importe</th>    
                    <th>Fecha Apli.</th>
                    <th>Fecha Venc.</th>    
                    <th>Saldo</th>
                    <th>Cobrar</th>    
                    </tr>
                    
                    <tr>
                    <td>Saldo mensual</td>    
                    <td>A-2</td>
                    <td>145.00</td>    
                    <td>12-08-2024</td>
                    <td>12-09-2024</td>    
                    <td>145.00</td>
                    <td>N</td>  
                    </tr>

                </table>
                </div>
                <br>
            <fieldset style=" text-align: center; width: 30%; height: 30%; padding: 0px;"> 
        <legend>Concepto de pago</legend>
    
            
            <table id="descrip_multi">
                    <tr>
                    <th>Descripción</th>
                    </tr>
                    
                    <tr>
                    <td>Anticipo</td>
                    </tr>

                </table>
            </fieldset>


            <fieldset style="width: 29.5%; height: 30%; border-radius: 0px; border: 0px solid black; padding: 0px; float: inline-end;">
                
                <table class="pagos" style="height: 100%;">
                    <tr>
                        <td class="pri">Total a pagar</td>
                        <td class="seg">$0.00</td>
                    </tr>

                    <tr>
                        <td class="pri">Total de pagos</td>
                        <td class="seg">$0.00</td>
                    </tr>

                    <tr>
                        <td class="pri">Pendiente</td>
                        <td class="seg">$0.00</td>
                    </tr>

                    <tr>
                        <td class="pri">Devolver</td>
                        <td class="seg">$0.00</td>
                    </tr>
                </table>
                </fieldset>
    </fieldset>
    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>