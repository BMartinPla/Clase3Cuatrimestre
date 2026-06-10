const express = require("express");
const Alumnos = require("./Alumnos.json");

const app = express();
const port = 3000;

app.use(express.json());

app.get("/", (req, res) => {
    res.send("Server On");
}); 

app.listen(port, () => {
    console.log("Server on " + port);
});

app.get("/Alumnos", (req, res) => {
    const { apellido, estado, sexo } = req.query;

    let alumnosFiltro = [...Alumnos];

    if (apellido) {
        alumnosFiltro = alumnosFiltro.filter(a => a.apellido?.toLowerCase().includes(apellido.toLowerCase()));
    }

    if (estado) {
        const estadoLower = estado.toLowerCase();
        alumnosFiltro = alumnosFiltro.filter(a => a.estado?.toLowerCase() === estadoLower);
    }

    if (sexo) {
        const sexoLower = sexo.toLowerCase();
        alumnosFiltro = alumnosFiltro.filter(a => a.sexo?.toLowerCase() === sexoLower);
    }

    return res.status(200).json(alumnosFiltro);
});



app.get ("/Alumnos/:nro_alumno", (req, res) =>
{
    const nro_alumno = parseInt(req.params.nro_alumno);
    const Alumno = Alumnos.find(a => a.nro_alumno === nro_alumno);

    if(Alumno)
    {
        return res.status(200).json(Alumno)
    }
    else
    {
        return res.status(404).json({error: "Alumno no encontrado"});
    }
});


app.post("/Alumnos", (req, res) => {
    const { apellido, nombre, dni, nro_legajo, fecha_nacimiento, sexo, telefono, mail, direccion, cod_postal, estado } = req.body;

    // Validación de campos obligatorios
    if (!apellido || !nombre || !dni) {
        return res.status(400).json({ "error": "Faltan datos obligatorios" });
    }

    // Validación de duplicados
    const existe = Alumnos.some(a => a.nro_legajo === nro_legajo || a.dni === dni);
    if (existe === true) {
        return res.status(400).json({ "error": "Datos duplicados" });
    }

    // 1. Generar un nuevo nro_alumno (busca el más alto y le suma 1)
    const maxId = Alumnos.length > 0 ? Math.max(...Alumnos.map(a => a.nro_alumno)) : 0;
    const nuevoNroAlumno = maxId + 1;


    // 2. Crear el nuevo objeto del alumno
    const nuevoAlumno = {
        nro_alumno: nuevoNroAlumno,
        apellido,
        nombre,
        dni,
        nro_legajo,
        fecha_nacimiento,
        sexo,
        telefono,
        mail,
        direccion,
        cod_postal,
        estado
    };

    // 3. Agregar el nuevo alumno al arreglo en memoria
    Alumnos.push(nuevoAlumno);

    // 4. Responder con código 201 (Created) y el objeto insertado
    return res.status(201).json(nuevoAlumno);
});

app.patch ("/Alumnos", (req, res) => {
    const {nro_alumno, apellido, nombre} = req.body;

    if (!nro_alumno) {
        return res.status(400).json({ "error": "Falta nro_alumno" });
    }

    const indice = Alumnos.findIndex(a => a.nro_alumno === nro_alumno);

    if (indice === -1) {
        return res.status(404).json({ "error": "Alumno no encontrado" });
    }

    const alumnoModificado = {... Alumnos[indice], apellido: apellido, nombre: nombre};
    Alumnos[indice] = alumnoModificado;
    res.status(200).json(alumnoModificado);

});
