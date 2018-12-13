package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PhuHuynhDAOImpl;
import model.PhuHuynh;


@WebServlet("/PhuHuynhServlet")
public class PhuHuynhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PhuHuynhDAOImpl phuHuynhDAO = new PhuHuynhDAOImpl();
	
    public PhuHuynhServlet() {
        super();

    }


	public void init(ServletConfig config) throws ServletException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("1");
		doGet(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		System.out.println(command);
		
		try {
			switch(command)
			{
			case "new":	
				showNewForm(request, response);
				break;
			case "insert":							
				insertPhuHuynh(request, response);				
				break;
			case "edit":
				showNewForm(request, response);
				break;
			case "update":			
				updatePhuHuynh(request, response);
				break;
			case "delete":
				deletePhuHuynh(request, response);
				break;
			case "search":
				searchPhuHuynh(request, response);
				break;
			default:
				break;
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
	public void searchPhuHuynh(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
		
		String ten = request.getParameter("ten");
		HttpSession session = request.getSession();
		
		ArrayList<PhuHuynh> dsLocPH = new PhuHuynhDAOImpl().locDanhSach(ten);
		if(ten.equals("") || ten==null)
		{
			/*dsLocPH = new PhuHuynhDAOImpl().getListPhuHuynh();
			session.setAttribute("dsPhuHuynh", dsLocPH);*/
			response.sendRedirect("TrangAdmin.jsp");
		}
		else
		{
			session.setAttribute("dsLocPH", dsLocPH);
			response.sendRedirect("TrangAdmin.jsp");
		}
		
	}

	public void insertPhuHuynh(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		
		PhuHuynh ph = new PhuHuynh();
		
		
		ph.setHoTen(request.getParameter("txtHoTen"));
		ph.setDiaChi(request.getParameter("txtDiaChi"));
		ph.setDienThoai(request.getParameter("txtDienThoai"));
		ph.setEmail(request.getParameter("txtEmail"));		
		
		String tendn=request.getParameter("txtTenDangNhap");
		String matkhau=request.getParameter("txtMatKhau");
		phuHuynhDAO.themPhuHuynh(ph, tendn, matkhau);
		
		response.sendRedirect("TrangAdmin.jsp");
	}
	public void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ThemPH.jsp");
		dispatcher.forward(request, response);
	}
	
	public void deletePhuHuynh(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		
		try {
			phuHuynhDAO.xoaPhuHuynh(request.getParameter("maPH"));
			System.out.println("xoa thanh cong");
			response.sendRedirect("TrangAdmin.jsp");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}
	public void updatePhuHuynh(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		
		PhuHuynh ph = new PhuHuynh();
		
		ph.setMaPH(request.getParameter("maPH"));
		System.out.println(request.getParameter("maPH"));
		
		ph.setHoTen(request.getParameter("txtHoTen"));
		ph.setDiaChi(request.getParameter("txtDiaChi"));
		ph.setDienThoai(request.getParameter("txtDienThoai"));
		ph.setEmail(request.getParameter("txtEmail"));		
		
		phuHuynhDAO.suaPhuHuynh(ph);
		
		response.sendRedirect("TrangAdmin.jsp");
	}
	
}
