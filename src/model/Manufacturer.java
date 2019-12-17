package model;

public class Manufacturer {
	private int id;
	private String name;
	
	public Manufacturer() {
		// TODO Auto-generated constructor stub
	}
	

	public Manufacturer(int id) {
		this.id = id;
	}
	public Manufacturer(int id, String name) {
		this(id);
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
