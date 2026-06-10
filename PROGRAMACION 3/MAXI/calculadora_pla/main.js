let memoria = 0;
let historial = [];

function guardarHistorialEnMemoria() {
    localStorage.setItem('historialCalculadora', JSON.stringify(historial));
}

const pantalla = document.querySelector('#pantalla');
const botones = document.querySelectorAll('.boton');


botones.forEach(boton => {
    boton.addEventListener('click', () => {
        const contenido = boton.textContent;

        if (contenido === '=') {
            resolverExpresion();
            return;
        }

        if (boton.classList.contains('del')) {
            manejarBorrado(contenido);
            return;
        }
2
        if (['²v(x)', 'x²', '1/x', '+/-', 'n!'].includes(contenido)) {
            aplicarFuncionEspecial(contenido);
            return;
        }

        if (['MC', 'MR', 'M+', 'M-'].includes(contenido)) {
            manejarMemoria(contenido);
            return;
        }

        escribirEnPantalla(contenido);
    });
});

function escribirEnPantalla(texto) {
    let textoActual = pantalla.textContent;

    if (textoActual.length >= 15) {
        return; 
    }

    if (texto === ',') {
        if (textoActual.endsWith(' ')) {
            return;
        }

        let partes = textoActual.split(' '); 
        let ultimoNumero = partes[partes.length - 1]; 
        
        if (ultimoNumero.includes(',')) {
            return;
        }
    }

    if (textoActual === '0' && texto !== ',') {
        pantalla.textContent = texto;
    } else {
        if (['+', '-', 'x', '/'].includes(texto)) {
            if (textoActual.endsWith(' ')) {
                pantalla.textContent = textoActual.slice(0, -3);
            }
            pantalla.textContent += ` ${texto} `;
        } else {
            pantalla.textContent += texto;
        }
    }
}

function manejarBorrado(tipo) {
    if (tipo === 'C' || tipo === 'CE') {
        pantalla.textContent = '0';
    } else if (tipo === 'DEL') {
        let textoActual = pantalla.textContent;

        if (textoActual.length <= 1 || textoActual === 'Error') {
            pantalla.textContent = '0';
            return;
        }

        if (textoActual.endsWith(' ')) {
            pantalla.textContent = textoActual.slice(0, -3);
        } else {
            pantalla.textContent = textoActual.slice(0, -1);
        }
    }
}

function resolverExpresion() {
    try {
        let expresionOriginal = pantalla.textContent; 
        
        let expresion = pantalla.textContent.replace(/x/g, '*').replace(/,/g, '.').replace(/%/g, '/100');
        let resultado = eval(expresion);

        if (resultado === Infinity || resultado === -Infinity) {
            pantalla.textContent = 'Error';
            setTimeout(() => pantalla.textContent = '0', 1500);
            return;
        }
        
        let resultadoFormateado = resultado.toString().replace('.', ',');
        pantalla.textContent = resultadoFormateado;

        historial.push({
            operacion: expresionOriginal,
            resultado: resultadoFormateado
        });

        guardarHistorialEnMemoria();

        renderizarHistorial();

    } catch {
        pantalla.textContent = 'Error';
        setTimeout(() => pantalla.textContent = '0', 1500);
    }
}

function aplicarFuncionEspecial(funcion) {
    let expresionOriginal = pantalla.textContent; 
    
    let expresion = pantalla.textContent.replace(/x/g, '*').replace(/,/g, '.');
    let valorActual = 0;
    
    try {
        valorActual = eval(expresion);
    } catch {
        pantalla.textContent = 'Error';
        setTimeout(() => pantalla.textContent = '0', 1500);
        return;
    }

    let resultado = 0;

    switch (funcion) {
        case '+/-':
            resultado = valorActual * -1;
            break;
        case 'x²':
            resultado = Math.pow(valorActual, 2);
            break;
        case '²v(x)':
            if (valorActual < 0) {
                pantalla.textContent = 'Error';
                setTimeout(() => pantalla.textContent = '0', 1500);
                return;
            }
            resultado = Math.sqrt(valorActual);
            break;
        case '1/x':
            if (valorActual === 0) {
                pantalla.textContent = 'Error';
                setTimeout(() => pantalla.textContent = '0', 1500);
                return;
            }
            resultado = 1 / valorActual;
            break;
        case 'n!':
            if (valorActual < 0 || !Number.isInteger(valorActual)) {
                pantalla.textContent = 'Error';
                setTimeout(() => pantalla.textContent = '0', 1500);
                return;
            }
            resultado = 1;
            for (let i = valorActual; i > 1; i--) {
                resultado *= i;
            }
            break;
    }

        let resultadoFormateado = resultado.toString().replace('.', ',');
        pantalla.textContent = resultadoFormateado;

        historial.push({
            operacion: expresionOriginal,
            resultado: resultadoFormateado
        });

        guardarHistorialEnMemoria();

        renderizarHistorial();

}

