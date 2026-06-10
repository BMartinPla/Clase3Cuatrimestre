using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using Microsoft.Data.SqlClient;


namespace Mssql;

public class Program {
    public static void Main(string[] args)
    {
        string connectionString = @"Server=TSP206\SQLEXPRESS01;Database=Barrios;User Id=UserCreator;Password=UserCreator;TrustServerCertificate=True;";

        try 
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("✅ Successfully connected to SQL Server in Podman!");
                ListarProvincias(connection);
                ListarDepartamentos(connection, 11);
                ListarBarrios(connection);

            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"❌ Connection failed: {ex.Message}");
        }
    }

    private static void ListarProvincias(SqlConnection conn)
    {
        List<Provincia> provincias = Provincia.cargar(conn);
        foreach (Provincia p in provincias) 
            Console.WriteLine(p.ToString());   
    }

    private static void ListarDepartamentos(SqlConnection conn, int provincia_id)
    {
        List<Departamento> dtos = Departamento.cargar(conn).FindAll(x => x.provincia_id == provincia_id);
        foreach(Departamento d in dtos)
        {
            Console.WriteLine(d.json());
        }    
    }

    private static void ListarBarrios(SqlConnection conn)
    {
        List<Barrio> barrios = Barrio.cargar(conn);
        int cnt = 0;
        using StreamWriter writer = new StreamWriter("Barrios.json");
        foreach (Barrio b in barrios)
        {
            if (cnt == 0)
            {
                writer.WriteLine($"[ {b.json()}");
                cnt = 1;
            }
            else
            {
                writer.WriteLine($", {b.json()}");

            }
        }
        writer.WriteLine("]");
    }


}
