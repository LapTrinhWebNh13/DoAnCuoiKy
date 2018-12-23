package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import connect.DBConnect;
import dao.HoaDonDAOImpl;
import model.HoaDon;



@WebServlet("/HoaDonServlet")
public class HoaDonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HoaDonDAOImpl hoaDonDAO = new HoaDonDAOImpl();
    public HoaDonServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		System.out.println(command);
		
		try {
			switch(command)
			{
			case "insert":
				insertHoaDon(request, response);
				xoaLopDK(request, response);
				response.sendRedirect("TrangAdmin.jsp");
				break;
			case "delete":
				deleteHoaDon(request, response);
				break;
			/*case "search":
				searchHoaDon(request, response);
				response.sendRedirect("TrangAdmin.jsp");
				break;*/
			default:
				break;
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	public void deleteHoaDon(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			hoaDonDAO.xoaHoaDon(request.getParameter("maHD"));
			System.out.println("xoa thanh cong");
			response.sendRedirect("TrangAdmin.jsp");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}
	
	public void insertHoaDon(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
	{
		HoaDon hd = new HoaDon();
		
		hd.setMaLop(request.getParameter("maLop"));
		hd.setMaGS(request.getParameter("maGS"));
		
		hoaDonDAO.themHoaDon(hd);
		
	}
	public void xoaLopDK(HttpServletRequest request, HttpServletResponse response) throws SQLException
	{
		String malop=request.getParameter("maLop");
		Connection conn =DBConnect.getConnection();
		String sql = "delete from DANGKY where MaLop='"+malop+"'";
		PreparedStatement ps = conn.prepareStatement(sql);		
		ps.executeUpdate();		
		conn.close();
	}
	/*public void searchHoaDon(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
	{
		
		System.out.println(request.getParameter("txtTimKiem"));
		String ngay =request.getParameter("txtTimKiem");
		
		
		
		HttpSession session = request.getSession();
		//ArrayList<Lop> dsLop = new LopDAOImpl().getListLop();
		ArrayList<HoaDon> dsLocHD = new HoaDonDAOImpl().getHoaDonTheoNgay(ngay);
		if(ngay.equals("") || ngay==null)
		{
			dsLocLop = new LopDAOImpl().getListLop();
			session.setAttribute("dsLop", dsLocLop);
			session.setAttribute("dsHD", dsLocHD);
			response.sendRedirect("TrangAdmin.jsp");
		}
		else
		{
			session.setAttribute("dsLocHD", dsLocHD);
			response.sendRedirect("TrangAdmin.jsp");
		}
		
	}*/
}
