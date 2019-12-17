package service;

import java.util.List;

import model.Manufacturer;

public interface ManuService {
	public Manufacturer get(String name);
	
	public List<Manufacturer> getAll();
}
