package service.impl;

import java.util.List;

import dao.impl.ManuDaoImpl;
import model.Category;
import model.Manufacturer;
import service.ManuService;

public class ManuServiceImpl implements ManuService {
	ManuDaoImpl manuDao = new ManuDaoImpl();
	public Manufacturer get(String name) {
		return manuDao.get(name);
	}
	@Override
	public List<Manufacturer> getAll() {
		return manuDao.getAll();
	}
	
	public static void main(String[] args) {
		System.out.println(new ManuServiceImpl().getAll().size());
	}
}
