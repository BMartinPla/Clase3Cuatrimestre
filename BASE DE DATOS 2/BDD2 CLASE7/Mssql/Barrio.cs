using System;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.InteropServices;
using Microsoft.Data.SqlClient;

namespace Mssql;

public class Barrio
{
    int? id_renabap { get; set; } 
    string? nombre_barrio { get; set; } 
    string? provincia { get; set; } 
    string? departamento { get; set; }
    string? localidad { get; set; } 
    int? cantidad_viviendas_aproximadas { get; set; } 
    int? cantidad_familias_aproximada { get; set; } 
    string? decada_de_creacion { get; set; }
    int? anio_de_creacion { get; set; } 
    string? energia_electrica { get; set; } 
    string? efluentes_cloacales { get; set; } 
    string? agua_corriente { get; set; }
    string? cocina { get; set; } 
    string? calefaccion { get; set; } 
    string? titulo_propiedad { get; set; } 
    string? clasificacion_barrio { get; set; }
    int? superficie_m2 { get; set; }
   
    public Barrio() {}

    static List<String> CargarColumnas(SqlConnection conn)
    {
        string sql = "select column_name from INFORMATION_SCHEMA.Columns where table_name = 'barrios_populares'";
        List<String> columnas = new List<string>();

        var command = conn.CreateCommand();
        command.CommandText = sql;

        using var reader = command.ExecuteReader();
        while (reader.Read())
        {
            var columna = reader.GetString(0);
            columnas.Add(columna);
        }
        reader.Close();
        
        return columnas;
    }
    
    public static List<Barrio> cargar(SqlConnection conn)
    {
        List<Barrio> barrios = new List<Barrio>();
        List<string> columnas = CargarColumnas(conn);
        string sql ="select * from barrios_populares";

        var command = conn.CreateCommand();
        command.CommandText = sql;

        using var reader = command.ExecuteReader();
        while (reader.Read())
        {
            Barrio b = new Barrio();
            foreach(var col in columnas)
            {
                var columna = reader[col];
                columna = (columna == DBNull.Value) ? null : columna;
                typeof(Barrio).GetProperty(col, BindingFlags.NonPublic|BindingFlags.Instance)?.SetValue(b, columna);
            }
            barrios.Add(b);
        }
        reader.Close();

        return barrios;
    }

    public string json()
    {
        Type type = this.GetType();
        PropertyInfo[] props = type.GetProperties(BindingFlags.NonPublic|BindingFlags.Instance);

        string s = "{";
        int cnt = 0;
        foreach(PropertyInfo p in props)
        {
            if (cnt == 0) {
                s += $"\"{p.Name}\": \"{p.GetValue(this)}\"";
                cnt = 1;                    
            }
            else
            {
                s += $", \"{p.Name}\": \"{p.GetValue(this)}\"";
            }
        }
        s += "}";
        return s;
    }
}