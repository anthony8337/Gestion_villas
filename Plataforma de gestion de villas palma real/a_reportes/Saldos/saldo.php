<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="saldo" class="mod">
    <fieldset class="r_saldo">
    <legend class="titulo">Saldo de los propietarios</legend>
    <span onclick="cerrar_saldo()" class="cerrar">&times;</span>
    <br>

    <?php
    $letra_desde = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    $letra_hasta = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    
    $i = 0;
    $j = 0;
    ?>

    <fieldset style="width:49%; height: 80px; padding: 0px;">
        <table style="height: 100%;">
            <tr>
                <td> 
                <label>Buscar por estado</label>
                <br>
                <select class="txt_d" style="width: 80%;">
                    <option>Todos</option>
                    <option>Activo</option>
                    <option>Suspendido</option>
                </select>
                </td>
            </tr>
        </table>
    </fieldset>

        <fieldset style="width:99%; height: 200px; padding: 0px;">
        <table style="height: 100%;">
            <tr>
                <td> 
                <label>Desde el grupo:</label>
                <br>

                <select class="txt_d" style="width: 80%;">
                <?php
                while($i < count($letra_desde))
                {
                    echo"<option>",$letra_desde[$i],"</option>";
                    $i++;
                }
                ?>
                </td>

                <td> 
                <label>Hasta el grupo:</label>
                <br>

                <select class="txt_d" style="width: 80%;">
                <?php
                while($j < count($letra_hasta))
                {
                    echo"<option>",$letra_hasta[$j],"</option>";
                    $j++;
                }
                ?>
                </td>
            </tr>
            <tr>
                <td> 
                <label>Desde el numero:</label>
                <br>
                <input style="width: 80%;" type="number" class="txt_d" name="" id="">
                </td>

                <td> 
                <label>Hasta el numero:</label>
                <br>
                <input style="width: 80%;" type="number" class="txt_d" name="" id="">
                </td>
            </tr>
        </table>
    </fieldset>

    <br>

    <fieldset style="padding: 0px; border: 0px;">
    <button type="button" style="margin-top: 20px;" onclick="abrir_lista()">Ejecutar</button>
    </fieldset>
    

    </fieldset>
    
    </div>

</form>
</nav>
