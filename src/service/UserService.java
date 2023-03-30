package service;

import java.sql.SQLException;

import dao.UserDao;
import dto.UserDto;

public class UserService {
	private UserService() {}
	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	
	static UserDao udao = UserDao.getInstance();
	
	public static int register(String userId, String userPw, String userName, String userPhone) throws SQLException {
		return udao.insert(userId, userPw, userName, userPhone);
	}
	
	public static UserDto read(String id, String pw) throws SQLException {
		return udao.selectOne(id, pw);
	}
	
	public static UserDto findpw(String name, String id, String phone) throws SQLException {
		return udao.findPw(name, id, phone);
	}
	
	public static int changePw(String id, String nowPw, String changePw) throws SQLException {
		return udao.modify(id, nowPw, changePw);
	}
}
