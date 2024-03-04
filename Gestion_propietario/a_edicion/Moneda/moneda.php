<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="moneda" class="mod">
    <fieldset class="mod_Moneda">
    <legend class="titulo">Valor de monedas</legend>
    <span onclick="cerrar_moneda()" class="cerrar">&times;</span>
    <br>

    <div>
        <button type="button" class="regis_accion" onclick="abrir_agre_moneda()">Nuevo</button>

        <fieldset style="margin-top: 10px; padding: 0px; width: 99.5%; height: 350px; border-radius: 0px; overflow: auto;">
            
        <table id="tb_moneda">
            <tr>
                <th>
                    Descripción
                </th>

                <th>
                    Abreviado
                </th>

                <th>
                    Cambio a lempira
                </th>
            </tr>

            

            
            <?php
            
            $i = 0;


            while($i <= 12)
            {

                echo"
                <tr class='contenido' onclick='abrir_accion_moneda()'>
                <td>lempira</td>
                <td>$. </td>
                <td>$i</td>
                </tr>";

                $i++;
            }
            ?>
        </table>
        

        </fieldset>
    </div>
</form>
</nav>
