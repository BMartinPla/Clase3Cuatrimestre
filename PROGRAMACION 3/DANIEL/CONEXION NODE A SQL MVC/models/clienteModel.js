const { getConnection, sql } = require('../config/db');

// [R] Leer todos
const getAllClientes = async () => {
    const pool = await getConnection();
    const result = await pool.request().query('SELECT * FROM clientes'); 
    return result.recordset;
};

// [R] Leer uno solo por ID
const getClienteById = async (id) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('id', sql.Numeric(6, 0), id) // Coincide con tu [numeric](6, 0)
        .query('SELECT * FROM clientes WHERE cliente = @id');
    return result.recordset[0]; 
};

// [C] Crear nuevo
const createCliente = async (cliente, apellido, nombre, tipo_persona, cuit, dni, telfono, mail, estado) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('cliente', sql.Numeric(6, 0), cliente)
        .input('apellido', sql.Char(60), apellido)
        .input('nombre', sql.Char(30), nombre)
        .input('tipo_persona', sql.Char(3), tipo_persona)
        .input('cuit', sql.Char(13), cuit)
        .input('dni', sql.Char(8), dni)
        .input('telfono', sql.Char(13), telfono) // Respetando el nombre de la BD
        .input('mail', sql.VarChar(80), mail)
        .input('estado', sql.Char(3), estado)
        .query(`
            INSERT INTO clientes 
            (cliente, apellido_razon_social, nombre, tipo_persona, cuit, dni, telfono, mail, estado) 
            VALUES 
            (@cliente, @apellido, @nombre, @tipo_persona, @cuit, @dni, @telfono, @mail, @estado)
        `);
    return result;
};

// [U] Actualizar existente
const updateCliente = async (id, apellido, nombre, tipo_persona, cuit, dni, telfono, mail, estado) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('id', sql.Numeric(6, 0), id)
        .input('apellido', sql.Char(60), apellido)
        .input('nombre', sql.Char(30), nombre)
        .input('tipo_persona', sql.Char(3), tipo_persona)
        .input('cuit', sql.Char(13), cuit)
        .input('dni', sql.Char(8), dni)
        .input('telfono', sql.Char(13), telfono)
        .input('mail', sql.VarChar(80), mail)
        .input('estado', sql.Char(3), estado)
        .query(`
            UPDATE clientes 
            SET apellido_razon_social = @apellido, nombre = @nombre, tipo_persona = @tipo_persona, 
                cuit = @cuit, dni = @dni, telfono = @telfono, mail = @mail, estado = @estado 
            WHERE cliente = @id
        `);
    return result;
};

// [D] Eliminar
const deleteCliente = async (id) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('id', sql.Numeric(6, 0), id)
        .query('DELETE FROM clientes WHERE cliente = @id');
    return result;
};

module.exports = { 
    getAllClientes, getClienteById, createCliente, updateCliente, deleteCliente
};