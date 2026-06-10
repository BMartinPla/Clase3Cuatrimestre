namespace Sprocs;

public class Parametro {
	public string Nombre { get; set; }
	public string Tipo { get; set; }
	public int Largo { get; set; }
	public int EsOutput { get; set; }


	public Parametro(string Nombre, string Tipo, int Largo, int EsOutput)
	{
		this.Nombre = Nombre;
		this.Tipo = Tipo;
		this.Largo = Largo;
		this.EsOutput = EsOutput;
	 }

	public override string ToString() {
		string esoutput = (this.EsOutput == 1) ? "Si" : "No";
		return $"{this.Nombre} {this.Tipo}({this.Largo}) Es de salida? {esoutput}";
	}
}
	
