<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="Lista_saldos" class="mod">
    <fieldset class="mod_resultado">
    <legend class="titulo">Conceptos de gestion moviliario</legend>
    <span onclick="cerrar_lista()" class="cerrar">&times;</span>
    <br>
    
    <div>
        <button type="button" class="regis_accion">Imprimir</button>
        <button type="button" class="regis_accion" onclick="cerrar_gestion_resultado()">Cancelar</button>

        <fieldset style="margin-top: 10px; padding: 0px; width: 99.5%; height: 470px; border-radius: 0px; overflow: auto;">
            
        <table id="tb_concepto_mo">
            <tr>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>RTN</th>
                <th>Telefono</th>
                <th>Estatus</th>
                <th>Medidor EHH</th>
                <th>Saldo actual</th>
            </tr>
            
            <?php
            
            $i = 0;

            while($i <= 250)
            {

                echo"
                <tr>
                <td>Codigo</td>
                <td>Nombre</td>
                <td>RTN</td>
                <td>Telefono</td>
                <td>Estatus</td>
                <td>Medidor EHH</td>
                <td>Saldo actual</td>
                </tr>";

                $i++;
            }
            ?>
        </table>
        

        </fieldset>
    </div>

    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>