package practicas.common.bean;

public class Evaluacion {

	
	private int idevaluacion;
	public int getCantidadEjercicios() {
		return cantidadEjercicios;
	}
	public void setCantidadEjercicios(int cantidadEjercicios) {
		this.cantidadEjercicios = cantidadEjercicios;
	}
	public int getMayornumIntentos() {
		return MayornumIntentos;
	}
	public void setMayornumIntentos(int mayornumIntentos) {
		MayornumIntentos = mayornumIntentos;
	}
	public double getPromedio() {
		return promedio;
	}
	public void setPromedio(double promedio) {
		this.promedio = promedio;
	}
	public double getAvance() {
		return avance;
	}
	public void setAvance(double avance) {
		this.avance = avance;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	private int cantidadEjercicios;
	private int MayornumIntentos;
	private double promedio;
	private double avance;
	private int estado;
	
	public int getIdevaluacion() {
		return idevaluacion;
	}
	public void setIdevaluacion(int idevaluacion) {
		this.idevaluacion = idevaluacion;
	}
	public int getIdejercicio() {
		return idejercicio;
	}
	public void setIdejercicio(int idejercicio) {
		this.idejercicio = idejercicio;
	}
	public int getIdalumno() {
		return idalumno;
	}
	public void setIdalumno(int idalumno) {
		this.idalumno = idalumno;
	}
	public int getNrointentos() {
		return nrointentos;
	}
	public void setNrointentos(int nrointentos) {
		this.nrointentos = nrointentos;
	}
	public int getNota() {
		return nota;
	}
	public void setNota(int nota) {
		this.nota = nota;
	}
	public int getExitoupdate() {
		return exitoupdate;
	}
	public void setExitoupdate(int exitoupdate) {
		this.exitoupdate = exitoupdate;
	}
	public int getExitoinsert() {
		return exitoinsert;
	}
	public void setExitoinsert(int exitoinsert) {
		this.exitoinsert = exitoinsert;
	}
	private int idejercicio;
	private int idalumno;
	private int nrointentos;
	private int nota;
	private int exitoupdate;
	private int exitoinsert;
	public String getNombrecompleto() {
		return nombrecompleto;
	}
	public void setNombrecompleto(String nombrecompleto) {
		this.nombrecompleto = nombrecompleto;
	}
	private String nombrecompleto;
	private String curso;
	public String getIdpersona() {
		return idpersona;
	}
	public void setIdpersona(String idpersona) {
		this.idpersona = idpersona;
	}
	private String idpersona;
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	public String getEjercicio() {
		return ejercicio;
	}
	public void setEjercicio(String ejercicio) {
		this.ejercicio = ejercicio;
	}
	public String getTema() {
		return tema;
	}
	public void setTema(String tema) {
		this.tema = tema;
	}
	public String getFecha_evaluacion() {
		return fecha_evaluacion;
	}
	public void setFecha_evaluacion(String fecha_evaluacion) {
		this.fecha_evaluacion = fecha_evaluacion;
	}
	private String ejercicio;
	private String tema;
	private String fecha_evaluacion;
	
}
