package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SidoDto;
import dto.TourDto;
import util.DBUtil;

public class TourDao {
	private final DBUtil util = DBUtil.getInstance();
	
	private final static TourDao instance = new TourDao();
	private TourDao() {};
	
	public static TourDao getInstance() {
		return instance;
	}

	public ArrayList<TourDto> selectPlace(String areaCode, String contentTypeId, String keyword) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TourDto> list = new ArrayList<>();
		String sql = " SELECT  " + 
					"FROM ";
		
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			
		} finally {
			util.close(rs, pstmt, conn);
		}
		
		return list;
	}

	public ArrayList<SidoDto> selectSido() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SidoDto> list = new ArrayList<>();
		String sql = " SELECT SIDO_CODE, SIDO_NAME " + 
					" FROM SIDO ";
		
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SidoDto s = new SidoDto();
				s.setCode(rs.getInt(1));
				s.setName(rs.getString(2));
				
				list.add(s);
			}
			
		} finally {
			util.close(rs, pstmt, conn);
		}
		
		
		return list;
	}
}
