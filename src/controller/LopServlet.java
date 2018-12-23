package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import connect.DBConnect;
import dao.LopDAOImpl;
import model.GiaSu;
import model.Lop;
import model.LopDK;

@WebServlet("/LopServlet")
public class LopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private LopDAOImpl lopDAO = new LopDAOImpl();
    
    public LopServlet() {
        super();
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
				insertLopMoi(request, response);				
				break;
			case "edit":
				showNewForm(request, response);
				break;
			case "update":			
				updateLop(request, response);
				break;
			case "delete":
				deleteLop(request, response);
				break;
			/*case "search":
				searchLop(request, response);
				break;*/
			case "insertLopDK":
				insertLopDK(request, response);
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ThemLopMoi.jsp");
		dispatcher.forward(request, response);
	}
	public void insertLopMoi(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		
		Lop lop = new Lop();

		lop.setMaPH(request.getParameter("txtMaPH"));
		lop.setLopDay(request.getParameter("txtLopDay"));
		lop.setMonDay(request.getParameter("txtMonDay"));
		lop.setHocLucHienTai(request.getParameter("txtHocLucHienTai"));
		lop.setThoiGianDay(request.getParameter("txtThoiGian"));
		lop.setDiaChi(request.getParameter("txtDiaChi"));
		lop.setYeuCau(request.getParameter("txtYeuCau"));
		lop.setLuong(Float.parseFloat(request.getParameter("txtLuong")));	
		lop.setSoLuongHS(Integer.parseInt(request.getParameter("txtSoLuongHS")));
		lop.setSoBuoi(Integer.parseInt(request.getParameter("txtSoBuoi")));
		
		lopDAO.themLopMoi(lop);
		
		response.sendRedirect("TrangAdmin.jsp");
	}
	
	public void insertLopDK(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String mags = layMaGS(request,response);
		LopDK lopdk = new LopDK();

		Lop lop = new Lop();
		lop.setMaLop(request.getParameter("maLop"));
		GiaSu gs = new GiaSu();
		gs.setMaGS(mags);
		
		lopdk.setLop(lop);
		lopdk.setGs(gs);
		
		lopDAO.themDangKyLop(lopdk);

		RequestDispatcher rd = request.getRequestDispatcher("PageServlet?command=LopMoi&pageID=1");
		rd.forward(request, response);
	}
	
	public String layMaGS(HttpServletRequest request, HttpServletResponse response) throws SQLException
	{
		String tendn=request.getParameter("txtTenDangNhap");
		String matkhau=request.getParameter("txtMatKhau");
		String mags="";
		//GiaSu gs =new GiaSu();
		Connection conn = DBConnect.getConnection();
		String sql = "select MaTaiKhoan from taikhoan where TenDangNhap='"+tendn+"' and MatKhau='"+matkhau+"'";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				mags=rs.getString("MaTaiKhoan");
			}
			conn.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return mags;
	}
	public void deleteLop(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		
		try {
			lopDAO.xoaLop(request.getParameter("maLop"));
			System.out.println("xoa thanh cong");
			response.sendRedirect("TrangAdmin.jsp");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}
	public void updateLop(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		
		Lop lop = new Lop();
		
		lop.setMaPH(request.getParameter("txtMaPH"));
		lop.setLopDay(request.getParameter("txtLopDay"));
		lop.setMonDay(request.getParameter("txtMonDay"));
		lop.setHocLucHienTai(request.getParameter("txtHocLucHienTai"));
		lop.setThoiGianDay(request.getParameter("txtThoiGian"));
		lop.setDiaChi(request.getParameter("txtDiaChi"));
		lop.setYeuCau(request.getParameter("txtYeuCau"));
		lop.setLuong(Float.parseFloat(request.getParameter("txtLuong")));	
		lop.setSoLuongHS(Integer.parseInt(request.getParameter("txtSoLuongHS")));
		lop.setSoBuoi(Integer.parseInt(request.getParameter("txtSoBuoi")));
		lop.setMucPhi(Float.parseFloat(request.getParameter("txtMucPhi")));
		lop.setMaLop(request.getParameter("maLop"));
		lopDAO.suaLop(lop);
		
		response.sendRedirect("TrangAdmin.jsp");
	}
	
	/*public void searchLop(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
		
		String ma = request.getParameter("ma");
		HttpSession session = request.getSession();
		//ArrayList<Lop> dsLop = new LopDAOImpl().getListLop();
		ArrayList<Lop> dsLocLop = new LopDAOImpl().locDanhSach(ma);
		if(ma.equals("") || ma==null)
		{
			dsLocLop = new LopDAOImpl().getListLop();
			session.setAttribute("dsLop", dsLocLop);
			session.setAttribute("dsLop", dsLocLop);
			response.sendRedirect("TrangAdmin.jsp");
		}
		else
		{
			session.setAttribute("dsLocLop", dsLocLop);
			response.sendRedirect("TrangAdmin.jsp");
		}
		 
	}*/
	
}
