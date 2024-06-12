
function enviarDatos() {
    let table = document.getElementById('tabla_villa_pro_selec');
    let data = [];

    for (let i = 0; i < table.rows.length; i++) {
        data.push(table.rows[i].cells[0].innerText);
    }

    // Crear una solicitud AJAX
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'PHP/archivo/emergentes/subs/accion_propietario/procesar_vp.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Mostrar los datos procesados en el div con id="resultado"
            document.getElementById('resultado_tabla').innerHTML = xhr.responseText;
        }
    };

    // Enviar los datos
    xhr.send('v_id=' + encodeURIComponent(JSON.stringify(data)));
}