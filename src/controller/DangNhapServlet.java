package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.DangNhapDAO;
import model.Lop;
import model.PhuHuynh;
import model.TaiKhoan;


@WebServlet("/DangNhapServlet")
public class DangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DangNhapDAO dnDAO;
	private PhuHuynh phuhuynh;
	private TaiKhoan tk;   
	
	public void init(ServletConfig config) throws ServletException {
		
		dnDAO = new DangNhapDAO();
		phuhuynh = new PhuHuynh();
		tk= new TaiKhoan();
	}

    public DangNhapServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kt = request.getParameter("user");
		System.out.println("kt la: " + kt);
		String username = request.getParameter("TenDN");
		String password = request.getParameter("MatKhau");
		if(kt.equals("ph"))
		{
			if(dnDAO.ktDangNhapPH(username, password))
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("DNDKTimGiaSu.jsp");
				
				
			}
			else
			{
				response.sendRedirect("DangNhap.jsp");
			}
			
		}
		if(kt.equals("gs"))
		{
			if(dnDAO.ktDangNhapGS(username, password))
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("DNDKLamGiaSu.jsp");
			}
			else
			{
				response.sendRedirect("DangNhap.jsp");
			}
		}
		if(kt.equals("admin"))
		{
			if(dnDAO.ktDangNhapAdmin(username, password))
			{
				response.sendRedirect("TrangAdmin.jsp");
			}
			else
			{
				response.sendRedirect("DangNhap.jsp");
			}
			
			
		}
	}

}
