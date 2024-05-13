<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_pro.css'>

<div id="lis_pro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_lp()" type="button">X</button>
<h2>Reporte de saldos</h2>
</div>

<div class="c4">

<fieldset>
    <legend>Estado</legend>
    
    <table>
        <tr>
            <td colspan="2">
                <select>
                    <option>Aplica cuenta</option>
                    <option>Suspendido</option>
                    <option>Todas las opciones</option>
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
    <legend>Periodo de saldo</legend>
    
    <table>
        <tr>
            <td>
            <select>
                <option>
                    Mes actual
                </option>
                <option>
                    Todo el año
                </option>
                <option>
                    Rango de tiempo
                </option>
            </select>
            </td>

            <td>
                Desde
            <input type="date">
            </td>

            <td>
                Hasta
            <input type="date">
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