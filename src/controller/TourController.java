package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.SidoDto;
import dto.TourDto;
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
				
				HttpSession session = req.getSession();
				ArrayList<SidoDto> sidoList = (ArrayList<SidoDto>) session.getAttribute("sidoList");
				
				if (sidoList == null) {
					 sidoList = tourService.getSido();
					session.setAttribute("sidoList", sidoList);
				}
				
				if (keyword != null) {
					ArrayList<TourDto> tourList = tourService.searchPlace(areaCode, contentTypeId, keyword);
					req.setAttribute("tourList", tourList);
					req.setAttribute("areaCode", areaCode);
					req.setAttribute("contentTypeId", contentTypeId);
					req.setAttribute("keyword", keyword);
				}
				req.getRequestDispatcher("/tourplace/search.jsp").forward(req, resp);
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
