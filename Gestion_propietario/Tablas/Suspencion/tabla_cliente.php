<div class="grupo_busqueda">
<input type="text" id="busca_cliente" name="busca_cliente" placeholder="Buscar propietario">
</div>

<div class="cuerpo_cuadros">
<table id='tabla_cliente'>
<?php

$letra = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
$estadia;

echo"

<tr>
<th>",'Villa',"</th>
<th>",'Nombre Completo',"</th>
<th>",'RTN',"</th>
<th>",'Numero telefonico',"</th>
<th>",'Estado',"</th>
<th>",'Fecha de ingreso',"</th>
</tr>";
$i = 0;
while($i < count($letra))
{

    for($j = 1; $j <= 12; $j++)
    {
        if($j == 2)
        {
            $estadia[2] = "Aplica cuota";
        }
        else
        {
            $estadia[$j] = "Suspendido";
        }

        echo "
        <tr class='contenido' onclick='confirma_sus_cli()'>
        <td>",$letra[$i],'-',$j,"</td>
        <td>",$nombre[rand(0,count($nombre)-1)]," ",$Snombre[rand(0,count($Snombre)-1)]," ",
        $apellido[rand(0,count($apellido)-1)]," ",$sapellido[rand(0,count($sapellido)-1)],"</td>
        <td>0101-",rand(1950,2000),"-",rand(10000,50000),"</td>
        <td>+504 ",rand(80000000,99999999),"</td>
        <td>",$estadia[$j],"</td>
        <td>",rand(2000,2024),"-",rand(01,12),"-",rand(1,31),"</td>
        ";
    }

    $i++;
}

?>
</table>



</div>

<script src="Tablas/Busqueda.js"></script>