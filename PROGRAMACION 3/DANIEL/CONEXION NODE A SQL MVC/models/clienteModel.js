const { getConnection } = require('../config/db');

const getAllClientes = async () => {
    const pool = await getConnection();
    const result = await pool.request().query('SELECT * FROM dbo.clientes'); 
    return result.recordset;
};

// Ejemplo si quisieras buscar un cliente por ID
const getClienteById = async (id) => {
    const pool = await getConnection();
    const result = await pool.request()
        .input('id', id) // Esto evita inyecciones SQL
        .query('SELECT * FROM dbo.clientes WHERE cliente = @id'); // Ajusta "id_cliente" al nombre real de tu columna
    return result.recordset[0]; 
};

module.exports = { 
    getAllClientes,
    getClienteById
};