using Microsoft.Data.SqlClient;
using System.Data;

namespace Sprocs;

public class Base
{
    SqlConnection ?conn;
    public List<String> ?sprocs { get; set; }

    public Base(SqlConnection conn)
    {
        sprocs = new List<string>();
        this.conn = conn;
        if (conn.State == ConnectionState.Open)
            CargarStoredProcs();
        else   
            Console.WriteLine($"Error en Base: No hay conexion a la DB");
    }

    private void CargarStoredProcs()
    {
        string sql = "SELECT name, type FROM dbo.sysobjects WHERE (type = 'P')";
        try
        {
            var command = conn!.CreateCommand();
            command.CommandText = sql;

            using var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var nombre = reader.GetString(0);
                var tipo = reader.GetString(1);
                sprocs!.Add(nombre);
            }
        }
        catch(Exception ex)
        {
            Console.WriteLine($"Error en Base.StoredProcs: {ex.Message}");
        }
    }
}