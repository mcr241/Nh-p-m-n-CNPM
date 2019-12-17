package service;

import java.util.List;

import model.Cart;
import model.CartItem;

public interface CartItemService {
	void insert(CartItem cartItem);

	void edit(CartItem cartItem);

	void delete(String id);

	CartItem get(String id);
	
	List<CartItem> getAll();

	List<CartItem> search(String keyword);
	
	public List<CartItem> getByUserID(int id);
}
