package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import model.GiaSu;
import model.Lop;


public class DNDKLamGiaSuDAO {
	public static ArrayList<Lop> dsLopCuaGiaSu = new ArrayList<>();
	
	public DNDKLamGiaSuDAO() {
		
		dsLopCuaGiaSu.removeAll(dsLopCuaGiaSu);
	}
	
	public GiaSu getGiaSu(String username)
	{
		
		Connection conn =DBConnect.getConnection();
		String sql = "select MaTaiKhoan from quanlygiasu.TaiKhoan where TenDangNhap = '"+username+"'";
		
		GiaSu gs=null;
		String tk = "";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);		
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
				
			{
				
				tk = rs.getString(1);	
				System.out.println("ma la: "+tk);
			}	
		} 
			catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		try {
			String sql2 = "select * from GiaSu where MaGS = '"+ tk + "'";
			PreparedStatement ps = conn.prepareStatement(sql2);	
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				
					gs = new GiaSu();
					gs.setMaGS(rs.getString("MaGS"));
					gs.setHoTen(rs.getString("HoTen"));
					gs.setGioiTinh(rs.getString("GioiTinh"));
					gs.setNgaySinh(rs.getString("NgaySinh"));
					gs.setDiaChi(rs.getString("DiaChi"));
					gs.setDienThoai(rs.getString("DienThoai"));
					gs.setGiongNoi(rs.getString("GiongNoi"));
					
					gs.setHinhAnh(rs.getBytes("HinhAnh"));
					
					gs.setNganhHoc(rs.getString("NganhHoc"));
					gs.setTrinhDo(rs.getString("TrinhDo"));
					gs.setNgheNghiep(rs.getString("NgheNghiep"));
					gs.setUuDiem(rs.getString("UuDiem"));
					gs.setMonDay(rs.getString("MonDay"));
					gs.setLopDay(rs.getString("LopDay"));
					gs.setLuongYauCauToiThieu(rs.getFloat("LuongYeuCauToiThieu"));	
					gs.setEmail(rs.getString("Email"));	
				
			}	
		} 
			catch (SQLException e) {
			
			e.printStackTrace();
		}
		return gs;
	}
	
	public boolean suaGiaSu(GiaSu gs, String username) throws SQLException {
		
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
		
		String sql = "update giasu set HoTen=?, NgaySinh=?, GioiTinh=?, DiaChi=?, DienThoai=?, GiongNoi=?,"
				+ " NganhHoc=?, TrinhDo=?, NgheNghiep=?, UuDiem=?, MonDay=?, LopDay=?, LuongYeuCauToiThieu=?, Email=?" + 
				" where MaGS=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
				
		ps.setString(1, gs.getHoTen());
		ps.setString(2, gs.getNgaySinh());
		ps.setString(3, gs.getGioiTinh());
		ps.setString(4, gs.getDiaChi());
		ps.setString(5, gs.getDienThoai());
		ps.setString(6, gs.getGiongNoi());
		ps.setString(7, gs.getNganhHoc());
		ps.setString(8, gs.getTrinhDo());
		ps.setString(9, gs.getNgheNghiep());
		ps.setString(10, gs.getUuDiem());
		ps.setString(11, gs.getMonDay());
		ps.setString(12, gs.getLopDay());
		ps.setFloat(13, gs.getLuongYauCauToiThieu());
		ps.setString(14, gs.getEmail());
		ps.setString(15,tk);
		
		boolean rowUpdate = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowUpdate;

	}
	public ArrayList<Lop> getListLopCuaGiaSu(String username)
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
		
		
		String sql = "select lop.MaLop, lop.LopDay, lop.MonDay, lop.ThoiGianDay, lop.DiaChi from dangky, lop "
				+ "where dangky.MaGS='"+tk+"' and lop.MaLop = dangky.MaLop";
		
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Lop lop =new Lop();
				lop.setMaLop(rs.getString("MaLop"));
				System.out.println("ma lop: " + rs.getString("MaLop"));
				lop.setLopDay(rs.getString("LopDay"));
				lop.setMonDay(rs.getString("MonDay"));
				lop.setThoiGianDay(rs.getString("ThoiGianDay"));
				lop.setDiaChi(rs.getString("DiaChi"));
				dsLopCuaGiaSu.add(lop);		
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return dsLopCuaGiaSu;
	}
	
	
}
