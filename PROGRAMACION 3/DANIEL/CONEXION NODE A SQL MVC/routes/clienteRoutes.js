const express = require('express');
const router = express.Router();
const clienteController = require('../controllers/clienteController');

router.get('/clientes', clienteController.getClientes);
router.get('/clientes/:id', clienteController.getCliente); // Ruta con parámetro dinámico

module.exports = router;