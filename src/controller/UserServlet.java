package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

	UserService uservice = UserService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		try {
			if(action.equals("logout")) {
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		try {
			if(action.equals("register")) {
				String id = req.getParameter("userId");
				String pw = req.getParameter("userPw");
				String name = req.getParameter("userName");
				String phone = req.getParameter("userPhone");
				int isRegister = uservice.register(id, pw, name, phone);
			}else if(action.equals("login")) {
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