document.addEventListener('keydown', (event) => {
    const tecla = event.key;

    if (tecla === 'Enter') {
        event.preventDefault();
        resolverExpresion();
        return;
    }

    if (tecla === 'Escape') {
        manejarBorrado('C');
        return;
    }

    if (tecla === 'Backspace') {
        manejarBorrado('DEL');
        return;
    }

    const caracteresValidos = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '-', '*', '/', ',', '.', '(', ')', '%'];
    
    if (caracteresValidos.includes(tecla)) {
        let caracterAEscribir = tecla;
        if (tecla === '*') caracterAEscribir = 'x';
        if (tecla === '.') caracterAEscribir = ',';
        
        escribirEnPantalla(caracterAEscribir);
    }
});

function manejarMemoria(accion) {
    let expresion = pantalla.textContent.replace(/x/g, '*').replace(/,/g, '.');
    let valorActual = 0;

    switch (accion) {
        case 'MC': 
            memoria = 0;
            break;
        case 'MR':
            escribirEnPantalla(memoria.toString().replace('.', ','));
            break;
        case 'M+':
            try {
                valorActual = eval(expresion) || 0;
                } catch {
                return;
            }
            memoria += valorActual;
            break;
        case 'M-':
            try {
                valorActual = eval(expresion) || 0;
                } catch {
                return;
            }
            memoria -= valorActual;
            break;
    }
}

function renderizarHistorial() {
    const contenedorLista = document.getElementById('lista-historial');
    contenedorLista.innerHTML = '';

    historial.forEach((item, index) => { 
        const divItem = document.createElement('div');
        divItem.className = 'item-historial';

        divItem.innerHTML = `
            <div class="info-operacion">
                <span>${item.operacion}</span>
                <strong>${item.resultado}</strong>
            </div>
            <button class="btn-borrar-item" title="Borrar operación">X</button>
        `;
        
        const divInfo = divItem.querySelector('.info-operacion');
        divInfo.addEventListener('click', () => {
            pantalla.textContent = item.operacion;
        });

        const btnBorrar = divItem.querySelector('.btn-borrar-item');
        btnBorrar.addEventListener('click', () => {
            historial.splice(index, 1);
            guardarHistorialEnMemoria(); 
            renderizarHistorial();
        });

        contenedorLista.appendChild(divItem);
    });
}

document.getElementById('btn-limpiar-historial').addEventListener('click', () => {
    historial = [];
    localStorage.removeItem('historialCalculadora');
    renderizarHistorial();
});

const btnTema = document.getElementById('btn-tema');

btnTema.addEventListener('click', () => {
    document.body.classList.toggle('tema-claro');
    
    if (document.body.classList.contains('tema-claro')) {
        localStorage.setItem('temaCalculadora', 'claro');
        btnTema.textContent = '🌙 Modo Oscuro';
    } else {
        localStorage.setItem('temaCalculadora', 'oscuro');
        btnTema.textContent = '☀️ Modo Claro';
    }
});

document.addEventListener('DOMContentLoaded', () => {
    const datosGuardados = localStorage.getItem('historialCalculadora');
    if (datosGuardados) {
        historial = JSON.parse(datosGuardados); 
        renderizarHistorial();
    }

    const temaGuardado = localStorage.getItem('temaCalculadora');
    if (temaGuardado === 'claro') {
        document.body.classList.add('tema-claro');
        btnTema.textContent = '🌙 Modo Oscuro';
    }
});