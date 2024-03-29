package dao;

import java.util.List;

import model.Category;
import model.Manufacturer;

public interface CategoryDao {
	void insert(Category category);

	void edit(Category category);

	void delete(int id);

	Category get(int id);
	
	Category get(String name);

	List<Category> getAll();

	List<Category> search(String username);
	
//	List<Manufacturer>  
}
