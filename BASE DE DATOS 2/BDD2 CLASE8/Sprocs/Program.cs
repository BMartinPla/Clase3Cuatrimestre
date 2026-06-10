using Microsoft.Data.SqlClient;

namespace Sprocs;

// dotnet add package Microsoft.Data.SqlClient

public class Program
{
    public static void Main(string[] args)
    {
        string connectionString = "Server=localhost,1433;Database=Barrios2;User Id=sa;Password=Soler225!;TrustServerCertificate=True;";

        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("✅ Successfully connected to SQL Server!");

                Base db = new Base(connection);
                foreach (string sproc in db.sprocs!)
                {
                    Console.WriteLine($"{Environment.NewLine}Stored Procedure: {sproc}");
                    StoredProc sp = new StoredProc(connection, sproc);
                    foreach (Parametro p in sp.Parametros)
                        Console.WriteLine($"\t{p.ToString()}");
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"❌ Connection failed: {ex.Message}");
        }
    }
}
