<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="ingresar_villa" class="mod">
    <fieldset class="villa_nueva">
    <span onclick="cerrar_insertar_villa()" class="cerrar">&times;</span>
    <legend class="titulo" id="lg_titulo"></legend>


    <table class="dimencion">
        <tr>
            <td>
            <fieldset class="dimencione">
                <legend>Grupo</legend>
                <input type="text" style="width: 80%;">
            </fieldset>
            </td>

            <td>
            <fieldset class="dimencione">
                <legend>Num. villa</legend>
                <input type="text" style="width: 80%;">
            </fieldset>
            </td>

            <td>
            <fieldset class="dimencione">
                <legend>Cont. EEH</legend>
                <input type="text" style="width: 80%;">
            </fieldset>
            </td>

            <td>
            <fieldset class="dimencione">
                <legend>Grupo</legend>
                <select style="width: 80%; background-color: transparent;"  id="sl_estado_e">
                    <?php
                    $i = ["Disponible","Mantenimiento","Descartado"];
                    $a = 0;
                    while($a < count($i))
                    {
                        echo"<option>",$i[$a],"</option>";
                        $a++;
                    }
                    ?>
                </select>
            </fieldset>
            </td>
        </tr>

    </table>

    <br>
    <fieldset style="width: 45%; height: 340px; float: inline-end; text-align: center;">
    <legend>Caracteristicas</legend>
    <button type="button">Agregar</button>
    <div class="tabla_principal" style=" width: 98%; height: 260px; overflow: auto;">
                <table>
                    <tr>
                        <th style="width: 50px;">Cantidad</th>
                        <th>Descripcion</th>
                    </tr>
                    <?php
                    $j = 0;
                    $tachar = ["Habitaciones","Comedor","Baños","Porche"];

                    while($j < count($tachar))
                    {
                        echo"
                        <tr class:'tabla_caracteristica'>
                        <td style='text-align: center;'>
                        2
                        </td>
                        <td><label class='espacio'> ",$tachar[$j],"</label></td>
                        </tr>";
                        $j++;
                    }
                    ?>

                </table>
                </div>
    </fieldset>

    

    <fieldset style="width: 49%; height: 289px; padding: 0px; text-align: center; border: 0px;">
    <fieldset class="dimencione" style="width: 99.5%; height: 80px; margin-bottom: 20px;">
                    <legend>Modelo de villa</legend>

                    <table class="fondo_emergente" style="height: 100%;">
                        <tr>
                            <td  style="width: 50%;">
                            <label><input type="radio" name="v_tipo" id="v_tipo_1" value="Villa coracol">Villa coracol</label>
                            </td>
                            <td style="width: 50%;">
                            <label><input type="radio" name="v_tipo" id="v_tipo_2" value="Villa arrecife">Villa arrecife</label>
                            </td>
                        </tr>
                    </table>
                </fieldset>


                <fieldset class="dimencione" style="width: 49%; height: 85px; float: inline-start;">
                    <legend>Tamaño del lote</legend>
                    <input type="number" id="medidas_lote" style="width: 80%;">
                    <br>
                    <label id="metros_l"></label>
                    <label> Mts²/</label>
                    <label id="varas_l"></label>
                    <label> Vr²/</label>
                    <label id="pies_l"></label>
                    <label> Ft²</label>
                    </fieldset>

                    <fieldset class="dimencione" style="width: 49%; height: 85px; float: inline-end;">
                    <legend>Area de construccion</legend>
                    <input type="number" id="medidas_construccion" style="width: 80%;">
                    <br>
                    <label id="metros_construccion"></label>
                    <label> Mts²/</label>
                    <label id="varas_construccion"></label>
                    <label> Vr²/</label>
                    <label id="pies_construccion"></label>
                    <label> Ft²</label>
                    </fieldset>

                    <br>


            
    </fieldset>
    <button type="button" class="can" style="float:inline-start;">Cancelar</button>
    <button type="button" class="registrar" style="float: inline-end;">Registrar</button>

    
    
    

    </fieldset>
    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>