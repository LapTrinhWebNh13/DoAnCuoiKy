package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;
import java.util.TreeSet;

import connect.DBConnect;
import model.Lop;
import model.PhuHuynh;
import model.TaiKhoan;
public class DangKyTimGiaSuDAO {
	
	
	public boolean kiemTraTenTaiKhoanUnique(String username)
	{
		Connection conn = DBConnect.getConnection();
		
		String sql= "select count(TaiKhoan.TenDangNhap) from TaiKhoan where TaiKhoan.TenDangNhap = '"+ username +"'";
		try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
			{
			System.out.println("kiemTraTenTaiKhoanUnique "+ username);
			System.out.println("kiemTraTenTaiKhoanUnique "+ rs.getInt(1));
			
				if(rs.getInt(1)==1){
				 return true;
				}
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	return false;
	}
	
	//kiem tra dinh dang ten tai khoan
	public boolean kiemTraTenTaiKhoan(String username) {
        String ePattern = "^[a-zA-Z0-9]{6,}$";
     // Tạo đối tượng Pattern thông qua method tĩnh.
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
     // Lấy ra đối tượng Matcher. So sánh với chuỗi dữ liệu đầu vào
        java.util.regex.Matcher m = p.matcher(username);
        System.out.println("kiemTraTenTaiKhoan " + m.matches());
        return m.matches();       
	}
	
	//kiem tra dinh dang mat khau
	
	public boolean kiemTraMatKhau(String password)
	{
		String ePattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(password);
		System.out.println("kiemTraMatKhau " + m.matches());
	    return m.matches();
	}
	
	
	public boolean kiemTraSDTUnique(String sdt){
		Connection conn = DBConnect.getConnection();
		
		String sql= "select count(PhuHuynh.DienThoai) from PhuHuynh where PhuHuynh.DienThoai = '"+ sdt +"'";
		try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
			{
			System.out.println("kiemTraSDTUnique"+ sdt);
			System.out.println("kiemTraSDTUnique "+ rs.getInt(1));
				if(rs.getInt(1)==1){
				 return true;
				}
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	return false;
	}
	
	// kiem tra dinh dang sdt.

	public boolean kiemTraSDTPH(String dienthoai) {
        String ePattern = "^[0-9]{10,}$";
     // Tạo đối tượng Pattern thông qua method tĩnh.
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
     // Lấy ra đối tượng Matcher. So sánh với chuỗi dữ liệu đầu vào
        java.util.regex.Matcher m = p.matcher(dienthoai);
        System.out.println("kiemTraSDTPH " + m.matches());
        return m.matches();
       
	}
	
	public boolean kiemTraEmailUnique(String email){
		Connection conn = DBConnect.getConnection();
		
		String sql= "select count(PhuHuynh.Email) from PhuHuynh where PhuHuynh.Email = '"+ email +"'";
		try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
			{
			System.out.println("kiemTraEmailUnique "+ email);
			System.out.println("kiemTraEmailUnique "+ rs.getInt(1));
				if(rs.getInt(1)==1){
				 return true;
				}
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	return false;
	}
	
	//kiem tra dinh dang email
	public boolean kiemTraEmailPH(String email) {
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);
        System.out.println("kiemTraEmailPH " + m.matches());
        return m.matches();
       
	}
	
	
	public boolean themPhuHuynh(PhuHuynh ph, TaiKhoan tk, Lop lop) throws SQLException
	{
		if(ph==null)
			return false;
		
		Connection conn= DBConnect.getConnection();
		String sql = "{CALL proc_ThemTaiKhoanPhuHuynh(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)} ";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		//maph, hoten, diachi, dienthoai, email, tendangnhap, matkhau, quyen
		//lopday varchar(255), monday varchar(255), sobuoi int, soluonghs int, 
		//hocluchientai varchar(255), thoigianday varchar(255), luong float, 
		//mucphi float, yeucau varchar(255), trangthai int
		ps.setString(1, ph.getHoTen());
		ps.setString(2, ph.getDiaChi());
		ps.setString(3, ph.getDienThoai());
		ps.setString(4, ph.getEmail());
		ps.setString(5, tk.getTenDangNhap());
		ps.setString(6, tk.getMatKhau());
		ps.setInt(7, tk.getQuyen());
		ps.setString(8, lop.getLopDay());
		ps.setString(9, lop.getMonDay());
		ps.setInt(10, lop.getSoBuoi());
		ps.setInt(11, lop.getSoLuongHS());
		ps.setString(12, lop.getHocLucHienTai());
		ps.setString(13, lop.getThoiGianDay());
		ps.setFloat(14, lop.getLuong());
		ps.setFloat(15, lop.getMucPhi());
		ps.setString(16, lop.getYeuCau());
		ps.setInt(17, lop.getTrangThai());
		boolean rowInsert = ps.executeUpdate()>0;
		
		conn.close();
		System.out.println("kiem tra them tai khoan phu huynh " + rowInsert );
		return rowInsert;
	}
	
	
	
	
	public static void main(String[] args) {
		

	}

}
