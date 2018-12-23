package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connect.DBConnect;
import model.TaiLieu;

public class TaiLieuDAOImpl implements TaiLieuDAO{

	@Override
	public ArrayList<TaiLieu> getListTaiLieu() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from TAILIEU";
		ArrayList<TaiLieu> list = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TaiLieu tl = new TaiLieu();
				tl.setMaSo(rs.getInt("MaSo"));
				tl.setTieuDe(rs.getString("TieuDe"));
				tl.setFileName(rs.getString("FileName"));
				tl.setPath(rs.getString("Path"));
				list.add(tl);
				
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
	public boolean xoaTaiLieu(Integer maso) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "delete from TAILIEU where MaSo="+ maso;
		PreparedStatement ps = conn.prepareStatement(sql);		
		boolean rowDelete = ps.executeUpdate()>0;		
		conn.close();
		return rowDelete;
	}
	
public static int CountRow() {
		
		int count = 0;
		Connection conn = DBConnect.getConnection();

		String sql = "select count(*) from TAILIEU";

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
	public static List<TaiLieu> DisplayTaiLieu(int start, int count) {
		Connection conn = DBConnect.getConnection();
		List<TaiLieu> list = new ArrayList<TaiLieu>();

		String sql = "select * from TAILIEU where limit " + (start) + ", " + count;

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				TaiLieu tl = new TaiLieu();
				tl.setMaSo(rs.getInt("MaSo"));
				tl.setTieuDe(rs.getString("TieuDe"));
				tl.setFileName(rs.getString("FileName"));
				tl.setPath(rs.getString("Path"));
				

				list.add(tl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
