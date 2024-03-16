<?php
include "1_Raiz/cabezal.php";
?>

<fieldset class="mod_saldos">
    <legend class="titulo">Estado de saldo</legend>
    <span onclick="cerrar_inser_cliente()" class="cerrar">&times;</span>

    <br>


    <button style="float: inline-end;">
        Imprimir
    </button>

    <br>

    <fieldset style="padding: 0; width: 100%; border: 0px;">
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
    </fieldset>

    <div class="cuerpo_tabla">
    <table id="tabla_contenido">

        <tr>
            <th>Documento</th>
            <th>Concepto</th>
            <th>Fecha Apli.</th>
            <th>Fecha Venc.</th>
            <th>Costo</th>
            <th>Abono</th>
            <th>Importes</th>
            <th>Saldos</th>
        </tr>

        <?php
        
        $costo = 160;
        $abono = 800;
        $importe = $costo;

        $_POST["total"] = 5;
        

        for ($i=0; $i <= 20 ; $i++) { 

            $abono = $abono - $costo;


            if ($abono <= 0) {
                $abono = 0;
                $importe = 0;
            }

            $saldo = $costo - $importe;

            echo"
            <tr>
            <td>A1234$i</td>
            <td>Pago Mensual</td>
            <td>03/03/2024</td>
            <td>03/04/2024</td>
            <td>$costo</td>
            <td>$abono</td>
            <td>$importe</td>
            <td>$saldo</td>
            </tr>
            ";

            $saldo += $i;
        }

        

        ?>

    </table>
    </div>

    

    <fieldset class="dat_saldo" style="height: 65px; width: 40%; margin-top: 20px; float: inline-end;">
    <legend>Total de saldo</legend>

     <table class="datos_b_sal">
        <tr>
            <td>
                <label><?php echo $saldo;?></label>
            </td>
        </tr>
     </table>

    </fieldset>

</fieldset>

<?php
include "1_Raiz/final.php";
?>
