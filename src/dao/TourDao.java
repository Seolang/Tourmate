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
		String sql = " SELECT first_image, title, addr1, addr2, latitude, longitude " + 
					" FROM ATTRACTION_INFO " +
					" WHERE SIDO_CODE = ? AND CONTENT_TYPE_ID = ? AND TITLE LIKE ? ";
		
		try {
			conn = util.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(areaCode));
			pstmt.setInt(2, Integer.parseInt(contentTypeId));
			pstmt.setString(3, ("'%"+keyword+"%'"));
			System.out.println(areaCode + " " + contentTypeId + " " + keyword);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TourDto dto = new TourDto();
				dto.setImageURL(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setAddr1(rs.getString(3));
				dto.setAddr2(rs.getString(4));
				dto.setLatitude(rs.getDouble(5));
				dto.setLongitude(rs.getDouble(6));
				
				list.add(dto);
			}
			
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
