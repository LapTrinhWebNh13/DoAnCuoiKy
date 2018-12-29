package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;

import model.Lop;
import model.PhuHuynh;
public class DNDKTimGiaSuDAO {
	public static ArrayList<Lop> dsLopCuaPH = new ArrayList<>();
	
	public DNDKTimGiaSuDAO() {
		
		dsLopCuaPH.removeAll(dsLopCuaPH);
	}
	
	public PhuHuynh getPhuHuynh(String username)
	{
		
		Connection conn =DBConnect.getConnection();
		String sql = "select MaTaiKhoan from quanlygiasu.TaiKhoan where TenDangNhap = '"+username+"'";
		
		PhuHuynh ph=null;
		String tk = "";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);		
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				tk = rs.getString(1);	
			}	
		} 
			catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		try {
			String sql2 = "select * from PhuHuynh where MaPH = '"+ tk + "'";
			PreparedStatement ps = conn.prepareStatement(sql2);	
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				 ph =new PhuHuynh();
				ph.setMaPH(rs.getString("MaPH"));
				ph.setHoTen(rs.getString("HoTen"));
				ph.setDiaChi(rs.getString("DiaChi"));
				ph.setDienThoai(rs.getString("DienThoai"));
				ph.setEmail(rs.getString("Email"));
				
			}	
		} 
			catch (SQLException e) {
			
			e.printStackTrace();
		}
		return ph;
	}
	public boolean suaPhuHuynh(PhuHuynh ph, String username) throws SQLException {
		
		Connection conn =DBConnect.getConnection();
		String sql2 = "select MaTaiKhoan from quanlygiasu.TaiKhoan where TenDangNhap = '"+username+"'";
		
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
		
		String sql = "update phuhuynh set HoTen=?, DiaChi=?, DienThoai=?, Email=?" + 
				" where MaPH=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
				
		ps.setString(1, ph.getHoTen());
		ps.setString(2, ph.getDiaChi());
		ps.setString(3, ph.getDienThoai());
		ps.setString(4, ph.getEmail());
		ps.setString(5,tk);
		
		boolean rowUpdate = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowUpdate;

	}
	
	public ArrayList<Lop> getListLopCuaPH(String username)
	{
		Connection conn =DBConnect.getConnection();
		String sql2 = "select MaTaiKhoan from quanlygiasu.TaiKhoan where TenDangNhap = '"+username+"'";
		
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
		
		String sql = " select * from lop" + 
				" where  MaPH = '"+tk+"'";
		
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Lop lop =new Lop();
				lop.setMaLop(rs.getString("MaLop"));
				lop.setMaPH(rs.getString("MaPH"));
				lop.setLopDay(rs.getString("LopDay"));
				lop.setMonDay(rs.getString("MonDay"));
				lop.setSoBuoi(rs.getInt("SoBuoi"));
				lop.setSoLuongHS(rs.getInt("SoLuongHS"));
				lop.setHocLucHienTai(rs.getString("HocLucHienTai"));
				lop.setThoiGianDay(rs.getString("ThoiGianDay"));
				lop.setDiaChi(rs.getString("DiaChi"));
				lop.setLuong(rs.getFloat("Luong"));
				lop.setMucPhi(rs.getFloat("MucPhi"));
				lop.setYeuCau(rs.getString("YeuCau"));
				dsLopCuaPH.add(lop);		
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return dsLopCuaPH;
	}
	public static void main(String[] args) {
		
	}
}
