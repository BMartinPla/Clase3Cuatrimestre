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
        const { id } = req.params;
        const cliente = await clienteModel.getClienteById(id);
        
        if (!cliente) return res.status(404).json({ message: "Cliente no encontrado" });
        res.status(200).json(cliente);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener el cliente" });
    }
};

const createCliente = async (req, res) => {
    try {
        // Extraemos todos los campos reales
        const { cliente, apellido_razon_social, nombre, tipo_persona, cuit, dni, telfono, mail, estado } = req.body;
        
        // El ID (cliente) y otros campos son NOT NULL en tu BD, así que validamos que existan
        if(!cliente || !apellido_razon_social || !tipo_persona || !estado) {
            return res.status(400).json({ message: "Los campos: cliente, apellido_razon_social, tipo_persona y estado son OBLIGATORIOS." });
        }

        await clienteModel.createCliente(cliente, apellido_razon_social, nombre, tipo_persona, cuit, dni, telfono, mail, estado);
        res.status(201).json({ message: "Cliente creado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al crear el cliente" });
    }
};

const updateCliente = async (req, res) => {
    try {
        const { id } = req.params;
        const { apellido_razon_social, nombre, tipo_persona, cuit, dni, telfono, mail, estado } = req.body;

        await clienteModel.updateCliente(id, apellido_razon_social, nombre, tipo_persona, cuit, dni, telfono, mail, estado);
        res.status(200).json({ message: "Cliente actualizado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al actualizar el cliente" });
    }
};

const deleteCliente = async (req, res) => {
    try {
        const { id } = req.params;
        await clienteModel.deleteCliente(id);
        res.status(200).json({ message: "Cliente eliminado exitosamente" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al eliminar el cliente" });
    }
};

module.exports = { 
    getClientes, getCliente, createCliente, updateCliente, deleteCliente
};