function l_pro()
{
    document.getElementById('rb_pro').checked = true;
    document.getElementById('tabla_contenido_propi').style.display = 'flex';
    document.getElementById('tabla_contenido_villa').style.display = 'none';
    document.getElementById('Busca_prin').style.display = 'flex';
    document.getElementById('Busca_vi_prin').style.display = 'none';
    document.getElementById('filtro_pro').style.display = 'flex';
    document.getElementById('filtro_vi').style.display = 'none';
}

function l_villa()
{
    document.getElementById('rb_villas').checked = true;
    document.getElementById('tabla_contenido_propi').style.display = 'none';
    document.getElementById('tabla_contenido_villa').style.display = 'flex';
    document.getElementById('Busca_prin').style.display = 'none';
    document.getElementById('Busca_vi_prin').style.display = 'flex';
    document.getElementById('filtro_pro').style.display = 'none';
    document.getElementById('filtro_vi').style.display = 'flex';
}