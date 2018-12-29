package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connect.DBConnect;

import model.Lop;

public class DSTheoLopDAO {
	
	public static ArrayList<Lop> dsTheoLop = new ArrayList<>();
	
	public DSTheoLopDAO() {
		dsTheoLop.removeAll(dsTheoLop);
		
	}
	
	public ArrayList<Lop> getDSLop(String lopDay)
	{
		Connection conn =DBConnect.getConnection();
		String sql = null;
		if(lopDay.equals("1"))
		{
			sql = "select * from quanlygiasu.Lop where TrangThai=1 and LopDay = 'Lớp 1'";
		}
		if(lopDay.equals("2"))
		{
			sql = "select * from quanlygiasu.Lop where TrangThai=1 and LopDay = 'Lớp 2'";
		}
		if(lopDay.equals("3"))
		{
			sql = "select * from quanlygiasu.Lop where TrangThai=1 and LopDay = 'Lớp 3'";
		}
		if(lopDay.equals("4"))
		{
			sql = "select * from quanlygiasu.Lop where TrangThai=1 and LopDay = 'Lớp 4'";
		}
		if(lopDay.equals("5"))
		{
			sql = "select * from quanlygiasu.Lop where TrangThai=1 and LopDay = 'Lớp 5'";
		}
		if(lopDay.equals("6"))
		{
			sql = "select * from quanlygiasu.Lop where TrangThai=1 and LopDay = 'Lớp 6'";
		}
		if(lopDay.equals("7"))
		{
			sql = "select * from quanlygiasu.Lop where TrangThai=1 and LopDay = 'Lớp 7'";
		}
		System.out.println(sql);
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
				
				dsTheoLop.add(lop);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return dsTheoLop;
	}
	public static void main(String[] args) {
		

	}

}
