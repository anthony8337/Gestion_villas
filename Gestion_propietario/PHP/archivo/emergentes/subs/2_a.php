<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="con_registro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_concepto_r_cerrar()" type="button">X</button>
<h2>Ingresar concepto</h2>
</div>

<div class="c2">


<input type="text" placeholder="Concepto">

<table>
    <tr>
        <?php
        
        $a = ['Abono','Cargo'];

        for ($i=0; $i < count($a); $i++) { 

            if ($i == 0) {
                echo"
                <td>
                <input type='radio' onclick='abono()' name='abono' id='rb_abono' checked> $a[$i]
                </td>
                ";
            }
            else
            {

            echo"
            <td>
            <input type='radio' onclick='cargo()' name='abono' id='rb_cargo' > $a[$i]
            </td>
            ";
        }
        }

        ?>
    </tr>
</table>




<input id="txt_valor_con" type="number" placeholder="valor">

<fieldset id="ch_referencia">
<input type="checkbox" checked disabled> Referencia
</fieldset>


    
</div>

<div class="c3">
<button>Agregar</button>
</div>



</div>

</div>