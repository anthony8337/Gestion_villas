<nav>
<form action="#" method="post" autocomplete="off">
<div id="caracteristica" class="mod">
<div class="ejecutar_caracteristica">
<span onclick="cerrar_caracteristica()" class="cerrar">&times;</span>

<fieldset style=" width:95.5%; height: 490px; overflow: auto; padding-bottom: 5px;">
<legend class="titulo">Añadir caracteristicas</legend>

<table>
    <tr>
        <td style="text-align: center; border: 0;">
        <div style="margin: 0% fixed;">
        <button type="button" onclick="mostrar_insertar_carac()">Crear nuevo</button>
        <input type="text" style="width: 500px">
        </div>
        </td>
    </tr>
</table>


<div class="tabla_principal" style="width: 99%; height: 350px; overflow: auto;">
                <table>
                    <tr>
                        <th style="width: 100px;">Cantidad</th>
                        <th>Descripcion</th>
                    </tr>
                    <?php
                    $i=0;
                    $contados = ["Dormitorio principal con walk in closet","Dormitorio con closet","Dormitorio de visitas"
                    ,"Baños completos","Unidades de aire acondicionado"];

                    while($i < count($contados))
                    {
                        echo"
                        <tr>
                        <td style='text-align: center;'>Plural</td>
                        <td><label class='espacio'>",$contados[$i],"</label></td>
                        <td style='text-align: center;'>
                        <button type='button' style='border-radius: 10px; background-color: salmon; width: 20px; height: 20px;'></button>
                        <button type='button' style='border-radius: 10px; background-color: green; width: 20px; height: 20px;'></button>
                        </td>
                        </tr>";

                        $i++;
                    }

                    $j = 0;
                    $tachar = ["Porche","Porche frontal","Sala","Sala principal",
                    "Lobby","Comedor","Cocina con estufa y refrigeradora incluida",
                    "Cocina estilo americano con estufa y refrigeradora incluida","Sala Familiar",
                    "Área de lavandería con centro de lavado","Calentador de agua","Terraza techada",
                    "Garaje techado","Alarma de seguridad","Área de piscina compartida"];

                    while($j < count($tachar))
                    {
                        echo"
                        <tr>
                        <td>singular</td>
                        <td><label class='espacio'> ",$tachar[$j],"</label></td>
                        <td style='text-align: center;'>
                        <button type='button' style='border-radius: 10px; background-color: salmon; width: 20px; height: 20px;'></button>
                        <button type='button' style='border-radius: 10px; background-color: green; width: 20px; height: 20px;'></button>
                        </td>
                        </tr>";
                        $j++;
                    }
                    ?>

                </table>
                </div>

</fieldset>


</div>
</div>
</form>
</nav>