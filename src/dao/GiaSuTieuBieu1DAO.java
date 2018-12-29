package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connect.DBConnect;
import model.Lop;
import model.GiaSu;



public class GiaSuTieuBieu1DAO {
	public static ArrayList<GiaSu> dsGiaSu = new ArrayList<>();
	public static ArrayList<Lop> dsLopCuaGiaSu = new ArrayList<>();
	
	public GiaSuTieuBieu1DAO() {
		dsGiaSu.removeAll(dsGiaSu);
		dsLopCuaGiaSu.removeAll(dsLopCuaGiaSu);
	}
	
	public ArrayList<GiaSu> getListGiaSu() {
	
		Connection conn =DBConnect.getConnection();
		String sql = "select * from giasu";
		
		try
		{
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next())
			{
				GiaSu gs=new GiaSu();
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
				dsGiaSu.add(gs);
				
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsGiaSu;
	}
	
	public GiaSu getGiaSu(String mags)
	{
		Connection conn =DBConnect.getConnection();
		String sql = "select * from GiaSu where MaGS='" + mags +"'";
		GiaSu gs =new GiaSu();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
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
		catch(Exception e)
		{
			System.out.println(e);
		}
		return gs;
	}
	
	public ArrayList<Lop> getListLopCuaGiaSu(String mags)
	{
		Connection conn =DBConnect.getConnection();
		String sql = "select lop.MaLop, lop.LopDay, lop.MonDay, lop.ThoiGianDay, lop.DiaChi from dangky, lop "
				+ "where dangky.MaGS='"+mags+"' and lop.MaLop = dangky.MaLop";
		
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Lop lop =new Lop();
				lop.setMaLop(rs.getString("MaLop"));
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
	
	public static int CountRow() {
		
		int count = 0;
		Connection conn = DBConnect.getConnection();

		String sql = "select count(*) from GiaSu";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public static List<GiaSu> DisplayGiaSu(int start, int count) {
		Connection conn = DBConnect.getConnection();
		List<GiaSu> list = new ArrayList<GiaSu>();

		String sql = "select * from GiaSu limit " + (start) + ", " + count;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				GiaSu gs = new GiaSu();
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

				list.add(gs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
		
	
	
}
