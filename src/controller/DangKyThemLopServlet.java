package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DangKyThemLopDAO;
import model.Lop;
import model.TaiKhoan;


@WebServlet("/DangKyThemLopServlet")
public class DangKyThemLopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Lop lop;
	private TaiKhoan tk;
	private DangKyThemLopDAO dkthemlopDAO;
   
    public DangKyThemLopServlet() {
        super();
        
    }


	public void init(ServletConfig config) throws ServletException {
		dkthemlopDAO = new DangKyThemLopDAO();
		lop =  new Lop();
		tk= new TaiKhoan();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
			//get lop
				//malop,maph, lopday, monday , sobuoi , soluonghs , 
				//hocluchientai , thoigianday , diachi, luong , mucphi , yeucau , trangthai
				String username = request.getParameter("username");
				System.out.println("username la: " + username);
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
				
				try {
					dkthemlopDAO.themLop(username, lop);
					response.sendRedirect("DNDKTimGiaSu.jsp");
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
	}

}
