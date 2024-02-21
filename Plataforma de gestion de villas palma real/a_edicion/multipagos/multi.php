<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="multipa" class="mod">
    <fieldset class="mod_moviliario">
    <legend class="titulo">Recepcion de pagos multiples</legend>
    <span onclick="cerrar_concepto()" class="cerrar">&times;</span>
    <br>

    <div>
        <button type="button" class="regis_accion" >Guardar</button>
        <button type="button" class="regis_accion" >Cliente</button>
        <button type="button" class="regis_accion" >Selección</button>
        <button type="button" class="regis_accion" >Limpiar</button>
        <button type="button" class="regis_accion" >Observacion</button>

    <fieldset class="peque">
        <legend>Saldo</legend>
        <label class="ver_saldo" style="width: 200px;"></label>
    </fieldset>
    </div>

    <br>
    <div>
        <fieldset style="width:54.5%; height: 80px;">
        <legend>Cliente: A-1</legend>

        <label>Nombre: Anthony Clemente Oliva Murillo</label>
        <br>
        <label>Numero: 94816463</label>
        <br>
        <label>Estadia: Propietario</label>

    </fieldset>

    <fieldset style="height: 80px; width: 20%; padding-right: 0px; padding-left: 0px; text-align: center;">
    <legend style="margin-left: -20%;">Metodo de pago</legend>

<select style=" width: 90%; margin-top: 10px;">



</select>

</fieldset>

    <fieldset class="peque_fecha">
        <legend>Documento</legend>
        <input type="date" style="width: 180px;">
        <label>Recibo: R3301</label>

    </fieldset>
    </div>

    

    <div class="tabla_principal" style="width: 100%; height: 150px; overflow: auto; float: left; margin-bottom: 10px;">
                <table>
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
            <fieldset style="width: 69%; height: 30%; padding: 0px; border: 1px solid black; border-radius: 0px;">
            <table>
                    <tr>
                    <th>Descripción</th>    
                    <th>Pago</th>  
                    </tr>
                    
                    <tr>
                    <td>Pago anticipado</td>    
                    <td>250</td>
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

    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>