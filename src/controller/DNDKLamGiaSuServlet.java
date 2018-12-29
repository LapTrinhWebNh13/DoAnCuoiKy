package controller;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connect.DBConnect;
import dao.DNDKLamGiaSuDAO;
import model.GiaSu;




@WebServlet("/DNDKLamGiaSuServlet")
public class DNDKLamGiaSuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DNDKLamGiaSuDAO dndklamgiasuDAO;
    private GiaSu gs;

    public DNDKLamGiaSuServlet() {
        super();
      
    }


	public void init(ServletConfig config) throws ServletException {
		dndklamgiasuDAO = new DNDKLamGiaSuDAO();
		gs = new GiaSu();
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		String username = request.getParameter("tendangnhap");
		
		System.out.println("Ten cua gs: " + username);
		gs.setHoTen(request.getParameter("name"));
		gs.setNgaySinh(request.getParameter("ngaysinh"));
		gs.setGiongNoi(request.getParameter("giongnoi"));
		gs.setGioiTinh(request.getParameter("gioitinh"));
		gs.setDiaChi(request.getParameter("diachi"));
		gs.setDienThoai(request.getParameter("dienthoai"));
		gs.setEmail(request.getParameter("email"));
		gs.setNganhHoc(request.getParameter("nganhhoc"));
		gs.setTrinhDo(request.getParameter("trinhdo"));
		gs.setNgheNghiep(request.getParameter("nghenghiep"));
		gs.setMonDay(request.getParameter("monday"));
		gs.setLopDay(request.getParameter("lopday"));
		gs.setLuongYauCauToiThieu(Float.parseFloat(request.getParameter("luong")));
		gs.setUuDiem(request.getParameter("uudiem"));
	
			
		try {
				
				dndklamgiasuDAO.suaGiaSu(gs, username);
				response.sendRedirect("DNDKLamGiaSu.jsp");
		} 
			catch (SQLException e) {
				
				e.printStackTrace();
			}	
			
	}

}
