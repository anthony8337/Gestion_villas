<nav>
    <form action="#" method="post" autocomplete="off">
<div id="ingresar_villa" class="mod">
    <div class="mod_ingreso_villa">
    <span onclick="cerrarcuadro_villa()" class="cerrar">&times;</span>

    <fieldset class="cuerpo_registrar">
    <legend>Datos para la nueva villa</legend>
    <table class="orden">
        <tr>
            
            <td colspan="3">
                <!--Grupo 1-->
                <div style="width: 100%; border: 1px solid chocolate; border-radius: 10px;">

                <table style="text-align: center;">
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
                <input type="text" name="v_numero" id="v_numero" style="width: 100px;">
                </td>

                <td> 
                <label>Estatus</label>
                <br>
                <select style="width: 150px;">
                    <?php
                    $i = ["Activo","Mantenimiento","Descartado"];
                    $a = 0;

                    while($a < count($i))
                    {
                        echo"<option>",$i[$a],"</option>";
                        $a++;
                    }

                    ?>
                </select>
                </td>

                    </tr>
                </table>
               
                </div>
            </td>
        </tr>
        <tr>
            <td>
            <div style="width: 98%; border: 1px solid chocolate; border-radius: 10px; padding: 10px;">
            <table>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <label>Modelo de villa</label>
                    </td>
                </tr>

                <tr style="text-align: center;">
                    <td><label><input type="radio" name="v_tipo" id="v_tipo_1">Villa coracol</label></td>
                    <td><label><input type="radio" name="v_tipo" id="v_tipo_2">Villa arrecife</label></td>
                </tr>

                <tr>
                    <td>
                    <div class="cuadro_villa" >
                    <label>Tamaño del lote:</label>
                    <li><label>150 Mts² • 215 Vr2 • 1,617 Ft²</label></li>
                    <br>
                    <label>Área de construcción:</label>
                    <br>
                    <li><label>89.62 Mts² • 964.7 Ft²</label></li>
                    <br>
                    <li><label>Dormitorio principal con walk in closet</label></li>
                    <br>
                    <li><label>Dormitorio de visitas</label></li>
                    <br>
                    <li><label>2 Baños completos</label></li>
                    <br>
                    <li><label>Porche frontal</label></li>
                    <br>
                    <li><label>Sala</label></li>
                    <br>
                    <li><label>Comedor</label></li>
                    <br>
                    <li><label>Cocina con estufa y refrigeradora incluida</label></li>
                    <br>
                    <li><label>Área de lavandería con centro de lavado</label></li>
                    <br>
                    <li><label>Calentador de Agua</label></li>
                    <br>
                    <li><label>(3) Unidades de minisplits</label></li>
                    <br>
                    <li><label>Alarma de seguridad</label></li>
                    <br>
                    <li><label>Área de piscina compartida</label></li>
                    <br>
                    </div>
                    </td>
                    <td>
                    <div class="cuadro_villa">
                    <label>Tamaño del lote:</label>
                    <li><label>392 Mts² • 664.89 Vr2 • 4,229 Ft²</label></li>
                    <br>
                    <label>Área de construcción:</label>
                    <br>
                    <li><label>163.99 Mts² • 1,765.17 Ft²</label></li>
                    <br>
                    <li><label>Dormitorio principal con walk in closet</label></li>
                    <br>
                    <li><label>2 Dormitorios con closet</label></li>
                    <br>
                    <li><label>2 Baños completos</label></li>
                    <br>
                    <li><label>Porche</label></li>
                    <br>
                    <li><label>lobby</label></li>
                    <br>
                    <li><label>Sala Principal</label></li>
                    <br>
                    <li><label>Comedor</label></li>
                    <br>
                    <li><label>Cocina estilo americano con estufa y refrigeradora incluida</label></li>
                    <br>
                    <li><label>Sala Familiar</label></li>
                    <br>
                    <li><label>Área de lavandería con centro de lavado</label></li>
                    <br>
                    <li><label>Calentador de Agua</label></li>
                    <br>
                    <li><label>Aire acondicionado</label></li>
                    <br>
                    <li><label>Terraza techada</label></li>
                    <br>
                    <li><label>Garaje techado</label></li>
                    <br>
                    <li><label>Alarma de seguridad</label></li>
                    <br>
                    </div>
                    </td>
                </tr>

                <tr>
                <td>
                
                <label>Costo de compra</label>
                <br>
                <label>$</label><input type="text">
                </td>
                <td>
                    <label>Costo de renta</label>
                <br>
                <label>$</label><input type="text">
                    </td>
                </tr>

                
            </table>
            </div>
            </td>
            
           
        </tr>
        
        </table>
        </fieldset>
        <button class="registrar" type="button">Ingresar villa</button>

    </div>
    </div>
</form>
</nav>