package controller;

import java.io.IOException;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connect.DBConnect;
import dao.GiaSuDAOImpl;



@WebServlet("/GiaSuServlet")
@MultipartConfig(maxFileSize=16177216)
/*@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
				maxFileSize = 1024 * 1024 * 10,
				maxRequestSize = 1024 * 1024 * 50)*/
public class GiaSuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private GiaSuDAOImpl giaSuDAO = new GiaSuDAOImpl();
   
    public GiaSuServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
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
				insertGiaSu(request, response);			
				break;
			case "edit":
				showNewForm(request, response);
				break;
			case "update":			
				updateGiaSu(request, response);
				break;
			case "delete":
				deleteGiaSu(request, response);
				break;
			/*case "search":
				searchGiaSu(request, response);
				break;*/
			case "detail":
				String mags=request.getParameter("maGS");
				response.sendRedirect("ChiTietGS.jsp?maGS="+mags);
			
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
	
	/*public void searchGiaSu(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
		
		String ten = request.getParameter("ten");
		HttpSession session = request.getSession();
		
		ArrayList<GiaSu> dsLocGS = new GiaSuDAOImpl().locDanhSach(ten);
		if(ten.equals("") || ten==null)
		{
			dsLocGS = new GiaSuDAOImpl().getListGiaSu();
			session.setAttribute("dsGiaSu", dsLocGS);
			response.sendRedirect("TrangAdmin.jsp");
		}
		else
		{
			session.setAttribute("dsLocGS", dsLocGS);
			response.sendRedirect("TrangAdmin.jsp");
		}
		
	}*/
	

	
	public void insertGiaSu(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		
		Part picHA=request.getPart("picHinhAnh");
		
		if(picHA!=null)
		{
			try 
			{
				Connection conn = DBConnect.getConnection();
				String sql = "{CALL proc_ThemGiaSu(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
				PreparedStatement ps = conn.prepareStatement(sql);
							
				ps.setString(1, request.getParameter("txtHoTen"));
				String ngay=request.getParameter("txtNgay");
				String thang=request.getParameter("txtThang");
				String nam=request.getParameter("txtNam");		
				String dateString = ngay+"/"+thang+"/"+nam;	
				ps.setString(2, dateString);
				ps.setString(3, request.getParameter("txtGioiTinh"));
				ps.setString(4, request.getParameter("txtDiaChi"));
				ps.setString(5, request.getParameter("txtDienThoai"));
				ps.setString(6, request.getParameter("txtGiongNoi"));
				
				InputStream HA = picHA.getInputStream();
				ps.setBlob(7, HA);
				
				ps.setString(8, request.getParameter("txtNganhHoc"));
				ps.setString(9, request.getParameter("txtTrinhDo"));
				ps.setString(10, request.getParameter("txtNgheNghiep"));
				ps.setString(11, request.getParameter("txtUuDiem"));
				ps.setString(12, request.getParameter("txtMonDay"));
				ps.setString(13, request.getParameter("txtLopDay"));
				String luong =request.getParameter("txtLuongToiThieu");
				ps.setFloat(14, Float.parseFloat(luong));
				ps.setString(15, request.getParameter("txtEmail"));
				ps.setString(16, request.getParameter("txtTenDangNhap"));
				ps.setString(17, request.getParameter("txtMatKhau"));
				ps.executeUpdate();
				conn.close();
			}
			catch(Exception ex)
			{
				System.out.println(ex);
			}
		}
		response.sendRedirect("TrangAdmin.jsp");
	}
	
	public void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("ThemGiaSu.jsp");
		dispatcher.forward(request, response);
	}

	public void deleteGiaSu(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException
	{
		giaSuDAO.xoaGiaSu(request.getParameter("maGS"));
		System.out.println("xoa gs thanh cong");
		response.sendRedirect("TrangAdmin.jsp");
	}
	
	public void updateGiaSu(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String ngay=request.getParameter("txtNgay");
		String thang=request.getParameter("txtThang");
		String nam=request.getParameter("txtNam");		
		String dateString = ngay+"/"+thang+"/"+nam;	
		
		Part picHA=request.getPart("picHinhAnh");
		
		if(picHA!=null)
		{
			try 
			{
				Connection conn = DBConnect.getConnection();
				String sql = "update giasu set HoTen=?, NgaySinh=?, GioiTinh=?, DiaChi=?, DienThoai=?, GiongNoi=?, HinhAnh=?, NganhHoc=?, TrinhDo=?, NgheNghiep=?, UuDiem=?, MonDay=?, LopDay=?, LuongYeuCauToiThieu=?, Email=?" + 
						"where MaGS=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				
				ps.setString(1, request.getParameter("txtHoTen"));
				ps.setString(2, dateString);
				ps.setString(3, request.getParameter("txtGioiTinh"));
				ps.setString(4, request.getParameter("txtDiaChi"));
				ps.setString(5, request.getParameter("txtDienThoai"));
				ps.setString(6, request.getParameter("txtGiongNoi"));
				System.out.println("1");
				
				InputStream HA = picHA.getInputStream();
				ps.setBlob(7, HA);
				
				ps.setString(8, request.getParameter("txtNganhHoc"));
				ps.setString(9, request.getParameter("txtTrinhDo"));
				ps.setString(10, request.getParameter("txtNgheNghiep"));
				ps.setString(11, request.getParameter("txtUuDiem"));
				ps.setString(12, request.getParameter("txtMonDay"));
				ps.setString(13, request.getParameter("txtLopDay"));
				String luong =request.getParameter("txtLuongToiThieu");
				ps.setFloat(14, Float.parseFloat(luong));
				ps.setString(15, request.getParameter("txtEmail"));
				ps.setString(16, request.getParameter("maGS"));
				ps.executeUpdate();
				conn.close();
			}
			catch(Exception ex)
			{
				System.out.println(ex);
			}
		}
		else if(picHA == null)
		{
			try
			{
				Connection conn = DBConnect.getConnection();
				String sql = "update giasu set HoTen=?, NgaySinh=?, GioiTinh=?, DiaChi=?, DienThoai=?, GiongNoi=?," + 
						"NganhHoc=?, TrinhDo=?, NgheNghiep=?, UuDiem=?, MonDay=?, LopDay=?, LuongYeuCauToiThieu=?, Email=?" + 
						"where MaGS=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				
				ps.setString(1, request.getParameter("txtHoTen"));
				ps.setString(2, dateString);
				ps.setString(3, request.getParameter("txtGioiTinh"));
				ps.setString(4, request.getParameter("txtDiaChi"));
				ps.setString(5, request.getParameter("txtDienThoai"));
				ps.setString(6, request.getParameter("txtGiongNoi"));
				
				ps.setString(7, request.getParameter("txtNganhHoc"));
				ps.setString(8, request.getParameter("txtTrinhDo"));
				ps.setString(9, request.getParameter("txtNgheNghiep"));
				ps.setString(10, request.getParameter("txtUuDiem"));
				ps.setString(11, request.getParameter("txtMonDay"));
				ps.setString(12, request.getParameter("txtLopDay"));
				String luong =request.getParameter("txtLuongToiThieu");
				ps.setFloat(13, Float.parseFloat(luong));
				ps.setString(14, request.getParameter("txtEmail"));
				ps.setString(15, request.getParameter("maGS"));
				ps.executeUpdate();
				conn.close();
			}
			catch(Exception ex)
			{
				System.out.println(ex);
			}
		}
		response.sendRedirect("TrangAdmin.jsp");
	}
	
	
	
}
