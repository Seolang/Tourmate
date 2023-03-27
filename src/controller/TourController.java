package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.SidoDto;
import dto.TourDto;
import dto.TypeDto;
import service.TourService;

@WebServlet("/tour")
public class TourController extends HttpServlet {
	private final TourService tourService = TourService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		try {
			if ("search".equals(action)) {
				String areaCode = req.getParameter("areaCode");
				String contentTypeId = req.getParameter("contentTypeId");
				String keyword = req.getParameter("keyword");
				
				if (keyword == null) {
					ArrayList<SidoDto> sidoList = tourService.getSido();
					ArrayList<TypeDto> typeList = tourService.getType();
					
					req.getRequestDispatcher("/tourplace/search.jsp").forward(req, resp);
				} else {
					
					try {
						ArrayList<TourDto> tourlist = tourService.searchPlace(areaCode, contentTypeId, keyword);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
	}
}
