

// esto serviria si tuviera node
import { readFile, writeFile } from "node:fs/promises";

// banderas -> si esta en true el dato seria invalido

let banderamail = false;
let banderatelefono = false;
let separador = "";
let renglon = " ";
let salida = "";


// // funciona para verlo en la consola del explorador
// const response = await fetch("./alumnos.json");
// const alumnos = await response.json();

// console.log(alumnos);

// deberia funcionar al ejecutarse para node
import alumnos from "./alumnos.json" assert { type: "json" };

function validarEmail(mail) {
    // Expresión regular estándar para emails
    const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
  
    // Retorna true si es válido, false si no
    return regex.test(mail);
  }

  function validarWhatsapp(numero) {
    // 1. Limpiar: quitar espacios, paréntesis y guiones
    numero = "+" + numero;
    let numeroLimpio = numero.replace(/[\s\-\(\)]/g, "");
  
    // 2. Definir Regex: + seguido de 12 dígitos
    const regexWhatsapp = /^\+[1-9]\d{12}$/;
  
    // 3. Validar
    return regexWhatsapp.test(numeroLimpio);
  }


for (let i = 0; i<alumnos.length; i++) {
    const alumno = alumnos[i];
    // console.log(alumno);
    const mail = alumno.mail;
    const telefono = alumno.telefono;
    renglon = `${alumno.apellido}, ${alumno.nombre}: `;
    banderamail = false;
    banderatelefono = false;
    separador = "";

    if (!validarEmail(mail) && mail != "") {
        banderamail = true;
        renglon += "Mail invalido " + mail;
        separador = "+";
    } 

    // if (banderamail){
    //     console.log(renglon);
    // }

    if (!validarWhatsapp(telefono) && telefono != "") {
        banderatelefono = true;
        renglon += " Telefono invalido " + telefono;
        separador = "+";
    } 

    if (banderamail || banderatelefono){
        console.log(renglon);
    }

    
    
}

    // esto funcionaria si tuviera node
    const nombreArchivo = "Test-" + Date.now() + ".txt";
    await writeFile(nombreArchivo, salida, "UTF8");
