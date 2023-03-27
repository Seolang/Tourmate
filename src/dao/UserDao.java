package dao;

public class UserDao {
	private UserDao() {}
	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	
	public static int register(String id, String pw, String name, String phone) {
		
	}
}
