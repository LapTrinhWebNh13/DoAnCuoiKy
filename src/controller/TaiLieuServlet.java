package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connect.DBConnect;
import dao.TaiLieuDAOImpl;
import dao.TinTucDAOImpl;


@WebServlet("/TaiLieuServlet")
@MultipartConfig(maxFileSize=16177216)
public class TaiLieuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private TinTucDAOImpl tinTucDAO = new TinTucDAOImpl();
	private TaiLieuDAOImpl tailieuDAO = new TaiLieuDAOImpl();
	
    public TaiLieuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
		String command = request.getParameter("command");
		System.out.println(command);
		
		try {
			switch(command)
			{
			
			case "deleteTaiLieu":	
				deleteTaiLieu(request, response);			
				break;
			case "insertTinTuc":	
				insertTinTuc(request, response);	
				break;
			case "deleteTinTuc":
				deleteTinTuc(request, response);
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

	public void insertTinTuc(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException
	{
		
		Part picHA=request.getPart("picHinhAnh");
		
		Connection conn = DBConnect.getConnection();
		String sql = "insert into TINTUC(TieuDe, NoiDung, Loai, HinhAnh) values(?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, request.getParameter("txtTieuDeTT"));
		ps.setString(2, request.getParameter("txtNDTinTuc"));
		ps.setInt(3, Integer.parseInt(request.getParameter("txtLoai")));
		
		InputStream HA = picHA.getInputStream();
		ps.setBlob(4, HA);

		ps.executeUpdate();
		conn.close();
		
		response.sendRedirect("TrangAdmin.jsp");
	}
	public void deleteTinTuc(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
	{
		String maso= request.getParameter("maSo");
		
		tinTucDAO.xoaTinTuc(Integer.parseInt(maso));
		response.sendRedirect("TrangAdmin.jsp");
	}
	public void deleteTaiLieu(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException
	{
		String maso= request.getParameter("maSo");
		
		tailieuDAO.xoaTaiLieu(Integer.parseInt(maso));
		response.sendRedirect("TrangAdmin.jsp");
		
	}
}
