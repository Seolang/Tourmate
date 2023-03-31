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
			if(action.equals("login")) {
				resp.sendRedirect("user/login.jsp");
			} else if(action.equals("register")) {
				resp.sendRedirect("user/regist.jsp");
			} else if(action.equals("logout")) {
				HttpSession session = req.getSession();
				session.invalidate();
				resp.sendRedirect(req.getContextPath());
			}else if(action.equals("findpwd")) {
				resp.sendRedirect("user/findpwd.jsp");
			}else if(action.equals("mypage")) {
				resp.sendRedirect("user/myPage.jsp");
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
			}else if(action.equals("findpw")) {
				String name = req.getParameter("userName");
				String id = req.getParameter("userId");
				String phone = req.getParameter("userPhone");
				
				UserDto userPwInfo = uservice.findpw(name, id, phone);
				req.setAttribute("userPwInfo", userPwInfo);
				req.getRequestDispatcher("user/findPwdSuccess.jsp").forward(req, resp);
			}else if(action.equals("modify")) {
				String id = req.getParameter("userId");
				String nowPw = req.getParameter("nowPw");
				String changePw = req.getParameter("changePw");
				String changePwCheck = req.getParameter("changePwCheck");
				if(!changePw.equals(changePwCheck)) {
					resp.sendRedirect("error/notEqPw.jsp");
				}else {
					int isChange = uservice.changePw(id, nowPw, changePw);
					if(isChange == 1) {
						resp.sendRedirect("user/changePwSuccess.jsp");
					}else {
						resp.sendRedirect("error/chagePwFail.jsp");
					}
				}
			}else if(action.equals("delete")) {
				HttpSession session = req.getSession();
				UserDto dto = (UserDto) session.getAttribute("userInfo");
				int result = uservice.deleteUser(dto.getId());
				if (result == 1) {
					session.invalidate();
					resp.sendRedirect("user/deleteUserSuccess.jsp");
				} else {
					resp.sendRedirect("error/deleUserFail.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("error/error.jsp");
		}
	}
}
