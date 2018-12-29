package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connect.DBConnect;
import dao.DangKyTimGiaSuDAO;
import model.PhuHuynh;
import model.Lop;
import model.TaiKhoan;
@WebServlet("/DangKyTimGiaSuServlet")
public class DangKyTimGiaSuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DangKyTimGiaSuDAO dktgsDAO;
	private PhuHuynh phuhuynh;
	private Lop lop;
	private TaiKhoan tk;

    public DangKyTimGiaSuServlet() {
        super();
       
    }


	public void init(ServletConfig config) throws ServletException {
		
		dktgsDAO = new DangKyTimGiaSuDAO();
		phuhuynh = new PhuHuynh();
		lop =  new Lop();
		tk= new TaiKhoan();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		getDataFromJSP(request,response);
		String errormessage="";
		
		if(!dktgsDAO.kiemTraTenTaiKhoan(tk.getTenDangNhap()))
		{
			errormessage += "Tên đăng nhập ";
		}
		else
		{
			if(dktgsDAO.kiemTraTenTaiKhoanUnique(tk.getTenDangNhap()))
			{
				errormessage += "Tên đăng nhập ";
			}
		}
		if(!dktgsDAO.kiemTraMatKhau(tk.getMatKhau()))
		{
			errormessage += "Mật khẩu ";
		}
		
		if(!dktgsDAO.kiemTraSDTPH(phuhuynh.getDienThoai()))
		{
			errormessage += "Số điện thoại ";
		}
		else
		{
			if(dktgsDAO.kiemTraSDTUnique(phuhuynh.getDienThoai()))
			{
				errormessage += "Số điện thoại ";
			}
		}
		
		
		if(!dktgsDAO.kiemTraEmailPH(phuhuynh.getEmail()))
		{
			errormessage += "Email ";
		}
		else
		{
			if(dktgsDAO.kiemTraEmailUnique(phuhuynh.getEmail())) 
			{
				errormessage += "Email ";
			}
		}
		
		if(errormessage=="")
		{
			try {
				
				dktgsDAO.themPhuHuynh(phuhuynh, tk,lop);
				String errorMessage = "Đăng ký thành công";
				String status = "success";
				showMessage(request,response, errorMessage, status);
				RequestDispatcher rd = request.getRequestDispatcher("DangNhap.jsp"); 
				rd.forward(request, response);//??include
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
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
	public void getDataFromJSP(HttpServletRequest request, HttpServletResponse response)
	{
		//get tai khoan
		tk.setTenDangNhap(request.getParameter("tendangnhap")); 
		tk.setMatKhau(request.getParameter("matkhau"));
		tk.setQuyen(3);
		
		//get phu huynh
		phuhuynh.setHoTen(request.getParameter("name"));
		phuhuynh.setDiaChi(request.getParameter("diachi"));
		phuhuynh.setDienThoai(request.getParameter("dienthoai"));
		phuhuynh.setEmail(request.getParameter("email"));

		
		
		//get lop
		//malop,maph, lopday, monday , sobuoi , soluonghs , 
		//hocluchientai , thoigianday , diachi, luong , mucphi , yeucau , trangthai
		lop.setLopDay(request.getParameter("classes"));
		lop.setMonDay(request.getParameter("monhoc"));
		lop.setSoBuoi(Integer.parseInt(request.getParameter("sobuoi")));//?loi
		lop.setSoLuongHS(Integer.parseInt(request.getParameter("soluonghs")));
		lop.setHocLucHienTai(request.getParameter("hocluchientai"));
		lop.setThoiGianDay(request.getParameter("thoigianhoc"));
		lop.setDiaChi(request.getParameter("diachi"));
		lop.setLuong(Float.parseFloat(request.getParameter("luong")));
		float mucphi = (lop.getLuong() * 30)/100;
		lop.setMucPhi(mucphi);
		lop.setYeuCau(request.getParameter("yeucau"));
		lop.setTrangThai(1);
		
		
	}
	
}
