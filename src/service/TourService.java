package service;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.TourDao;
import dto.SidoDto;
import dto.TourDto;
import dto.TypeDto;

public class TourService {
	private final TourDao tourDao = TourDao.getInstance();
	
	private final static TourService instance = new TourService();
	private TourService() {};
	
	public static TourService getInstance() {
		return instance;
	}

	public ArrayList<TourDto> searchPlace(String areaCode, String contentTypeId, String keyword) throws SQLException {
		
		return tourDao.selectPlace(areaCode,contentTypeId, keyword);
	}

	public ArrayList<SidoDto> getSido() throws SQLException {
		return tourDao.selectSido();
	}

	public ArrayList<TypeDto> getType() {
		// TODO Auto-generated method stub
		return null;
	}
}
