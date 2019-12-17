package dao;

import java.util.List;

import model.Cart;
import model.CartItem;
import model.Category;

public interface CartItemDao {
	void insert(CartItem cartItem);

	void edit(CartItem cartItem);

	void delete(String id);

	CartItem get(String id);

	List<CartItem> getAll();
	public List<CartItem> getByUserID(int id) ;

	List<CartItem> search(String name);
}
