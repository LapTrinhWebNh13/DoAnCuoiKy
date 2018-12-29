package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.DNDKTimGiaSuDAO;
import dao.DangKyTimGiaSuDAO;
import model.PhuHuynh;
import model.Lop;
import model.TaiKhoan;
@WebServlet("/DNDKTimGiaSuServlet")
public class DNDKTimGiaSuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DNDKTimGiaSuDAO dndktimgiasuDAO;
    private PhuHuynh phuhuynh;
	private Lop lop;

	
    public DNDKTimGiaSuServlet() {
        super();
      
    }


	public void init(ServletConfig config) throws ServletException {
		dndktimgiasuDAO = new DNDKTimGiaSuDAO();
		phuhuynh = new PhuHuynh();
		lop =  new Lop();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("tendangnhap");
		phuhuynh.setHoTen(request.getParameter("name"));
		phuhuynh.setDiaChi(request.getParameter("diachi"));
		
		String dc = request.getParameter("diachi");
		System.out.println("Dia chi cua ph: "+dc);
		
		phuhuynh.setDienThoai(request.getParameter("dienthoai"));
		phuhuynh.setEmail(request.getParameter("email"));
		try {
			
			dndktimgiasuDAO.suaPhuHuynh(phuhuynh, username);
			response.sendRedirect("DNDKTimGiaSu.jsp");
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
