package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import connect.DBConnect;
import dao.DangKyLamGiaSuDAO;
import dao.DangKyTimGiaSuDAO;
import model.GiaSu;
import model.Lop;
import model.PhuHuynh;
import model.TaiKhoan;

@WebServlet("/DangKyLamGiaSuServlet")
@MultipartConfig(maxFileSize=16177216)//1,5mb
public class DangKyLamGiaSuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DangKyLamGiaSuDAO dklgsDAO;
	private GiaSu giasu;
	private TaiKhoan tk;
    
    public DangKyLamGiaSuServlet() {
        super();
       
    }


	public void init(ServletConfig config) throws ServletException {
		dklgsDAO = new DangKyLamGiaSuDAO();
		giasu = new GiaSu();
		tk = new TaiKhoan();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		getDataFromJSP(request,response);
		String errormessage="";
		
		if(!dklgsDAO.kiemTraTenTaiKhoan(tk.getTenDangNhap()))
		{
			errormessage += "Tên đăng nhập ";
		}
		else
		{
			if(dklgsDAO.kiemTraTenTaiKhoanUnique(tk.getTenDangNhap()))
			{
				errormessage += "Tên đăng nhập ";
			}
		}
		
		if(!dklgsDAO.kiemTraMatKhau(tk.getMatKhau()))
		{
			errormessage += "Mật khẩu ";
		}
		
		if(!dklgsDAO.kiemTraSDTGS(giasu.getDienThoai()))
		{
			errormessage += "Số điện thoại ";
		}
		else
		{
			if(dklgsDAO.kiemTraSDTUnique(giasu.getDienThoai()))
			{
				errormessage += "Số điện thoại ";
			}
		}
		
		if(!dklgsDAO.kiemTraEmailGS(giasu.getEmail()))
		{
			errormessage += "Email ";
		}
		else
		{
			if(dklgsDAO.kiemTraEmailUnique(giasu.getEmail())) 
			{
				errormessage += "Email ";
			}
		}

		if(errormessage=="")
		{
			System.out.println("vao roi");
			int result=0;
			Part part = request.getPart("anhthe");
				if(part!=null)
				{
					try {
						Connection conn= DBConnect.getConnection();
						String sql = "{CALL proc_ThemGiaSu(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
						PreparedStatement ps = conn.prepareStatement(sql);
						
						InputStream is = part.getInputStream();
						
						// HoTen, NgaySinh, GioiTinh, DiaChi, DienThoai, GiongNoi, HinhAnh, NganhHoc, 
						//TrinhDo, NgheNgiep, UuDiem,
					    //MonDay, LopDay, LuongYeuCauToiThieu, TenDangNhap, MatKhau, Quyen, Email
						
						ps.setString(1, giasu.getHoTen());
						
						String ngay=request.getParameter("txtNgay");
						String thang=request.getParameter("txtThang");
						String nam=request.getParameter("txtNam");		
						String dateString = ngay+"/"+thang+"/"+nam;	
						ps.setString(2, dateString);
						//ps.setString(2, giasu.getNgaySinh());
						ps.setString(3, giasu.getGioiTinh());
						ps.setString(4, giasu.getDiaChi());
						ps.setString(5, giasu.getDienThoai());
						ps.setString(6, giasu.getGiongNoi());
						ps.setBlob(7, is);
						ps.setString(8, giasu.getNganhHoc());
						ps.setString(9, giasu.getTrinhDo());
						ps.setString(10, giasu.getNgheNghiep());
						ps.setString(11, giasu.getUuDiem());
						ps.setString(12, giasu.getMonDay());
						ps.setString(13, giasu.getLopDay());
						ps.setFloat(14, giasu.getLuongYauCauToiThieu());
						ps.setString(15, giasu.getEmail());
						ps.setString(16, tk.getTenDangNhap());
						ps.setString(17, tk.getMatKhau());
						
						
						System.out.println("vao roi2");
						result = ps.executeUpdate();
						
						conn.close();
						if(result>0)
						{
							String errorMessage = "Th�m th�nh c�ng";
							String status = "success";
							showMessage(request,response, errorMessage, status);
							RequestDispatcher rd = request.getRequestDispatcher("DangNhap.jsp"); 
							rd.include(request, response);//??include
						}
						else 
						{
							response.sendRedirect("DangKyTimGiaSu.jsp");
						}
						
					}catch (Exception e)
					{
						System.out.print(e);
					}
				}
			
		}
		else
		{
			
			response.sendRedirect("DangKyTimGiaSu.jsp");
		}
	}
	
	public void showMessage(HttpServletRequest request, HttpServletResponse response, String errormessage, String status)  throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ('"+ errormessage + "','', '"+status+"');");
		out.println("});");
		out.println("</script>");
	}
	
	public void getDataFromJSP(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		// HoTen, NgaySinh, GioiTinh, DiaChi, DienThoai, GiongNoi, HinhAnh, NganhHoc, 
		//TrinhDo, NgheNgiep, UuDiem,
	    //MonDay, LopDay, LuongYeuCauToiThieu, TenDangNhap, MatKhau, Quyen, Email

		tk.setTenDangNhap(request.getParameter("tendangnhap"));
		tk.setMatKhau(request.getParameter("matkhau"));
		
		
		giasu.setHoTen(request.getParameter("name"));
		giasu.setGiongNoi(request.getParameter("giongnoi"));
		giasu.setGioiTinh(request.getParameter("gioitinh"));
		giasu.setDiaChi(request.getParameter("diachi"));
		giasu.setDienThoai(request.getParameter("dienthoai"));
		giasu.setEmail(request.getParameter("email"));

		giasu.setNganhHoc(request.getParameter("nganhhoc"));
		giasu.setTrinhDo(request.getParameter("trinhdo"));
		giasu.setNgheNghiep(request.getParameter("nghenghiep"));
		giasu.setMonDay(request.getParameter("monday"));
		giasu.setLopDay(request.getParameter("lopday"));
		giasu.setLuongYauCauToiThieu(Float.parseFloat(request.getParameter("luong")));
		giasu.setUuDiem(request.getParameter("uudiem"));
	}

}
