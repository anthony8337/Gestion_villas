var a=0;

function resta_a()
{
    a--;

    document.getElementById("pro_villa_cont").value = a;
}

function llamar_tb_villa_pro() {
    const originalTable = document.getElementById('tabla_villa_pro').getElementsByTagName('tbody')[0];
    const destinationTable = document.getElementById('tabla_villa_pro_selec').getElementsByTagName('tbody')[0];

    originalTable.addEventListener('click', (e) => {
        let target = e.target;
        while (target && target.nodeName !== 'TR') {
            target = target.parentElement;
        }
        if (target && target.nodeName === 'TR') {
            const newRow = target.cloneNode(true);

            const deleteCell = newRow.insertCell(-1);
            deleteCell.innerHTML = '<button onclick="resta_a()" class="accion_tel" title="Eliminar fila"><img src="Imagenes/trash3-fill.svg"></button>';

            deleteCell.querySelector('button').addEventListener('click', (event) => {
                event.stopPropagation();

                target.remove();
                newRow.deleteCell(-1);
                originalTable.appendChild(newRow);
            });

            destinationTable.appendChild(newRow);
            target.remove(); 
            cerrar_selecciona_villa_propi();
            a++;
            document.getElementById("pro_villa_cont").value = a;
        }
    });

    destinationTable.addEventListener('click', (e) => {
        if (e.target && e.target.matches('button.accion_tel img')) {
            let target = e.target;
            while (target && target.nodeName !== 'TR') {
                target = target.parentElement;
            }
            if (target && target.nodeName === 'TR') {
                const newRow = target.cloneNode(true);
                newRow.deleteCell(-1); 
                originalTable.appendChild(newRow);
                target.remove();
                

                

            }
        }
    });


    
}
