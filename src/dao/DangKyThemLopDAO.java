package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connect.DBConnect;
import model.Lop;
import model.PhuHuynh;

public class DangKyThemLopDAO {

	
	public boolean themLop(String username, Lop lop) throws SQLException
	{
		Connection conn =DBConnect.getConnection();
		String sql2 = "select MaTaiKhoan from TaiKhoan where TenDangNhap = '"+username+"'";
		
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
		
		if(lop==null)
			return false;
		
		String sql = "{CALL proc_ThemLop(?,?,?,?,?,?,?,?,?,?,?,?)} ";
		PreparedStatement ps = conn.prepareStatement(sql);
		//malop,maph, lopday, monday , sobuoi , soluonghs , 
		//hocluchientai , thoigianday , dia chi,  luong , mucphi , yeucau , trangthai
		
		ps.setString(1, tk);
		System.out.println("ma la: "+tk);
		ps.setString(2, lop.getLopDay());
		ps.setString(3, lop.getMonDay());
		ps.setInt(4, lop.getSoBuoi());
		ps.setInt(5, lop.getSoLuongHS());
		ps.setString(6, lop.getHocLucHienTai());
		ps.setString(7,lop.getThoiGianDay());
		ps.setString(8,lop.getDiaChi());
		ps.setFloat(9, lop.getLuong());
		ps.setFloat(10, lop.getMucPhi());
		ps.setString(11, lop.getYeuCau());
		ps.setInt(12,lop.getTrangThai());
		boolean rowInsert = ps.executeUpdate()>0;
		System.out.println("kiem tra them lop" + rowInsert );
		conn.close();
		
		return rowInsert;
	}
}
