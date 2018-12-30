package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connect.DBConnect;


public class QuenMatKhauDAO {
	
	public boolean ktTaiKhoanPH(String username, String email)
	{
		Connection conn =DBConnect.getConnection();
		String sql = "select count(*) from TaiKhoan,PhuHuynh where TenDangNhap='"+ username +"' and Email='" + email+ "'";
		
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
	public boolean ktTaiKhoanGS(String username, String email)
	{
		Connection conn =DBConnect.getConnection();
		String sql = "select count(*) from TaiKhoan,GiaSu where TenDangNhap='"+ username +"' and Email='" + email+ "'";
		
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
	
}
