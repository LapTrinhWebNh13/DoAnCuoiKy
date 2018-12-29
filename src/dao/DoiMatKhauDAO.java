package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connect.DBConnect;
import model.GiaSu;
import model.TaiKhoan;

public class DoiMatKhauDAO {

	
public boolean suaMatKhau(TaiKhoan taikhoan, String username) throws SQLException {
		
		Connection conn =DBConnect.getConnection();
		String sql2 = "select MaTaiKhoan from quanlygiasu.TaiKhoan where TenDangNhap = '"+username+"'";
		System.out.println("username ben doimk dao :"+username);
		String tk = "";
		try {
			PreparedStatement ps = conn.prepareStatement(sql2);		
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				tk = rs.getString(1);	
			}	
		} 
			catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		System.out.println("tk ben doimk dao :"+tk);
		String sql = "update TaiKhoan set MatKhau=? where MaTaiKhoan=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
				
		ps.setString(1, taikhoan.getMatKhau());
		ps.setString(2,tk);
		
		boolean rowUpdate = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowUpdate;

	}
}
