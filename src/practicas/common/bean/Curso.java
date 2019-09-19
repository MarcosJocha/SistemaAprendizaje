package practicas.common.bean;

public class Curso {

	private int idcurso;
	public int getIdcurso() {
		return idcurso;
	}
	public void setIdcurso(int idcurso) {
		this.idcurso = idcurso;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getComentario() {
		return Comentario;
	}
	public void setComentario(String comentario) {
		Comentario = comentario;
	}
	public String getAvance() {
		return Avance;
	}
	public void setAvance(String avance) {
		Avance = avance;
	}
	public int getPromedio() {
		return Promedio;
	}
	public void setPromedio(int promedio) {
		Promedio = promedio;
	}
	public String getNombrealumno() {
		return nombrealumno;
	}
	public void setNombrealumno(String nombrealumno) {
		this.nombrealumno = nombrealumno;
	}
	public String getGrado() {
		return grado;
	}
	public void setGrado(String grado) {
		this.grado = grado;
	}
	private String descripcion;
	private String Comentario;
	private String Avance;
	private int Promedio;
	private String nombrealumno;
	private String grado;
}
