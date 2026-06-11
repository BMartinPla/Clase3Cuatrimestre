const express = require('express');
const router = express.Router();
const clienteController = require('../controllers/clienteController');

// Rutas genéricas
router.get('/clientes', clienteController.getClientes);        
router.post('/clientes', clienteController.createCliente);     

// Rutas específicas por ID
router.get('/clientes/:id', clienteController.getCliente);     
router.put('/clientes/:id', clienteController.updateCliente);  // <- Esta es la línea que Express no está encontrando
router.delete('/clientes/:id', clienteController.deleteCliente); 

module.exports = router;