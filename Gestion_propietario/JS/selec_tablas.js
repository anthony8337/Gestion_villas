function l_pro()
{
    document.getElementById('rb_pro').checked = true;
    document.getElementById('tabla_contenido_propi').style.display = 'flex';
    document.getElementById('tabla_contenido_villa').style.display = 'none';
}

function l_villa()
{
    document.getElementById('rb_villas').checked = true;
    document.getElementById('tabla_contenido_propi').style.display = 'none';
    document.getElementById('tabla_contenido_villa').style.display = 'flex';
}