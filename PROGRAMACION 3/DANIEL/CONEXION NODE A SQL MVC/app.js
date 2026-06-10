const express = require('express');
require('dotenv').config();

// Importamos las rutas
const clienteRoutes = require('./routes/clienteRoutes');
// const productoRoutes = require('./routes/productoRoutes'); // Para cuando lo crees

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Registramos las rutas
app.use('/api', clienteRoutes);
// app.use('/api', productoRoutes); // Para cuando lo crees

app.listen(PORT, () => {
    console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});