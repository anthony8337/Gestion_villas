<nav>
    <form action="#" method="post" autocomplete="off">
<div id="modificar_villa" class="mod">
    <div class="mod_venta">
        
    <span onclick="cerrar_edicion_villa()" class="cerrar">&times;</span>
    <fieldset class="cuerpo_registrar">
            <legend class="titulo">Modificar villa</legend>

            <fieldset class="ajuste_villa">
                <legend>Caracteristicas de las villas</legend>

                <table class="fondo_emergente">
                    <tr>
                        <td style="text-align: center;">
                        <input type="text" style="width: 300px;">
                        <button type="button" class="registrar" onclick="mostrar_caracteristica()" style="margin-bottom: 10px;">Agregar caracteristica</button>
                    </td>
                    </tr>
                </table>
                <div class="tabla_principal" style="height: 280px; overflow: auto;">
                <table>
                    <tr>
                        <th style="width: 50px;">Incluye</th>
                        <th>Descripcion</th>
                    </tr>
                    
                    
                    <?php

                    $j = 0;
                    $tachar = ["Dormitorio principal con walk in closet","Dormitorio con closet","Dormitorio de visitas"
                    ,"Baños completos","Unidades de aire acondicionado","Porche","Porche frontal","Sala","Sala principal",
                    "Lobby","Comedor","Cocina con estufa y refrigeradora incluida",
                    "Cocina estilo americano con estufa y refrigeradora incluida","Sala Familiar",
                    "Área de lavandería con centro de lavado","Calentador de agua","Terraza techada",
                    "Garaje techado","Alarma de seguridad","Área de piscina compartida"];

                    while($j < count($tachar))
                    {
                        echo"
                        <tr class:'tabla_caracteristica'>
                        <td style='text-align: center;'>
                        <input type='checkbox'>
                        </td>
                        <td><label class='espacio'> ",$tachar[$j],"</label></td>
                        </tr>";
                        $j++;
                    }
                    ?>

                </table>
                </div>
            </fieldset>
            <fieldset class="ajuste_villa">
            <table class="fondo_emergente">
            <tr>
                <td>
                <label>Grupo de villa</label>
                <br>
                <select style="width: 100px;">
                    <?php
                    $i = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
                    $a = 0;

                    while($a < count($i))
                    {
                        echo"<option>",$i[$a],"</option>";
                        $a++;
                    }

                    ?>
                </select>
                </td>
                <td>
                <label>Numero de villa</label>
                <br>
                <input type="text" name="v_numero" id="v_numero" style="width: 100px;">
                </td>
                <td>
                <label>Contador EHH</label>
                <br>
                <input type="text" name="v_numero" id="txt_con_e" style="width: 100px;">
                </td>
                <td>
                <label>Estado</label>
                <br>
                <select id="sl_estado_e" style="width: 150px;">
                    <?php
                    $i = ["Disponible","Mantenimiento","Descartado"];
                    $a = 0;

                    while($a < count($i))
                    {
                        echo"<option value=",$i[$a],">",$i[$a],"</option>";
                        $a++;
                    }

                    ?>
                </select>
                </td>
            </tr>
            

            <tr>
                <td colspan="4">
                <fieldset>
                    <legend>Modelo de villa</legend>

                    <table class="fondo_emergente">
                        <tr>
                            <td>
                            <label><input type="radio" name="v_tipo" id="v_tipo_1_e" value="Villa coracol">Villa coracol</label>
                            </td>
                            <td>
                            <label><input type="radio" name="v_tipo" id="v_tipo_2_e" value="Villa arrecife">Villa arrecife</label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <fieldset>
                    <legend>Tamaño del lote</legend>
                    <input type="text" id="medidas_lote">
                    <br>
                    <label id="metros_lote"></label>
                    <label> Mts²/</label>
                    <label id="varas_lote"></label>
                    <label> Vr²/</label>
                    <label id="pies_lote"></label>
                    <label> Ft²</label>
                    </fieldset>
                </td>

                <td colspan="2">
                    <fieldset>
                    <legend>Area de construccion</legend>
                    <input type="text" id="medidas_construccion">
                    <br>
                    <label id="metros_construccion"></label>
                    <label> Mts²/</label>
                    <label id="varas_construccion"></label>
                    <label> Vr²/</label>
                    <label id="pies_construccion"></label>
                    <label> Ft²</label>
                    </fieldset>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <fieldset>
                    <legend>costo de renta</legend>
                    <label>$ </label>
                    <input type="text" style="width: 240px;">
                    </fieldset>
                </td>

                <td colspan="2">
                    <fieldset>
                    <legend>Costo de venta</legend>
                    <label>$ </label>
                    <input type="text" style="width: 240px;">
                    </fieldset>
                </td>
            </tr>

        </table>
    </fieldset>

    

    
        </fieldset>
        <table class="fondo_emergente">
        <tr>
        <td style="text-align: center;">
        <button class="registrar" type="button">Previsualizar villa</button>
        </td>
        </tr>
        </table>
    </div>
    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>