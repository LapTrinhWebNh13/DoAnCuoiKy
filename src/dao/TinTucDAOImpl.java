package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import connect.DBConnect;
import model.TinTuc;

public class TinTucDAOImpl implements TinTucDAO{

	@Override
	public boolean themTinTuc(TinTuc a) throws SQLException {
		Connection conn = DBConnect.getConnection();
		String sql = "insert into TINTUC(TieuDe, NoiDung, Loai, HinhAnh) values(?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, a.getTieuDe());
		ps.setString(2, a.getNoiDung());
		ps.setInt(3, a.getLoai());
		ps.setBytes(4, a.getHinhAnh());

		boolean rowInsert = ps.executeUpdate()>0;
		conn.close();
		return rowInsert;
	}

	@Override
	public ArrayList<TinTuc> getListTinTuc() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from TINTUC";
		ArrayList<TinTuc> list = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TinTuc tin = new TinTuc();
				tin.setMaSo(rs.getInt("MaSo"));
				tin.setTieuDe(rs.getString("TieuDe"));
				tin.setNoiDung(rs.getString("NoiDung"));
				tin.setLoai(rs.getInt("Loai"));
				tin.setHinhAnh(rs.getBytes("HinhAnh"));
				list.add(tin);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		return list;
	}

	@Override
	public boolean xoaTinTuc(Integer maso) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "delete from TINTUC where MaSo="+ maso;
		PreparedStatement ps = conn.prepareStatement(sql);		
		boolean rowDelete = ps.executeUpdate()>0;		
		conn.close();
		return rowDelete;
	}

	@Override
	public ArrayList<TinTuc> getTinTuc() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from TINTUC where Loai=1;";
		ArrayList<TinTuc> list = new ArrayList<>();

		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TinTuc tin = new TinTuc();
				tin.setMaSo(rs.getInt("MaSo"));
				tin.setTieuDe(rs.getString("TieuDe"));
				tin.setNoiDung(rs.getString("NoiDung"));
				tin.setLoai(rs.getInt("Loai"));
				tin.setHinhAnh(rs.getBytes("HinhAnh"));
				list.add(tin);

			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		return list;
	}

	@Override
	public ArrayList<TinTuc> getTuyenDung() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from TINTUC where Loai=2;";
		ArrayList<TinTuc> list = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TinTuc tin = new TinTuc();
				tin.setMaSo(rs.getInt("MaSo"));
				tin.setTieuDe(rs.getString("TieuDe"));
				tin.setNoiDung(rs.getString("NoiDung"));
				tin.setLoai(rs.getInt("Loai"));
				tin.setHinhAnh(rs.getBytes("HinhAnh"));
				list.add(tin);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		return list;
	}

	public static int CountRow() {
		
		int count = 0;
		Connection conn = DBConnect.getConnection();

		String sql = "select count(*) TINTUC where Loai=2;";

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
	public static List<TinTuc> DisplayTinTuc(int start, int count) {
		Connection conn = DBConnect.getConnection();
		List<TinTuc> list = new ArrayList<TinTuc>();

		String sql = "select * from TinTuc where Loai=2 limit " + (start) + ", " + count;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				TinTuc tin =new TinTuc();
				tin.setMaSo(rs.getInt("MaSo"));
				tin.setTieuDe(rs.getString("TieuDe"));
				tin.setNoiDung(rs.getString("NoiDung"));
				tin.setHinhAnh(rs.getBytes("HinhAnh"));
				list.add(tin);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
