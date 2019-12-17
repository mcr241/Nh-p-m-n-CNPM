package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.CartItem;
import model.Product;
import model.User;
import service.CartItemService;
import service.CartService;
import service.ProductService;
import service.UserService;
import service.impl.CartServiceImpl;
import service.impl.CartServiceItemImpl;
import service.impl.ProductServiceImpl;
import service.impl.UserServiceImpl;
import tools.SendMail;
import util.RandomUUID;

@WebServlet(urlPatterns = "/member/order")
public class OrderController extends HttpServlet {
	UserService userService = new UserServiceImpl();
	CartService cartService = new CartServiceImpl();
	CartItemService cartItemService = new CartServiceItemImpl();
	ProductService productService = new ProductServiceImpl();
	long time = System.currentTimeMillis();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("account");
		User buyer = (User) obj;
		Cart cart = new Cart();
		cart.setBuyer(buyer);
		cart.setBuyDate(new java.sql.Date(time));
		cart.setId(RandomUUID.getRandomID());
		
		cartService.insert(cart);

		Object objCart = session.getAttribute("cart");
		
		if (objCart != null) {
			
			Map<Integer, CartItem> map = (Map<Integer, CartItem>) objCart;
			
			for (CartItem cartItem : map.values()) {
				cartItem.setCart(cart);
				cartItem.setId(RandomUUID.getRandomID());
				Product product = productService.get(cartItem.getProduct().getId());
				product.setQuantity(product.getQuantity()-cartItem.getQuantity());
				productService.edit(product);
				cartItemService.insert(cartItem);
			}

		}
		session.removeAttribute("cart");
		System.out.println(req.getContextPath());
		
		RequestDispatcher next = req.getServletContext().getRequestDispatcher("/view/client/view/success-order.jsp");
		next.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
