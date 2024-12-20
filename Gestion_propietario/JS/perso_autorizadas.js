function agregarDatos() {
    // Obtener valores de los inputs
    const nombre = document.getElementById("txt_nom_x").value;
    const telefono = document.getElementById("txt_tex_x").value;
    const correo = document.getElementById("txt_cor_x").value;

    // Validar que los campos no estén vacíos

    if(nombre == '')
    {
        window.alert("Por favor, ingrese el nombre de la persona autorizada");
        return;
    }

    // Obtener la tabla y su cuerpo
    const tabla = document.getElementById("pro_autorizados").getElementsByTagName("tbody")[0];

    // Crear una nueva fila
    const nuevaFila = tabla.insertRow();

    // Agregar celdas y valores a la fila
    nuevaFila.insertCell(0).textContent = '';
    nuevaFila.insertCell(1).textContent = nombre;
    nuevaFila.insertCell(2).textContent = telefono;
    nuevaFila.insertCell(3).textContent = correo;

// Crear celda de acción con botón personalizado
const celdaAccion = nuevaFila.insertCell(4);
const botonEliminar = document.createElement("button");
botonEliminar.className = "accion_tel";
botonEliminar.title = "Eliminar característica";
botonEliminar.onclick = function() {
    eliminarFila(this);
};

// Agregar imagen al botón
const imagen = document.createElement("img");
imagen.src = "Imagenes/trash3-fill.svg";
imagen.alt = "Eliminar";
botonEliminar.appendChild(imagen);

// Agregar botón a la celda
celdaAccion.appendChild(botonEliminar);

document.getElementById("txt_nom_x").value = '';
document.getElementById("txt_tex_x").value = '';
document.getElementById("txt_cor_x").value = '';

}

function agregarDatos_2() {
    // Obtener valores de los inputs
    const nombre = document.getElementById("txt_nom_x_2").value;
    const telefono = document.getElementById("txt_tex_x_2").value;
    const correo = document.getElementById("txt_cor_x_2").value;

    // Validar que los campos no estén vacíos

    if(nombre == '')
    {
        window.alert("Por favor, ingrese el nombre de la persona autorizada");
        return;
    }

    // Obtener la tabla y su cuerpo
    const tabla = document.getElementById("pro_autorizados_2").getElementsByTagName("tbody")[0];

    // Crear una nueva fila
    const nuevaFila = tabla.insertRow();

    // Agregar celdas y valores a la fila
    nuevaFila.insertCell(0).textContent = '';
    nuevaFila.insertCell(1).textContent = nombre;
    nuevaFila.insertCell(2).textContent = telefono;
    nuevaFila.insertCell(3).textContent = correo;

// Crear celda de acción con botón personalizado
const celdaAccion = nuevaFila.insertCell(4);
const botonEliminar = document.createElement("button");
botonEliminar.className = "accion_tel";
botonEliminar.title = "Eliminar característica";
botonEliminar.onclick = function() {
    eliminarFila(this);
};

// Agregar imagen al botón
const imagen = document.createElement("img");
imagen.src = "Imagenes/trash3-fill.svg";
imagen.alt = "Eliminar";
botonEliminar.appendChild(imagen);

// Agregar botón a la celda
celdaAccion.appendChild(botonEliminar);

document.getElementById("txt_nom_x_2").value = '';
document.getElementById("txt_tex_x_2").value = '';
document.getElementById("txt_cor_x_2").value = '';

}

function eliminarFila(boton) {
    // Encontrar la fila que contiene el botón
    const fila = boton.parentNode.parentNode;
    fila.parentNode.removeChild(fila); // Eliminar la fila de la tabla
}
