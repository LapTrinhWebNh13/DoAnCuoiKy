package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connect.DBConnect;
import model.Lop;
import model.GiaSu;
import model.TaiKhoan;

public class DangNhapDAO {
	
	public boolean ktDangNhapPH(String username, String password)
	{
		Connection conn =DBConnect.getConnection();
		String sql = "select count(*) from TaiKhoan where Quyen = 3 and TenDangNhap='"+ username +"' and MatKhau='" + password+ "'";
		
		try
		{
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				
				System.out.println("kiemTradangnhap "+ username);
					 return true;
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return false;
	}
	public boolean ktDangNhapGS(String username, String password)
	{
		Connection conn =DBConnect.getConnection();
		String sql = "select count(*) from TaiKhoan where Quyen = 2 and TenDangNhap='"+ username +"' and MatKhau='" + password+ "'";
		
		try
		{
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				
				System.out.println("kiemTradangnhapgs "+ username);
					 return true;
					
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return false;
	}
	public boolean ktDangNhapAdmin(String username, String password)
	{
		Connection conn =DBConnect.getConnection();
		String sql = "select count(*) from TaiKhoan where Quyen = 1 and TenDangNhap='"+ username +"' and MatKhau='" + password+ "'";
		
		try
		{
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				
				System.out.println("kiemTradangnhapadmin "+ username);
				
					 return true;
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return false;
	}
}
