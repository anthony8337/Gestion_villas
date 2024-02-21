<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="concepto" class="mod">
    <fieldset class="mod_Moneda">
    <legend class="titulo">Conceptos de cuenta por cobrar</legend>
    <span onclick="cerrar_co()" class="cerrar">&times;</span>
    <br>
    
    <div>
        <button type="button" class="regis_accion" >Nuevo</button>

        <fieldset style="margin-top: 10px; padding: 0px; width: 99.5%; height: 350px; border-radius: 0px; overflow: auto;">
            
        <table>
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
                <tr class='contenido'>
                <td>$i</td>
                <td>$i</td>
                <td>$i</td>
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