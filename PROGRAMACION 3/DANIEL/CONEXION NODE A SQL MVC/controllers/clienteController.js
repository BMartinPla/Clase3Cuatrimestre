const clienteModel = require('../models/clienteModel');

const getClientes = async (req, res) => {
    try {
        const clientes = await clienteModel.getAllClientes();
        res.status(200).json(clientes);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener los clientes" });
    }
};

const getCliente = async (req, res) => {
    try {
        const { id } = req.params; // Extraemos el ID de la URL
        const cliente = await clienteModel.getClienteById(id);
        
        if (!cliente) {
            return res.status(404).json({ message: "Cliente no encontrado" });
        }
        res.status(200).json(cliente);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener el cliente" });
    }
};

module.exports = { 
    getClientes,
    getCliente
};