using Microsoft.Data.Sqlite;
using System.Collections.Generic;
using System.Text.Json;
using Barrios;

namespace Barrios;

class Program
{
    static void Main(string[] args)
    {
        string db = @"C:\Users\braian.pla\Desktop\BASE DE DATOS 2\BDD2 CLASE5\Barrios\Barrios.db";
        using (var connection = new SqliteConnection($"Data Source={db}"))
        {
            connection.Open();

            ListarProvincias(connection);
            //ListarDepartamentos(connection, 11);
            //ListarBarrios(connection));
        }
        //connection.Close();

        Console.ReadKey();
    }

    private static void ListarProvincias(SqliteConnection conn)
    {
        List<Provincia> provincias = Provincia.cargar(conn);
        foreach (Provincia p in provincias)
            Console.WriteLine(p.json());

    }

}

