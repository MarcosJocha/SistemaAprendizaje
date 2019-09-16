package practicas.common.bean;

public class Profesor {

	
	private int idProfesor;
	private int disponibilidad;
	public int getDisponibilidad() {
		return disponibilidad;
	}
	public void setDisponibilidad(int disponibilidad) {
		this.disponibilidad = disponibilidad;
	}
	public int getPracticasAsignadas() {
		return practicasAsignadas;
	}
	public void setPracticasAsignadas(int practicasAsignadas) {
		this.practicasAsignadas = practicasAsignadas;
	}
	private int practicasAsignadas;
	public int getIdProfesor() {
		return idProfesor;
	}
	public void setIdProfesor(int idProfesor) {
		this.idProfesor = idProfesor;
	}
	public int getCodigoProfesor() {
		return codigoProfesor;
	}
	public void setCodigoProfesor(int codigoProfesor) {
		this.codigoProfesor = codigoProfesor;
	}
	public int getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(int idPersona) {
		this.idPersona = idPersona;
	}
	private int codigoProfesor;
	private int idPersona;
	public int getIdEspecialidad() {
		return idEspecialidad;
	}
	public void setIdEspecialidad(int idEspecialidad) {
		this.idEspecialidad = idEspecialidad;
	}
	private int idEspecialidad;
	
	private Persona persona;
	public Persona getPersona() {
		return persona;
	}
	public void setPersona(Persona persona) {
		this.persona = persona;
	}
	
}
