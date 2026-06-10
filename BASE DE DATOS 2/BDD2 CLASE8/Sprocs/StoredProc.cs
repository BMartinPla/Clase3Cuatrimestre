
using Microsoft.Data.SqlClient;
using System.Data;

namespace Sprocs;


public class StoredProc
{
    SqlConnection? conn;
    public string? Name { get; set; }
    public List<Parametro> Parametros { get; set; }

    public StoredProc(SqlConnection conn, string Name)
    {
        Parametros = new List<Parametro>();
        this.conn = conn;
        this.Name = Name;
        if (conn.State == ConnectionState.Open)
            CargarParametros(); 
        else 
            Console.WriteLine($"Error en StoredProc(): No hay conexion a la base");
    }

    private void CargarParametros()
    {
        string sql = $"""
SELECT sp.name, ty.name, sp.max_length, sp.is_output 
FROM sys.parameters sp  
inner join sys.types ty 
on ty.user_type_id = sp.user_type_id 
WHERE sp.object_id = OBJECT_ID('{this.Name}')
""";

        try
        {
            var command = conn!.CreateCommand();
            command.CommandText = sql;

            using var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var nombre = reader.GetString(0);
                var tipo = reader.GetString(1);
                var largo = reader.GetInt16(2);
                var esoutput = (reader.GetBoolean(3) ? 1 : 0);
                Parametros.Add(new Parametro(nombre, tipo, largo, esoutput));
            }
        }
        catch(Exception ex)
        {
            Console.WriteLine($"Error en StoredProc.CargarParametro: {ex.Message}");
        }
    }
    /*
    public void Ejecutar()
    {
        try
        {
            using (SqlCommand cmd = new SqlCommand(this.Name, this.conn))
        }
    }
    */
}