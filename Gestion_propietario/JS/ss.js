

var txtCodVilla = document.getElementById('txt_cod_villa').value;
var txtEehVilla = document.getElementById('txt_eeh_villa').value;
var txtCuartoVi = document.getElementById('txt_cuarto_vi').value;
var txtConstrucVi = document.getElementById('txt_construc_vi').value;
var selVilla = document.getElementById('sel_villa').value;

if (txtCodVilla === "" || txtEehVilla === "" || txtCuartoVi === "" || txtConstrucVi === "" || selVilla === "") {
    console.log("Por favor, completa todos los campos.");
} else {
    console.log("Todos los campos están completos.");
}