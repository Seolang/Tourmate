package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.UserDto;
import util.DBUtil;

public class UserDao {
	private UserDao() {}
	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	
	public static int insert(String userId, String userPw, String userName, String userPhone) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		DBUtil util = new DBUtil();
		
		try {			
			conn = util.getConnection();
			sql = " INSERT INTO USER VALUES(?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			pstmt.setString(3, userName);
			pstmt.setString(4, userPhone);
			
			result = pstmt.executeUpdate();
		}finally {
			util.close(conn, pstmt);
		}
		return result;
	}
	
	public static UserDto selectOne(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		UserDto result = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();
		
		try {
			conn = util.getConnection();
			sql = " SELECT ID, USERNAME FROM USER WHERE ID=? AND PW=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new UserDto();
				result.setId(rs.getString(1));
				result.setId(rs.getString(2));
			}
			
		}finally {
			util.close(rs, conn, pstmt);
		}
		return result;
	}
}
