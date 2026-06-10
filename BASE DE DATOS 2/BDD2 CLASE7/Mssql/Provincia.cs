using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using Microsoft.Data.SqlClient;

namespace Mssql;

public class Provincia
{
    public int id { get; }
    public string nombre { get; }

    public Provincia(int id, string nombre)
    {
        this.id = id;
        this.nombre = nombre;
    }

    public static List<Provincia> cargar(SqlConnection conn)
    {
        string sql = "SELECT distinct provincia FROM barrios_populares order by 1";
        int provincia_id = 1;
        List<Provincia> provincias = new List<Provincia>();

        var command = conn.CreateCommand();
        command.CommandText = sql;

        using var reader = command.ExecuteReader();
        while (reader.Read())
        {
            var provincia = reader.GetString(0);
            provincias.Add(new Provincia(provincia_id, provincia));
            provincia_id++;
        }
        return provincias;
    }

    public override string ToString()
    {
        return $"Id: {this.id}, nombre: {this.nombre}";
    }

    public string json()
    {
        return $"{{ \"Id\": {this.id}, \"nombre\": \"{this.nombre}\" }}";
    }
    public string json(Provincia p)
    {
        return $"{{ \"Id\": {p.id}, \"nombre\": \"{p.nombre}\" }}";
    }

}