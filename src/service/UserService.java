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
	
	public static int register(String id, String pw, String name, String phone) throws SQLException {
		return udao.insert(id, pw, name, phone);
	}
	
	public static UserDto read(String id, String pw) throws SQLException {
		return udao.selectOne(id, pw);
	}
}
