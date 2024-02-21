<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="movi" class="mod">
    <fieldset class="movi">
    <legend class="titulo">Alta de movimientos</legend>
    <span onclick="cerrar_mov()" class="cerrar">&times;</span>
    <br>

    <div>
        <button type="button" class="regis_accion" >Guardar</button>
        <button type="button" class="regis_accion" >Cliente</button>
        <button type="button" class="regis_accion" >Documento</button>
        <button type="button" class="regis_accion" >Limpiar</button>
        <button type="button" class="regis_accion" >Observacion</button>
    </div>

    <br>
   
        <fieldset style="width:95%; height: 80px; ">
        <legend>Cliente: A-1</legend>

        <label>Nombre: Anthony Clemente Oliva Murillo</label>
        <br>
        <label>Numero: 94816463</label>
        <br>
        <label>Estadia: Propietario</label>

    </fieldset>

    <fieldset style="width:45%; height: 100px;">
        <legend>Tipo</legend>

        <div style="margin-top: 10px;">
        <input type="radio" name="rb_tipo" value="Cargo">
        <label>Cargo</label>
        <br>
        <input type="radio" name="rb_tipo" value="Abono">
        <label>Abono</label>
        </div>
    </fieldset>

    <fieldset style="width:45%; height: 100px;">
        <legend>Fecha</legend>

        <table style="width: 100%;">
            <tr>
                <td style="text-align: start;"><label>Fecha de aplicacion:</label></td>
                <td><input type="date"></td>
            </tr>

            <tr>
                <td style="text-align: start;"><label>Fecha de Vencimiento:</label></td>
                <td><input type="date"></td>
            </tr>
        </table>

    </fieldset>

    <fieldset style="width:45%; height: 150px;">
        <legend>Concepto</legend>

        <table style="width: 80%;">
            <tr>
                <td style="text-align: start;"><label>Concepto:</label></td>
                <td><input type="text"></td>
            </tr>

            <tr>
                <td style="text-align: start;"><label>Monto:</label></td>
                <td><input type="text"></td>
            </tr>
        </table>
    </fieldset>

    <fieldset style="width:45%; height: 150px;">
        <legend>Documento</legend>
        <label>Factura: A10210</label>
        
    </fieldset>
    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>