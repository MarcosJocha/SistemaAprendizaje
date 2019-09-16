package practicas.common.bean;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;


public enum Rol {

	ADMINISTRADORES(1),
	ALUMNOS(2),
	PROFESORES(3),
	DESARROLLADORES(4);
	
	
	private final int id;


	private static final Map<Integer, Rol> lookup = new HashMap<Integer, Rol>();
    
	static {
        for(Rol s : EnumSet.allOf(Rol.class))
             lookup.put(s.getId(), s);
    	}
	    
	    
	private Rol(int id) {
		this.id = id;
	}
	    
	public int getId() {
		return this.id;
	}
   
	public static Rol get(int id) { 
		return lookup.get(id); 
	}
	
}
