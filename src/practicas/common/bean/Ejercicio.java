package practicas.common.bean;

public class Ejercicio {

	private int idejercicio;
	public int getIdejercicio() {
		return idejercicio;
	}
	public void setIdejercicio(int idejercicio) {
		this.idejercicio = idejercicio;
	}
	public int getIdcurso() {
		return idcurso;
	}
	public void setIdcurso(int idcurso) {
		this.idcurso = idcurso;
	}
	public int getIdgrado() {
		return idgrado;
	}
	public void setIdgrado(int idgrado) {
		this.idgrado = idgrado;
	}
	public int getIdtema() {
		return idtema;
	}
	public void setIdtema(int idtema) {
		this.idtema = idtema;
	}
	public int getPuntajetotal() {
		return puntajetotal;
	}
	public void setPuntajetotal(int puntajetotal) {
		this.puntajetotal = puntajetotal;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getNamejsp() {
		return namejsp;
	}
	public void setNamejsp(String namejsp) {
		this.namejsp = namejsp;
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
	private int idcurso;
	private int idgrado;
	private int idtema;
	private int puntajetotal;
	private String descripcion;
	private String namejsp;
	private int exitoupdate;
	private int exitoinsert;
}
