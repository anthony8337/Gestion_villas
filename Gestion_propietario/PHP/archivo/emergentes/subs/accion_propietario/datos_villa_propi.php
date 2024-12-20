<?php
$servername = "localhost"; 
$username = "root";
$password = "";
$database = "gestion_de_propietario";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} 
else
{
}

$id_unir = $_POST['id_unir'];

$sql = "SELECT * FROM tomar_villa_vista WHERE id_unir = '$id_unir';";

$result = $conn -> query($sql);

if ($result -> num_rows > 0) 
{
    while($row = $result->fetch_assoc())
    {

        $id_grupo = $row['id_grupo'];
        $id_villa = $row['id_villa'];
        $numero = $row['numero'];
        $modelo = $row['modelo'];
        $cont_eeh = $row['cont_eeh'];
        $habitaciones = $row['habitaciones'];
        $banios = $row['banios'];
        $fecha_contruc = $row['fecha_contruc'];

    }
}

?>

<script>


document.getElementById('id_villa_pro1').value =  <?php echo"$id_villa";?>;
document.getElementById('cb_mo_propi').value = <?php echo json_encode($modelo); ?>;
document.getElementById('cb_grupo_villa').value = <?php echo"$id_grupo";?>;
document.getElementById('txt_n_villa').value = <?php echo"$numero";?>;
document.getElementById('txt_c_enee').value = <?php echo"$cont_eeh";?>;
document.getElementById('txtnh').value = <?php echo"$habitaciones";?>;
document.getElementById('txtbanio').value = <?php echo"$banios";?>;
document.getElementById('dt_fc').value = <?php echo json_encode($fecha_contruc); ?>;


</script>