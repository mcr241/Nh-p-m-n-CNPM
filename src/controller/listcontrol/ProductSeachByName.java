package controller.listcontrol;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;
@WebServlet(urlPatterns="/product/search")
public class ProductSeachByName extends PageControl {
	ProductService productService=new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		productList =productService.seachByName(name);
		req.setAttribute("productList", productList);
		super.doGet(req, resp);
		req.getRequestDispatcher("/view/client/view/product-list.jsp").forward(req, resp);
	}
}
