    <div id="saldos_abrir" class="mod">
    <fieldset class="mod_saldos">
    <legend class="titulo">Saldo del cliente</legend>
    <span onclick="saldo_cerrar()" class="cerrar">&times;</span>

    <br>
    <button>
        Generar cuenta
    </button>

    <button>
        Pago multiple
    </button>

    <button style="float: inline-end;">
        Imprimir
    </button>

    <br>

    <fieldset class="dat_saldo" style="width: 50%; margin-top: 20px;">
    <legend>Codigo: <Label>A-5</Label></legend>

     <table class="datos_b_sal">
        <tr>
            <td>
            <label>Nombre: </label>
            </td>

            <td>
            <label>Anthony Clemente Oliva Murillo</label>
            </td>
        </tr>

        <tr>
            <td>
            <label>Numero: </label>
            </td>

            <td>
            <label>+504 94856463</label>
            </td>
        </tr>
     </table>

    </fieldset>

    <fieldset class="dat_saldo" style="width: 40%; margin-top: 20px;">
    <legend>Periodo de fecha</legend>

     <table class="datos_b_sal">
        <tr>
            <td>
            <label>Desde</label>
            </td>

            <td>
            <input type="date">
            </td>
        </tr>

        <tr>
        <td>
            <label>Hasta</label>
            </td>

            <td>
            <input type="date">
            </td>
        </tr>
     </table>

    </fieldset>

    <div class="cuerpo_tabla">
    <table>

        <tr>
            <th>Documento</th>
            <th>Concepto</th>
            <th>Descripcion</th>
            <th>Fecha Apli.</th>
            <th>Fecha Venc.</th>
            <th>Costo</th>
            <th>Abono</th>
            <th>Importes</th>
            <th>Saldos</th>
        </tr>

        <?php
        
        $costo = 160;
        $abono = 80;
        $suelto = 0;
        $saldo = 0;


        $descrip = ['Agre. abono','Agua','Luz','Mantenimiento','Internet'];
        $pre = ['0','20','50','160','70',];
        
        for ($i=0; $i < count($descrip) ; $i++) { 

            $costo = $pre[$i];
            $importe = $costo;

            $suelto = $abono - $importe;
            
            if ($suelto < 0) {
                $saldo = $suelto * -1;
            }

            if ($abono <= 0) {
                $abono = 0;
                $importe = 0;
                $saldo = $costo;
            }

            echo"
            <tr>
            <td>A123$i</td>
            <td>Pago Mensual</td>
            <td>$descrip[$i]</td>
            <td>03/03/2024</td>
            <td>03/04/2024</td>
            <td>$costo</td>
            <td>$abono</td>
            <td>$importe</td>
            <td class='columna-sumar'>$saldo</td>
            </tr>
            ";
            $abono = $abono - $costo;
        }
        ?>

    </table>
    </div>


    <fieldset class="dat_saldo" style="height: 65px; width: 40%; margin-top: 20px; float: inline-end;">
    <legend>Total de saldo</legend>

     <table class="datos_b_sal">
        <tr>
            <td>
            <label style="font-size: 20px;" id="total-suma"></label>
            </td>
        </tr>
     </table>

    </fieldset>

    <fieldset class="dat_saldo" style="height: 65px; width: 40%; margin-top: 20px; float: inline-start;">
    <legend>Total de abono</legend>

     <table class="datos_b_sal">
        <tr>
            <td>
            <label style="font-size: 20px;">
            <?php 

            if($abono < 0)
            {
                $abono = 0;
            }

            echo"$abono";
            ?></label>
            </td>
        </tr>
     </table>

    </fieldset>

</fieldset>

</div>
<script src="compor_p_p/suma_sal.js"></script>

