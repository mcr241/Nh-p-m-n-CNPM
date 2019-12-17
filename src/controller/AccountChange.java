package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.User;
import service.CartItemService;
import service.UserService;
import service.impl.CartServiceItemImpl;
import service.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/member/changeinfor" })
public class AccountChange extends HttpServlet {
	UserService userService = new UserServiceImpl();
	CartItemService cartItemService = new CartServiceItemImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/view/changeinfor.jsp");
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("account");
		User buyer = (User) obj;
		req.setAttribute("cartItemList", cartItemService.getByUserID(buyer.getId()));

		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			User user = (User) req.getSession().getAttribute("account");
			String pass = req.getParameter("password");
			String old = req.getParameter("oldpassword");
			if (old != null && old.equals(user.getPassword())) {
				if (old.length() >= 3) {
					user.setPassword(pass);
					req.setAttribute("alert", "Thay đổi mật khẩu thành công");
					userService.edit(user);
					HttpSession session = req.getSession(true);
					session.setAttribute("account", user);
				}
				else {
					String alertMsg = "Mật khẩu phải lớn hơn 5 kí tự";
					req.setAttribute("alert", alertMsg);
				}
			} else {
				String alertMsg = "Mật khẩu cũ không chính xác";
				req.setAttribute("alert", alertMsg);
			}
			req.getRequestDispatcher("/view/client/view/changeinfor.jsp").forward(req, resp);

			// resp.sendRedirect(req.getContextPath() + "/index");
		} catch (Exception e) {
			e.printStackTrace();
			// resp.sendRedirect(req.getContextPath() + "/index");
		}
	}
}
