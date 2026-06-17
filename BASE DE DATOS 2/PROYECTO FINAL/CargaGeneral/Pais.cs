using System;
using System.Data;
using Microsoft.Data.SqlClient;

namespace CargaGeneral;

public class Pais
{
    public int _id { get; set; }
    public string _nombre { get; set; }
    public Pais() {}
    public Pais(int  id, string nombre)
    {
        _id = id;
        _nombre = nombre;
    }
    public override string ToString()
    {
        return $"Pais: id: {_id}, nombre: {_nombre}";
    }
    public static void CargarTodos(SqlConnection conn)
    {
        List<string> paises = new List<string> { "Argentina", "Bolivia", "Brasil", "Chile", "Colombia", "Ecuador", "Guyana", "Paraguay", "Perú", "Surinam", "Uruguay", "Venezuela" };
        try
        {
            using (SqlCommand cmd = new SqlCommand("I_Pais", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                foreach(string pais in paises)
                {
                    SqlParameter id = new SqlParameter("@ID", DbType.Int32);
                    id.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(id);
                    SqlParameter nombre = new SqlParameter("@Nombre", SqlDbType.NVarChar, 128);
                    nombre.Value = pais;
                    cmd.Parameters.Add(nombre);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }            
        }
        catch (SqlException sqle)
        {
            Console.WriteLine($"DB Error en Pais.Cargar()");
            Console.WriteLine(sqle.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error en Pais.Cargar()");
            Console.WriteLine(ex.Message);
        }
    }
    public static List<Pais> Buscar(SqlConnection conn, int id = 0, string nombre = null)
    {
        List<Pais> paises = new List<Pais>();
        try
        {
            using (SqlCommand cmd = new SqlCommand("S_Pais", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter pid = new SqlParameter("@id", DbType.Int32);
                pid.Value = ((id == 0) ? null : id);
                cmd.Parameters.Add(pid);
                SqlParameter pnombre = new SqlParameter("@nombre", SqlDbType.NVarChar, 128);
                pnombre.Value = nombre;
                cmd.Parameters.Add(pnombre);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Pais p = new Pais(reader.GetInt32(0), reader.GetString(1));
                        paises.Add(p);
                    }
                }
            }            
        }
        catch (SqlException sqle)
        {
            Console.WriteLine($"DB Error en Pais.Buscar()");
            Console.WriteLine(sqle.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error en Pais.Cargar()");
            Console.WriteLine(ex.Message);
        }
        return paises;
    }
}
