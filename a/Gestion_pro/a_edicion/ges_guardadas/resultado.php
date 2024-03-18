<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="resul_busqueda" class="mod">
    <fieldset class="mod_resultado">
    <legend class="titulo">Conceptos de gestion moviliario</legend>
    <span onclick="cerrar_gestion_resultado()" class="cerrar">&times;</span>
    <br>
    
    <div>
        <button type="button" class="regis_accion">Imprimir</button>
        <button type="button" class="regis_accion" onclick="cerrar_gestion_resultado()">Cancelar</button>

        <fieldset style="margin-top: 10px; padding: 0px; width: 99.5%; height: 470px; border-radius: 0px; overflow: auto;">
            
        <table id="tb_concepto_mo">
            <tr>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Fecha realiada</th>
                <th>Codigo de factura</th>
                <th>Documentacion</th>
                <th>Tipo</th>
                <th>Abono</th>
                <th>Fecha de vencimiento</th>
            </tr>
            
            <?php
            
            $i = 0;

            while($i <= 250)
            {

                echo"
                <tr>
                <td>Codigo</td>
                <td>Anthony Clemente Oliva Murillo</td>
                <td>Fecha realiada</td>
                <td>Codigo de factura</td>
                <td>Documentacion</td>
                <td>Tipo</td>
                <td>Abono</td>
                <td>Fecha de vencimiento</td>
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