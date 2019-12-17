package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
@WebServlet(urlPatterns="/admin")
public class welcome extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		System.out.println("abc");
		Object obj=session.getAttribute("account");
		User user=(User) obj;
		System.out.println();
		req.setAttribute("username", user.getUsername());
//		req.set
		req.getRequestDispatcher("/view/admin/view/index.jsp").forward(req, resp);
	}

}
