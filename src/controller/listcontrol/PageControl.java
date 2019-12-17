package controller.listcontrol;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import initWeb.WebConfig;
import model.Product;
import tools.Converter;
import tools.SortProduct;

public class PageControl extends HttpServlet {
	List<Product> productList;
	List<Product> allProductList;
	
	public List<Product> goPage(int page){
		int start = (page-1)*WebConfig.NO_OF_THINGS_PER_PAGE;
		int end = page*WebConfig.NO_OF_THINGS_PER_PAGE;
		if(page >= getMaxPage()) {
			return productList.subList(start, getProductList().size());
		}
		else
			return getProductList().subList(start, end);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sort = Converter.getLastValue("sort", req.getParameterMap());
		String interval = Converter.getLastValue("interval", req.getParameterMap());
		
		if(interval != null && !interval.equals("all")) {
			productList = new ProductFilter().inteval(interval,productList);
		}
		
		if(sort != null) {
			new ProductFilter(sort).sort(productList);
		}
		
		String page = req.getParameter("page");
		if(page == null || page.equals("0"))
			page = "1";
		if(page . equals( ""+(getMaxPage()+1)) )
			page = ""+getMaxPage();
		
		List<Product> temp = goPage(Integer.parseInt(page));
		req.setAttribute("productList", temp);
		req.setAttribute("noOfResult", productList.size());
		req.setAttribute("noOfPage", getMaxPage());
		req.setAttribute("page", Integer.parseInt(page));
		
		req.getSession().setAttribute("allProductList", allProductList);
		
		req.setAttribute("servletURL", req.getRequestURI()+Converter.buildUrlFromAttri(req.getParameterMap()));
	}
	
	
	public int getMaxPage() {
		return productList.size()/WebConfig.NO_OF_THINGS_PER_PAGE + 1;
	}
	
	public List<Product> getAllProductList() {
		return allProductList;
	
	}
	
	public List<Product> getProductList() {
		return productList;
	}
}
