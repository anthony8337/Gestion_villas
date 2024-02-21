<nav>
    <form action="#" method="post" autocomplete="off">
<div id="ingresar_villa" class="mod">
    <div class="mod_venta">
        
    <span onclick="cerrar_insertar_villa()" class="cerrar">&times;</span>
    <fieldset class="cuerpo_registrar">
            <legend class="titulo" id="lg_titulo"></legend>

            <fieldset class="ajuste_villa">
                <legend>Caracteristicas</legend>

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
            <legend>Datos correspondites</legend>
            <table class="fondo_emergente">
            <tr>
                <td style="width: 25%;">
                <fieldset class="mini">
                <legend>Grupo de villa</legend>
               
                <select style="width: 100px; background-color: transparent;">
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
                </fieldset>
                </td>
                <td style="width: 25%;">
                <fieldset class="mini">
                <legend>Numero de villa</legend>
                
                <input type="text" name="v_numero" id="v_numero" style="width: 100px;">
                </fieldset>
                </td>
                <td style="width: 25%;">
                <fieldset class="mini">
                <legend>Contador EHH</legend>
                
                <input type="text" name="v_numero" id="txt_con_e" style="width: 100px;">
                </fieldset>
                </td>
                <td style="width: 25%;">
                <fieldset class="mini">
                <legend>Estatus</legend>
                <select style="width: 150px; background-color: transparent;"  id="sl_estado_e">
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
            

            <tr>
                <td colspan="4">
                <fieldset>
                    <legend>Modelo de villa</legend>

                    <table class="fondo_emergente">
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
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <fieldset>
                    <legend>Tamaño del lote</legend>
                    <input type="number" id="medidas_lote">
                    <br>
                    <label id="metros_l"></label>
                    <label> Mts²/</label>
                    <label id="varas_l"></label>
                    <label> Vr²/</label>
                    <label id="pies_l"></label>
                    <label> Ft²</label>
                    </fieldset>
                </td>

                <td colspan="2" style="width: 50%;">
                    <fieldset>
                    <legend>Area de construccion</legend>
                    <input type="number" id="medidas_construccion">
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
                <td colspan="2" style="width: 50%;">
                    <fieldset>
                    <legend>costo de renta</legend>
                    <label>$</label>
                    <input type="text" style="width: 85%" id="txt_costo_renta">
                    </fieldset>
                </td>

                <td colspan="2">
                    <fieldset>
                    <legend>Costo de venta</legend>
                    <label>$ </label>
                    <input type="text" style="width: 85%" id="txt_costo_venta">
                    </fieldset>
                </td>
            </tr>

        </table>
    </fieldset>

    

    
        </fieldset>
        <table class="fondo_emergente">
        <tr>
        <td style="text-align: center;">
        <button class="registrar" type="button" style="display: block;">Previsualizar villa</button>
        </td>
        </tr>
        </table>
    </div>
    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>