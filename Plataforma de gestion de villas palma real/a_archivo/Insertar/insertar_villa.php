<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="villa_insertar" class="mod">
    <fieldset class="villa_nueva">
    <span onclick="insert_villa_cerrar()" class="cerrar">&times;</span>
    <legend class="titulo" id="lg_titulo"></legend>

    <br>
    <fieldset class="grupos_inser_villa">
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
                <legend>Estado</legend>
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
                    <fieldset class="dimencione" style="width: 49%; height: 100px; margin-top: 20px; float: inline-start;">
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

                <fieldset class="dimencione" style="width: 49%; height: 100px; margin-top: 20px;">
                    <legend>Direccion</legend>
                <textarea style="resize: none; width: 95%; height: 89%;"></textarea>
                    
                </fieldset>

    </fieldset>

    <fieldset class="grupos_inser_villa">
    <fieldset style="text-align: center; width: 44.5%; float: left;">
    <legend>Caracteristicas</legend>
    <button type="button" onclick="insertar_carac()" class="boton_agre_ca">Agregar</button>
    <div class="tabla_principal" style="margin-top: 10px; width: 98%; height: 230px; overflow: auto;">
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

    <fieldset style="text-align: center; width: 44.5%; height: 290px; float: left;">
    <legend>Observaciones</legend>
    <textarea style="resize: none; width: 100%; height: 270px;" id="atxt_direccion">

    </textarea>
    
    </fieldset>
    </fieldset>
    
    <table>
        <tr>
            <td style="text-align: center;">

    <button type="button" class="registrar" style="float:none;" onclick="cerrar_insertar_villa()">Registrar</button>
    <button type="button" class="can" style="float:none;" onclick="insertar_villa_cerrar()">Cancelar</button>

    </fieldset>
    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>