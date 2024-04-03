<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_pro.css'>

<div id="lis_pro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_lp()" type="button">X</button>
<h2>Reporte de propietario</h2>
</div>

<div class="c2">

<fieldset>
    <legend>Estado</legend>
    
    <table>
        <tr>
            <td>
            <input type="radio" name="estado_pro_radio" id="" checked>Todo
            </td>
            <td>
            <input type="radio" name="estado_pro_radio" id="">Especificar
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <select>
                    <option>Aplica cuenta</option>
                    <option>Suspendido</option>
                </select>
            </td>
        </tr>
    </table>
</fieldset>

<fieldset class="grupo">
    <legend>Grupo</legend>
    
    <table>
        <tr>
            <td>
            <input type="radio" name="grupo_pro1_radio" id="" checked>Todo
            </td>
            <td>
            <input type="radio" name="grupo_pro1_radio" id="">Especificar
            </td>
        </tr>

        <tr>
            <td>
            Desde
            <select class="grupo_cod">
            <?php
            $letras = ['A','B','C','D','E','F','G','H','I','J','K'
            ,'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
            for ($i=0; $i < count($letras); $i++) { 

                 for ($j=1; $j <= 12; $j++) { 
                    echo"
                    <option>$letras[$i]-$j</option>
                    ";
                 }
                }
                ?>
            </select>
            </td>
            <td>
            Hasta 
            <select class="grupo_cod">
                
            <?php

            $letras = ['A','B','C','D','E','F','G','H','I','J','K'
            ,'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
            for ($i=0; $i < count($letras); $i++) { 

                 for ($j=1; $j <= 12; $j++) { 
                    echo"
                    <option>$letras[$i]-$j</option>
                    ";
                 }
                }
                ?>
            </select>
            </td>
        </tr>

    </table>
</fieldset>

<fieldset class="modelo">
    <legend>Estado de villa</legend>
    
    <table>
        <tr>
            <td>
            <input type="radio" name="Es_vi_radio" id="" checked>Todo
            </td>

            <td>
            <input type="radio" name="Es_vi_radio" id="">Disponible
            </td>

            <td>
            <input type="radio" name="Es_vi_radio" id="">Mantenimiento
            </td>
        </tr>
    </table>
</fieldset>

<fieldset class="modelo">
    <legend>Cantidad de saldo</legend>
    
    <table>
        <tr>
            <td>
            <input type="radio" name="Es_sal_pro_radio" id="" checked>Todo
            </td>

            <td>
            <input type="radio" name="Es_sal_pro_radio" id="">Menor de: <input type="number">
            </td>

            <td>
            <input type="radio" name="Es_sal_pro_radio" id="">Mayor de: <input type="number">
            </td>
        </tr>
    </table>
</fieldset>
</div>

<div class="c3">
<button>Imprimir</button>
</div>


</div>

</div>