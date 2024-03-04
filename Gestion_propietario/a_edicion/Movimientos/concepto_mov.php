<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="concepto_mov" class="mod">
    <fieldset class="mod_Moneda">
    <legend class="titulo">Conceptos de cuenta por cobrar</legend>
    <span onclick="cerrar_con_mo()" class="cerrar">&times;</span>
    <br>
    
    <div>
        <button type="button" class="regis_accion" onclick="abrir_co_nuevo()" >Nuevo</button>

        <fieldset style="margin-top: 10px; padding: 0px; width: 99.5%; height: 350px; border-radius: 0px; overflow: auto;">
            
        <table id="tb_concepto_mo">
            <tr>
                <th >
                    Descripción
                </th>

                <th >
                    Tipo
                </th>

                <th style="width: 20px;">
                    Referencia
                </th>
            </tr>
            
            <?php
            
            $i = 0;

            while($i <= 250)
            {

                echo"
                <tr class='contenido' onclick='cerrar_con_mo()'>
                <td>Anticipo</td>
                <td>C</td>
                <td>N</td>
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