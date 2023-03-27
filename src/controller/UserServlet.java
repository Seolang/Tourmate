package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UserDto;
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
			resp.sendRedirect("error/error.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");
		try {
			if(action.equals("register")) {
				String userId = req.getParameter("userId");
				String userPw = req.getParameter("userPw");
				String userName = req.getParameter("userName");
				String userphone = req.getParameter("userPhone");
				
				int isRegister = uservice.register(userId, userPw, userName, userphone);
				if(isRegister == 1) {
					resp.sendRedirect("user/registerSuccess.jsp");
				}else {
					resp.sendRedirect("error/error.jsp");
				}
			}else if(action.equals("login")) {
				String id = req.getParameter("userId");
				String pw = req.getParameter("userPw");
				UserDto userInfo = uservice.read(id, pw);
				if(userInfo != null) {
					HttpSession session = req.getSession();
					session.setAttribute("userInfo", userInfo);
					resp.sendRedirect("index.jsp");
				}else {
					resp.sendRedirect("error/loginFail.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error/error.jsp");
		}
	}
}
