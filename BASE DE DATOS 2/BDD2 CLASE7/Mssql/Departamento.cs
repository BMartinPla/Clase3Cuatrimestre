using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using Microsoft.Data.SqlClient;


namespace Mssql;

public class Departamento
{
    public int id { get; }
    public int provincia_id { get; }
    public string nombre { get; }

    public Departamento(int id, int provincia_id, string nombre)
    {
        this.id = id;
        this.provincia_id = provincia_id;
        this.nombre = nombre;
    }

    public static List<Departamento> cargar(SqlConnection conn)
    {
        int id = 1;
        string provincia = "";
        int provincia_id = 0;
        string sql = $"Select distinct provincia, departamento " +
        "from barrios_populares order by provincia, departamento";
        List<Departamento> departamentos = new List<Departamento>();

        var command = conn.CreateCommand();
        command.CommandText = sql;

        using var reader = command.ExecuteReader();
        while (reader.Read())
        {
            if (provincia != reader.GetString(0))
            {
                provincia = reader.GetString(0);
                ++provincia_id;
            }
            
            var departamento = reader.GetString(1);
            departamentos.Add(new Departamento(id, provincia_id, departamento));
            id++;
        }
        return departamentos;            
    }

    public override string ToString()
    {
        return $"Id: {this.id}, provincia_id: {this.provincia_id}, nombre: {this.nombre}";
    }

    public string json()
    {
        return $"{{ \"Id\": {this.id}, \"provincia_id\": {this.provincia_id}, \"nombre\": \"{this.nombre}\"}}";
    }

}
