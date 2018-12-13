package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
import java.util.TreeSet;

import connect.DBConnect;
import model.Lop;
import model.LopDK;

public class LopDAOImpl implements LopDAO{
	public static ArrayList<Lop> dsLop = new ArrayList<>();
	public static Set<String> dsMaLop = new TreeSet<>();
	
	public LopDAOImpl()
	{
		dsLop.removeAll(dsLop);
	}
	@Override
	public ArrayList<Lop> getListLop() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from lop";
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Lop lop = new Lop();
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
				lop.setTrangThai(rs.getInt("TrangThai"));
				dsLop.add(lop);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		return dsLop;
	}
	@Override
	public Lop getLop(String malop) {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from lop where MaLop='"+malop+"'";
		Lop lop = new Lop();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{		
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
				lop.setTrangThai(rs.getInt("TrangThai"));
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return lop;
	}
	@Override
	public boolean themLopMoi(Lop lop) throws SQLException {
		Connection conn = DBConnect.getConnection();
		String sql = "{CALL proc_ThemLopMoi(?,?,?,?,?,?,?,?,?,?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, lop.getMaPH());
		ps.setString(2, lop.getLopDay());
		ps.setString(3, lop.getMonDay());
		ps.setInt(4, lop.getSoBuoi());
		ps.setInt(5, lop.getSoLuongHS());
		ps.setString(6, lop.getHocLucHienTai());
		ps.setString(7, lop.getThoiGianDay());
		ps.setString(8, lop.getDiaChi());
		ps.setFloat(9, lop.getLuong());
		ps.setString(10, lop.getYeuCau());
		
		boolean rowInsert = ps.executeUpdate()>0;
		conn.close();
		return rowInsert;
	}
	@Override
	public boolean xoaLop(String malop) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "delete from LOP where MaLop='"+ malop +"'";
		PreparedStatement ps = conn.prepareStatement(sql);		
		boolean rowDelete = ps.executeUpdate()>0;		
		conn.close();
		return rowDelete;
	}
	@Override
	public boolean suaLop(Lop lop) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "update lop set MaPH=?, LopDay=?, MonDay=?, SoBuoi= ?, SoLuongHS=?, HocLucHienTai=?, ThoiGianDay=?, DiaChi=?, " + 
					"Luong=?,  YeuCau=?, MucPhi=? where MaLop=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, lop.getMaPH());
		ps.setString(2, lop.getLopDay());
		ps.setString(3, lop.getMonDay());
		ps.setInt(4, lop.getSoBuoi());
		ps.setInt(5, lop.getSoLuongHS());
		ps.setString(6, lop.getHocLucHienTai());
		ps.setString(7, lop.getThoiGianDay());
		ps.setString(8, lop.getDiaChi());
		ps.setFloat(9, lop.getLuong());
		ps.setString(10, lop.getYeuCau());
		ps.setFloat(11, lop.getMucPhi());
		ps.setString(12, lop.getMaLop());
		
		boolean rowUpdate = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowUpdate;
	}
	@Override
	public Set<String> getDanhSachTheoMaLop() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from lop";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dsMaLop.add(rs.getString("MaLop"));
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsMaLop;
	}
	@Override
	public ArrayList<Lop> locDanhSach(String malop) {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from lop where MaLop like '%"+malop+"%'";
		ArrayList<Lop> dsLoc = new ArrayList<>();
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
				lop.setTrangThai(rs.getInt("TrangThai"));
				System.out.println(lop.getMaLop());
				dsLoc.add(lop);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsLoc;
	}
	@Override
	public ArrayList<Lop> getListLopMoi() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from lop where TrangThai=1";
		ArrayList<Lop> dsLopMoi = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Lop lop = new Lop();
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
				lop.setTrangThai(rs.getInt("TrangThai"));
				dsLopMoi.add(lop);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		return dsLopMoi;
	}
	@Override
	public boolean themDangKyLop(LopDK lopdk) throws SQLException {
		Connection conn = DBConnect.getConnection();
		String sql = "insert into DangKy(MaGS, MaLop) values(?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, lopdk.getGs().getMaGS());
		ps.setString(2, lopdk.getLop().getMaLop());
		
		
		boolean rowInsert = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowInsert;
	}

}
