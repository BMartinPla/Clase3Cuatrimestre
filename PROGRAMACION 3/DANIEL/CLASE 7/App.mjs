import express from 'express';
import alumnos from './alumnos.json' assert { type: 'json' };

const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send("Server is running");
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

app.get('/alumnos', (req, res) => {

  const { nombre, apellido, nro_alumno, sexo, estado } = req.query;
  let alumnosFiltro = [...alumnos];
    if (nombre) {
        alumnosFiltro = alumnosFiltro.filter(a => a.nombre.toLowerCase().includes(nombre.toLowerCase()));
    }
    if (apellido) {
        alumnosFiltro = alumnosFiltro.filter(a => a.apellido.toLowerCase().includes(apellido.toLowerCase()));
    }
    if (nro_alumno) {
        alumnosFiltro = alumnosFiltro.filter(a => a.nro_alumno === parseInt(nro_alumno));
    }
    if (sexo) {
        alumnosFiltro = alumnosFiltro.filter(a => a.sexo.toLowerCase() === sexo.toLowerCase());
    }
    if (estado) {
        alumnosFiltro = alumnosFiltro.filter(a => a.estado.toLowerCase() === estado.toLowerCase());
    }
    
    return res.status(200).json(alumnosFiltro);
  
});

app.get('/alumnos/:nro_alumno', (req, res) => {
  const nro_alumno = parseInt(req.params.nro_alumno);
  const alumno = alumnos.find(a => a.nro_alumno === nro_alumno);
    if (alumno) {
        return res.status(200).json(alumno);
    } else {
        return res.status(404).json({ error: "Alumno no encontrado" });
    }
});
