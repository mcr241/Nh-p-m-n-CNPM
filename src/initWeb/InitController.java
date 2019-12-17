package initWeb;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;

@WebServlet(name="InitController", urlPatterns= "/index")
public class InitController extends HttpServlet{
	ProductService productService = new ProductServiceImpl();
	CategoryService cateService = new CategoryServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("category", new CategoryServiceImpl().getAll());
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/view/index.jsp");
		
		req.setAttribute("phoneList", listProduct(1, 10));
		req.setAttribute("laptopList", listProduct(2, 10));
		req.setAttribute("tvList", listProduct(3, 10));
		req.setAttribute("watchList", listProduct(4, 10));
		
		dispatcher.forward(req, resp);
	}
	
	public List<Product> listProduct(int cate_id, int noOfProduct) {
		List<Product> products = productService.seachByCategory(cate_id);
		if(noOfProduct<products.size()) {
			return products.subList(0, noOfProduct);
		}
		return products;
	}
	
	
	

}
