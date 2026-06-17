using System;
using Microsoft.Data.SqlClient;

namespace CargaGeneral;

public class Program
{
    public static void Main(string[] args)
    {
        List<string> argumentList = new List<string>(args);
        string connectionString = "Server=TSP206\\SQLEXPRESS01;Database=GenericsBMP;" +
        "User Id=UserCreator;Password=UserCreator;Encrypt=False;" + 
        "TrustServerCertificate=True;MultipleActiveResultSets=true;";
        SqlConnection connection;
        try {
            connection = new SqlConnection(connectionString);
            connection.Open();
            Console.WriteLine("Connection successful!");
            
            ListarProcedures(argumentList, connection);
            Pais.CargarTodos(connection);
            Provincia.Cargar(connection, Pais.Buscar(connection, 49, null)[0]);
            foreach(Pais p in Pais.Buscar(connection))
            {
                Console.WriteLine(p);
            }
            foreach(Provincia p in Provincia.Buscar(connection, null, null, new Pais()))
            {
                Console.WriteLine(p);
            }
            Environment.Exit(0);
        }
        catch (SqlException sqle)
        {
            Console.WriteLine($"Database connection error: {sqle.Message}");
            Console.WriteLine("\n--- GRANULAR DETAILS ---");
            Console.WriteLine($"Error Type: {sqle.GetType().Name}"); 
            Console.WriteLine($"Message:    {sqle.Message}");
            Console.WriteLine($"Source:     {sqle.Source}");
            Environment.Exit(200);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error General (pánico total): {ex.Message}");
            Environment.Exit(100);
        }
    }

    private static void ListarProcedures(List<string> procs, SqlConnection conn)
    {
        if (procs.Count > 0)
        {
            foreach(string a in procs)
                Console.WriteLine(Procedure.GetProcedure(a, conn));
        }
        else
        {
            foreach(Procedure p in Procedure.GetProcedures(conn))
            {
                Console.WriteLine(p);
            }
        }
    }
}
