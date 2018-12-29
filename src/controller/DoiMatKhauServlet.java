package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DoiMatKhauDAO;
import model.TaiKhoan;


@WebServlet("/DoiMatKhauServlet")
public class DoiMatKhauServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DoiMatKhauDAO doimkDAO;
    private TaiKhoan taikhoan;
   
    public DoiMatKhauServlet() {
        super();
       
    }


	public void init(ServletConfig config) throws ServletException {
		doimkDAO = new DoiMatKhauDAO();
		taikhoan = new TaiKhoan();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("username");
		System.out.println("username ben doi mk: "+username);
		
		String mkcu = request.getParameter("mkcu");
		
		String mknhaplai = request.getParameter("mknhaplai");
		System.out.println("mknhaplai ben doi mk: "+mknhaplai);
		
		String mkmoi = request.getParameter("mkmoi");
		System.out.println("mkmoi ben doi mk: "+mkmoi);
		taikhoan.setMatKhau(request.getParameter("mkmoi"));

		try {
			
			if(mkmoi.equals(mknhaplai))
			{
				
				if(doimkDAO.suaMatKhau(taikhoan, username))
				{
					System.out.println("Doi mat khau thanh cong! ");
					response.sendRedirect("DangNhap.jsp");
				}
				
				else
				{
					System.out.println("Doi mat khau khong thanh cong! ");
					response.sendRedirect("DoiMatKhau.jsp");
				}
			}
			else
			{
				System.out.println("Doi mat khau khong thanh cong! ");
				response.sendRedirect("DoiMatKhau.jsp");
			}
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

}
