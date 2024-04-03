<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_pro_saldo.css'>

<div id="lis_pro_sal" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_lp_sal()" type="button">X</button>
<h2>Reporte de saldos de propietarios</h2>
</div>

<div class="c2">



<fieldset class="grupo">
    <legend>Grupo</legend>
    
    <table>
        <tr>
            <td>
            <input type="radio" name="grupo_pro_radio" id="" checked>Todo
            </td>
            <td>
            <input type="radio" name="grupo_pro_radio" id="">Especificar
            </td>
        </tr>

        <tr>
            <td>
            Desde <select class="grupo_cod">
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
            Hasta <select class="grupo_cod">
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


</div>

<div class="c3">
<button>Imprimir</button>
</div>


</div>

</div>