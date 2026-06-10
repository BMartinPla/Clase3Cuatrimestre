


let limite = prompt("Ingrese nuevo límite de extracción:");
let limiteNumerico = parseInt(limite);

// Verifica si la conversión fue exitosa (no es NaN)
if (!isNaN(limiteNumerico)) {
    console.log("Límite actualizado a: " + limiteNumerico);
} else {
    alert("Por favor, ingrese un valor numérico válido.");
}

// Función para imprimir la tabla de multiplicar de un número dado
function tablaDeMultiplicar(numero) {
  console.log("Tabla de multiplicar del " + numero + ":");
  // Usamos un bucle for para multiplicar el número dado por los números del 1 al 10
  for (let i = 1; i <= 10; i++) {
    let resultado = numero * i;
    console.log(numero + " x " + i + " = " + resultado);
  }
}
// Probamos la función con un ejemplo
const numero = 6;
tablaDeMultiplicar(numero);



// Declaración de una función que devuelve un valor
function sum(a, b) {
  return a + b;
}
// Llamada a la función y asignación del resultado a una variable
let result = sum(5, 3);
console.log(result); // Salida: 8



// Función anónima asignada a una variable
let greet = function(name) {
  console.log(`Hello, ${name}!`);
};
// Llamada a la función
greet("Andrea"); // Salida: Hello, Andrea!



// Función de flecha (arrow function)
let square = (x) => {
  return x * x;
};
// Llamada a la función
console.log(square(5)); // Salida: 25

// setTimeout
setTimeout(() => {
 console.log('This runs after 3 seconds'); 
}, 3000);


// setInterval
const intervalID = setInterval(() => {
 console.log('This will stop after 5 seconds');
}, 1000);

setTimeout(() => {
 clearInterval(intervalID);
}, 5000);