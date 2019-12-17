package controller.listcontrol;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import controller.listcontrol.*;
import initWeb.WebConfig;
import model.Category;
import model.Product;
import model.User;
import service.CategoryService;
import service.ProductService;
import service.UserService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;
import service.impl.UserServiceImpl;
import tools.Converter;

@WebServlet(urlPatterns = { "/product/list" })
public class ProductListClientController extends PageControl {
	ProductService productService = new ProductServiceImpl();
	CategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String manu = req.getParameter("manu");
			String cate = req.getParameter("cate");

			if (cate != null && cate.equals("all")) {
				productList = productService.getAll();
			} else if (cate != null && manu != null) {
				productList = productService.searchByCateAndManu(Integer.parseInt(cate), Integer.parseInt(manu));
			} else if (cate != null) {
				productList = productService.seachByCategory(Integer.parseInt(cate));
			} else {
				productList = productService.getAll();
			}

			super.doGet(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/view/product-list.jsp");
		dispatcher.forward(req, resp);
	}

	public static void main(String[] args) {
		System.out.println(new ProductServiceImpl().searchByCateAndManu(1, 1).size());
	}
}
