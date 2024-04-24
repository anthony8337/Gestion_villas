<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_moneda_archivo.css'>

<div id="moneda_registro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_moneda_r_cerrar()" type="button">X</button>
<h2>Ingresar moneda</h2>
</div>

<div class="c2">

<form id="formulario_moneda" method="post">

<?php

$m_d= ['txt_m_1','txt_m_2','txt_m_3'];
$m_p= ['Nombre de moneda','Simbolo de moneda','Valor a lempira'];

for ($i=0; $i < count($m_d); $i++) { 

    if($i == (count($m_d) -1))
    {
        echo"
        <input type='number' id='$m_d[$i]' name='$m_d[$i]' placeholder='$m_p[$i]' title='$m_p[$i]'>
        ";
    }else
    {
        echo"
        <input type='text' id='$m_d[$i]' name='$m_d[$i]' placeholder='$m_p[$i]' title='$m_p[$i]'>
        ";
    }
}


?>


<button id="agre_moneda" name="agre_moneda" type="button" onclick="insertarDatos()">Agregar</button>

    
</form>

<div id="resultado_moneda"></div>

</div>

</div>

</div>



<script>
    function insertarDatos() {
        var txt_m_1 = document.getElementById("txt_m_1").value;
        var txt_m_2 = document.getElementById("txt_m_2").value;
        var txt_m_3 = document.getElementById("txt_m_3").value;

        $.ajax({
            url: 'PHP/archivo/sub_3_e/insertar.php',
            type: 'POST',
            data: {txt_m_1: txt_m_1, txt_m_2: txt_m_2, txt_m_3: txt_m_3},
            success: function(response) {
                document.getElementById("resultado_moneda").innerHTML = response;
                confir_moneda();

                $.ajax({
                url: 'PHP/archivo/sub_3_e/tabla.php',
                type: 'GET',
                success: function(data) {
                    document.getElementById("interior_moneda").innerHTML = data;
                }
            });

            }
        });
    }

    function confir_moneda()
    {

        window.alert("Dato registrado con exito");
        document.getElementById("moneda_registro").style.display = 'none';
    }


</script>
