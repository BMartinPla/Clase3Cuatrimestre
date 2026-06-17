using System;
using Microsoft.Data.SqlClient;

namespace CargaGeneral;

public class Parameter
{
    int _id;
    string _name;
    string _type;
    int _length;
    int _isoutput;

    public Parameter() {}
    public Parameter(int id, string name, string type, int length, int isoutput)
    {
        _id = id;
        _name = name;
        _type = type;
        _length = length;
        _isoutput = isoutput;
    }

    //dotnet add package Microsoft.Data.SqlClient

    public static List<Parameter> GetParameters(string sproc, SqlConnection conn)
    {
        List<Parameter> pars = new List<Parameter>();
        string sql = """
            SELECT
                convert(int,p.parameter_id), 
                p.name AS ParameterName,
                TYPE_NAME(p.user_type_id) AS DataType,
                convert(int,p.max_length) AS MaxLengthInBytes,
                convert(int, p.is_output) AS IsOutputParameter
            FROM sys.procedures pr
            JOIN sys.parameters p 
              ON pr.object_id = p.object_id
            WHERE pr.name = 
        """;
        sql += $"'{sproc}' order by 1;";
        try
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Parameter par = new Parameter( 
                    reader.GetInt32(0),
                    reader.GetString(1),
                    reader.GetString(2),
                    reader.GetInt32(3),
                    reader.GetInt32(4)
                );
                pars.Add(par);
            }
            reader.Close();
        }
        catch(SqlException sqle)
        {
            Console.WriteLine("Error en Parameter.GetParameters()");
            Console.WriteLine(sqle.Message);
        }
        return pars;
    }

    public override string ToString()
    {
        return $"id: {_id}, name: {_name}, type: {_type}, length: {_length}, isoutput: {_isoutput}";
    }

}