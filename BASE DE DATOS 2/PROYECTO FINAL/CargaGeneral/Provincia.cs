using System;
using System.Data;
using Microsoft.Data.SqlClient;

namespace CargaGeneral;

public class Provincia
{
    int _id;
    string _nombre;
    Pais _pais;
    public Provincia() {}
    public Provincia(int id, string nombre, Pais pais)
    {
        _id = id;
        _nombre = nombre;
        _pais = pais;
    }
    public override string ToString()
    {
        return $"Provincia: id: {_id}, nombre: {_nombre}, {_pais}";
    }
    public static void Cargar(SqlConnection conn, Pais pais)
    {
        List<string> provincias = new List<string>()
        {
            "Ciudad Autónoma de Buenos Aires"
            ,"Buenos Aires"
            ,"Catamarca"
            ,"Chaco"
            ,"Chubut"
            ,"Córdoba"
            ,"Corrientes"
            ,"Entre Ríos"
            ,"Formosa"
            ,"Jujuy"
            ,"La Pampa"
            ,"La Rioja"
            ,"Mendoza"
            ,"Misiones"
            ,"Neuquén"
            ,"Río Negro"
            ,"Salta"
            ,"San Juan"
            ,"San Luis"
            ,"Santa Cruz"
            ,"Santa Fe"
            ,"Santiago del Estero"
            ,"Tierra del Fuego"
            ,"Tucumán"            
        };

        try
        {
            using (SqlCommand cmd = new SqlCommand("I_Provincia", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                foreach(string pcia in provincias)
                {
                    Console.WriteLine(pcia);
                    SqlParameter pid = new SqlParameter("@id", DbType.Int32);
                    pid.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(pid);
                    SqlParameter pnombre = new SqlParameter("@nombre", SqlDbType.NVarChar, 128);
                    pnombre.Value = pcia;
                    cmd.Parameters.Add(pnombre);
                    SqlParameter paisid = new SqlParameter("@pais_id", DbType.Int32);
                    paisid.Value = pais._id;
                    cmd.Parameters.Add(paisid);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
        }
        catch(SqlException sqle)
        {
            Console.WriteLine($"DB Error en Provincia.Cargar()");
            Console.WriteLine(sqle.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error en Provincia.Cargar()");
            Console.WriteLine(ex.Message);
        }
    }

    public static List<Provincia> Buscar(SqlConnection conn, int? id, string nombre = null, Pais pais = null)
    {
        List<Provincia> provincias = new List<Provincia>();
        try
        {
            using (SqlCommand cmd = new SqlCommand("S_Provincia", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                
                SqlParameter pid = new SqlParameter("@id", DbType.Int32);
                pid.Value = ((id == 0) ? null : id);
                cmd.Parameters.Add(pid);

                SqlParameter pnombre = new SqlParameter("@nombre", SqlDbType.NVarChar, 128);
                pnombre.Value = nombre;
                cmd.Parameters.Add(pnombre);
                
                if (pais != null)
                {
                    SqlParameter paisid = new SqlParameter("@paisid", DbType.Int32);
                    paisid.Value = pais._id;
                    cmd.Parameters.Add(paisid);
                    
                    SqlParameter nombrepais = new SqlParameter("@nombrepais", SqlDbType.NVarChar, 128);
                    paisid.Value = pais._nombre;
                    cmd.Parameters.Add(nombrepais);
                }

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Provincia p = new Provincia(reader.GetInt32(0), reader.GetString(1), new Pais(reader.GetInt32(2), reader.GetString(3)));
                        provincias.Add(p);
                    }
                }
            }            
        }
        catch (SqlException sqle)
        {
            Console.WriteLine($"DB Error en Provincia.Buscar()");
            Console.WriteLine(sqle.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error en Provincia.Buscar()");
            Console.WriteLine(ex.Message);
        }
        return provincias;
    }

}