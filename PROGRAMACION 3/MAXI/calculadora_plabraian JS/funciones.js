const pantalla = document.querySelector('#pantalla');
const botones = document.querySelectorAll('.boton');

botones.forEach(boton => {
    boton.addEventListener('click', () => {
        const contenido = boton.textContent;

        // Botón "=": Realiza el cálculo de toda la cadena
        if (contenido === '=') {
            resolverExpresion();
            return;
        }

        // Botones "C", "CE", "DEL"
        if (boton.classList.contains('del')) {
            manejarBorrado(contenido);
            return;
        }

        // Botones de funciones directas (Raíz, cuadrado, etc.)
        if (['²v(x)', 'x²', '1/x', '+/-'].includes(contenido)) {
            aplicarFuncionEspecial(contenido);
            return;
        }

        // Para todo lo demás (Números y Operadores +, -, x, /)
        escribirEnPantalla(contenido);
    });
});

function escribirEnPantalla(texto) {
    if (pantalla.textContent === '0') {
        pantalla.textContent = texto;
    } else {
        // Agregamos espacios alrededor de los operadores para que se vea más limpio
        if (['+', '-', 'x', '/'].includes(texto)) {
            pantalla.textContent += ` ${texto} `;
        } else {
            pantalla.textContent += texto;
        }
    }
}

// ... (resto del código igual) ...

function manejarBorrado(tipo) {
    if (tipo === 'C' || tipo === 'CE') {
        pantalla.textContent = '0';
    } else if (tipo === 'DEL') {
        let textoActual = pantalla.textContent;

        // 1. Si solo queda un dígito, o si dice "Error", volvemos a '0'
        if (textoActual.length <= 1 || textoActual === 'Error') {
            pantalla.textContent = '0';
            return;
        }

        // 2. Comprobamos si lo último que hay es un operador con espacios (ej: " + ")
        // Si el texto termina con un espacio, significa que el último elemento fue un operador.
        if (textoActual.endsWith(' ')) {
            // Borramos los últimos 3 caracteres (el espacio, el operador, y el otro espacio)
            pantalla.textContent = textoActual.slice(0, -3);
        } else {
            // 3. Si es un número o una coma, simplemente borramos el último caracter
            pantalla.textContent = textoActual.slice(0, -1);
        }
    }
}

// ... (resto del código igual) ...

function resolverExpresion() {
    try {
        // 1. Reemplazamos la 'x' por '*' y la ',' por '.' para que JS lo entienda
        let expresion = pantalla.textContent.replace(/x/g, '*').replace(/,/g, '.');
        
        // 2. Calculamos el resultado usando eval (con cuidado)
        let resultado = eval(expresion);
        
        // 3. Mostramos el resultado (volviendo a poner la coma decimal)
        pantalla.textContent = resultado.toString().replace('.', ',');
    } catch {
        pantalla.textContent = 'Error';
        setTimeout(() => pantalla.textContent = '0', 1500);
    }
}