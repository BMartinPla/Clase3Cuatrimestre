using Microsoft.Data.Sqlite;

namespace CSharp;

public class Program {
    public static void Main(string[] args)
    {
        // 1. Define your database file name
        string connectionString = "Data Source=Usuarios.db;Mode=ReadWriteCreate;";
        SqliteConnection? conn;
        List<string> nombres = new List<string> { "Ana", "Patricia", "Dolores", "Marcela", "Graciela"};
        string comando = "Listar";

        if (args.Length == 1)
            comando = args[0];

        foreach(string arg in args) 
            Console.WriteLine(arg);
        try
        {
            // 2. Open the connection (this instantly creates MyDatabase.db if missing)
            conn = new SqliteConnection(connectionString);
            conn.Open();

            Usuario usuario = new Usuario(conn);
            usuario.CrearTabla();

            if (comando.Equals("Insertar"))
            {
                foreach (string nombre in nombres)
                {
                    usuario.Nombre = nombre;
                    usuario.Email = $"{nombre.ToLower()}@ladies.net";
                    usuario.Password ="abc123";
                    usuario.Insertar();
                }
            }
            
            foreach(Usuario x in Usuario.Todos(conn))
                Console.WriteLine(x);
        }
        catch (Exception e)
        {
            Console.WriteLine($"Error connecting to:\n{connectionString}\n{e.Message} ");
            Environment.Exit(1);
        }
        Environment.Exit(0);
    }
}
