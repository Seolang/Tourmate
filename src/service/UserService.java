package service;

import dao.UserDao;

public class UserService {
	private UserService() {}
	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	
	UserDao udao = UserDao.getInstance();
	
	public static int register(String id, String pw, String name, String phone) {
		return udao.register(id, pw, name, phone);
	}
}
