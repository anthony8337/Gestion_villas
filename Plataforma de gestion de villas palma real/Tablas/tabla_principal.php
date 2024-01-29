<?php

echo"
"//acciones de busqueda
,"<div class='grupo_busqueda'>
<label class='lb_busca'>Buscar Cliente:</label>
<input type='text' id='p_busca' name='p_busca'>
</div>

"//Tabla donde muestra todos los registros
,"
<table>
<tr>
<th>",'Villa',"</th>
<th>",'Propietario',"</th>
<th>",'Estatus',"</th>
<th>",'RTN',"</th>
<th>",'Telefono',"</th>
<th>",'Medidor EEH',"</th>
<th>",'Saldo',"</th>
</tr>

";

$i = 0;
while($i <= 100)
{
    echo "
    <tr class='contenido' onclick='mostrarcuadro()'>
    <td>",'Hola',"</td>
    <td>",$i,"</td>
    <td>",$i,"</td>
    <td>",$i,"</td>
    <td>",$i,"</td>
    <td>",$i,"</td>
    <td>",$i,"</td>
    </tr>
    ";
    $i++;
}
echo "</table>";
?>