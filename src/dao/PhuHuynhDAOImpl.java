package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
import java.util.TreeSet;

import connect.DBConnect;
import model.PhuHuynh;

public class PhuHuynhDAOImpl implements PhuHuynhDAO{

	public static ArrayList<PhuHuynh> dsPhuHuynh = new ArrayList<>();
	public static Set<String> dsTen = new TreeSet<>();
	public static Set<String> dsMaPH = new TreeSet<>();
	
	public PhuHuynhDAOImpl()
	{
		dsPhuHuynh.removeAll(dsPhuHuynh);
	}
	
	@Override
	public ArrayList<PhuHuynh> getListPhuHuynh() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from phuhuynh";
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				PhuHuynh ph = new PhuHuynh();
				ph.setMaPH(rs.getString("MaPH"));
				ph.setHoTen(rs.getString("HoTen"));
				ph.setDienThoai(rs.getString("DienThoai"));
				ph.setDiaChi(rs.getString("DiaChi"));
				ph.setEmail(rs.getString("Email"));
				dsPhuHuynh.add(ph);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsPhuHuynh;
	}

	@Override
	public boolean themPhuHuynh(PhuHuynh ph, String tendn, String matkhau) throws SQLException {
		if(ph == null)
			return false;
		
		Connection conn = DBConnect.getConnection();
		String sql = "{CALL proc_ThemPhuHuynh(?,?,?,?,?,?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, ph.getHoTen());
		ps.setString(2, ph.getDiaChi());
		ps.setString(3, ph.getDienThoai());
		ps.setString(4, ph.getEmail());
		ps.setString(5, tendn);
		ps.setString(6, matkhau);
		
		boolean rowInsert = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowInsert;
	}

	@Override
	public PhuHuynh getPhuHuynh(String maph) {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from phuhuynh where MaPH='" + maph +"'";
		PhuHuynh ph = new PhuHuynh();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ph.setHoTen(rs.getString("HoTen"));
				ph.setDienThoai(rs.getString("DienThoai"));
				ph.setDiaChi(rs.getString("DiaChi"));
				ph.setEmail(rs.getString("Email"));

			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return ph;
	}

	@Override
	public boolean xoaPhuHuynh(String maph) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "delete from PHUHUYNH where MaPH='"+ maph +"'";
		PreparedStatement ps = conn.prepareStatement(sql);		
		boolean rowDelete = ps.executeUpdate()>0;		
		conn.close();
		return rowDelete;
	}

	@Override
	public boolean suaPhuHuynh(PhuHuynh ph) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "update phuhuynh set HoTen=?, DiaChi=?, DienThoai=?, Email=?" + 
				" where MaPH=?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
				
		ps.setString(1, ph.getHoTen());
		ps.setString(2, ph.getDiaChi());
		ps.setString(3, ph.getDienThoai());
		ps.setString(4, ph.getEmail());
		ps.setString(5, ph.getMaPH());
		
		boolean rowUpdate = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowUpdate;

	}

	
	@Override
	public Set<String> getDanhSachTheoTen() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from phuhuynh";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dsTen.add(rs.getString("HoTen"));
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsTen;
	}

	@Override
	public ArrayList<PhuHuynh> locDanhSach(String ten) {
		Connection conn =DBConnect.getConnection();
		String sql = "{CALL proc_TimKiemPH('"+ten+"')}";
		ArrayList<PhuHuynh> dsLoc = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				PhuHuynh ph = new PhuHuynh();
				ph.setMaPH(rs.getString("MaPH"));
				ph.setHoTen(rs.getString("HoTen"));
				ph.setDienThoai(rs.getString("DienThoai"));
				ph.setDiaChi(rs.getString("DiaChi"));
				ph.setEmail(rs.getString("Email"));
				dsLoc.add(ph);
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
	public Set<String> getDanhSachTheoMaPH() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from phuhuynh";
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				dsMaPH.add(rs.getString("MaPH"));
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsMaPH;
	}

	

}
