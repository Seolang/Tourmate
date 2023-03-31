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
				result.setUsername(rs.getString(2));
			}
		}finally {
			util.close(rs, conn, pstmt);
		}
		return result;
	}
	
	public static UserDto findPw(String name, String id, String phone) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		UserDto result = null;
		ResultSet rs = null;
		DBUtil util = new DBUtil();
		
		try {
			conn = util.getConnection();
			sql = " SELECT USERNAME, PW FROM USER WHERE USERNAME =? AND ID=? AND PHONE=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new UserDto();
				result.setUsername(rs.getString(1));
				result.setPw(rs.getString(2));
			}
		}finally {
			util.close(rs, conn, pstmt);
		}
		return result;
	}
	
	public static int modify(String id, String nowPw, String changePw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		DBUtil util = new DBUtil();
		
		try {
			conn = util.getConnection();
			sql = " UPDATE USER SET PW=? WHERE ID=? AND PW=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, changePw);
			pstmt.setString(2, id);
			pstmt.setString(3, nowPw);
			
			result = pstmt.executeUpdate();
			
		}finally {
			util.close(conn, pstmt);
		}
		return result;
	}

	public int delete(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int result = 0;
		DBUtil util = new DBUtil();
		
		try {
			conn = util.getConnection();
			sql = " DELETE FROM USER WHERE ID=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
		}finally {
			util.close(conn, pstmt);
		}
		return result;
	}
}
