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


import dao.QuenMatKhauDAO;
import model.Lop;
import model.PhuHuynh;
import model.TaiKhoan;


@WebServlet("/QuenMatKhauServlet")
public class QuenMatKhauServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuenMatKhauDAO dnDAO;
	private PhuHuynh phuhuynh;
	private TaiKhoan tk;   
	
	public void init(ServletConfig config) throws ServletException {
		
		dnDAO = new QuenMatKhauDAO();
		phuhuynh = new PhuHuynh();
		tk= new TaiKhoan();
	}

    public QuenMatKhauServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("UserName");
		String email = request.getParameter("email");
		
			if(dnDAO.ktTaiKhoanPH(username, email))
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("email", email);
				response.sendRedirect("MatKhauMoi.jsp");
			
			}
			else
			{
				response.sendRedirect("DangNhap.jsp");
			}
			
		
		
			if(dnDAO.ktTaiKhoanGS(username, email))
			{
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("password", email);
				response.sendRedirect("MatKhauMoi.jsp");
			}
			else
			{
				response.sendRedirect("DangNhap.jsp");
			}
		
		
	}

}
