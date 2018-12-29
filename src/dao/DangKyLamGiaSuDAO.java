package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import javax.swing.ImageIcon;

import connect.DBConnect;
import model.Lop;
import model.PhuHuynh;
import model.GiaSu;
import model.TaiKhoan;

public class DangKyLamGiaSuDAO {

	public boolean kiemTraTenTaiKhoanUnique(String username)
	{
		Connection conn = DBConnect.getConnection();
		
		String sql= "select count(TaiKhoan.TenDangNhap) from TaiKhoan where TaiKhoan.TenDangNhap = '"+ username +"'";
		try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
			{
			System.out.println("kiemTraTenTaiKhoanUnique GS: "+ username);
			System.out.println("kiemTraTenTaiKhoanUnique GS: "+ rs.getInt(1));
			
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
	        System.out.println("kiemTraTenTaiKhoan GS " + m.matches());
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
		
		public boolean kiemTraSDTUnique(String sdt)
		{
		Connection conn = DBConnect.getConnection();
		
		String sql= "select count(GiaSu.DienThoai) from GiaSu where GiaSu.DienThoai = '"+ sdt +"'";
		try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
			{
			System.out.println("sdtgs "+ sdt);
			System.out.println("sdtgs "+ rs.getInt(1));
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
	public boolean kiemTraSDTGS(String dienthoai) {
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
		
		String sql= "select count(GiaSu.Email) from GiaSu where GiaSu.Email = '"+ email +"'";
		try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next())
			{
			System.out.println("email "+ email);
			System.out.println("emaillll "+ rs.getInt(1));
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
	
	public boolean kiemTraEmailGS(String email) {
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);
        System.out.println("email " + m.matches());
        return m.matches();
       
	}
	
	
	
	
}
