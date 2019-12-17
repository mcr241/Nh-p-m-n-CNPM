package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import initWeb.WebConfig;

@WebServlet(urlPatterns = "/image") // ?fname=abc.png
public class DownloadImageController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = req.getParameter("fname");
		File file = null;

		File file1 = new File(WebConfig.DEFAULT_IMAGE_PATH + "/" + fileName + ".png");
		File file2 = new File(WebConfig.DEFAULT_IMAGE_PATH + "/" + fileName + ".jpg");
		File file3 = new File(WebConfig.DEFAULT_IMAGE_PATH + "/" + fileName);

		if (file1.exists()) {
			file = file1;
		}

		if (file2.exists()) {
			file = file2;
		}
		if (file3.exists()) {
			file = file3;
		}

		resp.setContentType("image/jpeg");

		if (file != null && file.exists()) {
			IOUtils.copy(new FileInputStream(file), resp.getOutputStream());
		}
	}
}
