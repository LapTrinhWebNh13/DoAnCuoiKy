package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBConnect;
import model.GiaSu;
import model.HoaDon;
import model.Lop;
import model.LopDK;


public class HoaDonDAOImpl implements HoaDonDAO{
	
	public static ArrayList<HoaDon> dsHoaDon = new ArrayList<>();

	public HoaDonDAOImpl()
	{
		dsHoaDon.removeAll(dsHoaDon);
	}
	@Override
	public ArrayList<HoaDon> getListHoaDon() {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from hoadon";
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				HoaDon hd = new HoaDon();
				hd.setMaHD(rs.getString("MaHD"));
				hd.setMaLop(rs.getString("MaLop"));
				hd.setMaGS(rs.getString("MaGS"));
				hd.setTienLePhi(rs.getFloat("TienLePhi"));
				hd.setThoiGian(rs.getDate("ThoiGian"));
				dsHoaDon.add(hd);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

		return dsHoaDon;
	}

	@Override
	public ArrayList<LopDK> getListDangKy() {
		Connection conn =DBConnect.getConnection();
		String sql = "select l.MaLop, l.LopDay, l.YeuCau, gs.MaGS, gs.HoTen, gs.TrinhDo from GIASU gs, LOP l, DANGKY dk where gs.MaGS=dk.MaGS and l.MaLop=dk.MaLop";
		ArrayList<LopDK> list =new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				LopDK lopdk = new LopDK();
				System.out.println("3");
				Lop lop = new Lop();
				lop.setMaLop(rs.getString("MaLop"));
				lop.setLopDay(rs.getString("LopDay"));
				lop.setYeuCau(rs.getString("YeuCau"));
				GiaSu gs = new GiaSu();
				gs.setMaGS(rs.getString("MaGS"));
				gs.setHoTen(rs.getString("HoTen"));
				gs.setTrinhDo(rs.getString("TrinhDo"));
				lopdk.setLop(lop);
				lopdk.setGs(gs);
				list.add(lopdk);
			}
			conn.close();
		}
		catch (Exception e)
		{

		}
		return list;
	}

	@Override
	public boolean xoaHoaDon(String mahd) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "delete from HOADON where MaHD='"+ mahd +"'";
		PreparedStatement ps = conn.prepareStatement(sql);		
		boolean rowDelete = ps.executeUpdate()>0;		
		conn.close();
		return rowDelete;
		
	}

	@Override
	public boolean themHoaDon(HoaDon hd) throws SQLException {
		Connection conn = DBConnect.getConnection();
		String sql = "{CALL proc_ThemHoaDon(?,?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, hd.getMaLop());
		ps.setString(2, hd.getMaGS());
		
		
		boolean rowInsert = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowInsert;
	}

	@Override
	public ArrayList<HoaDon> getHoaDonTheoNgay(String ngay) throws SQLException {
		Connection conn = DBConnect.getConnection();
		String sql = "select * from HOADON where ThoiGian = '"+ngay+"'";
		ArrayList<HoaDon> dsLocHD = new ArrayList<>();
		
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				HoaDon hd = new HoaDon();
				hd.setMaHD(rs.getString("MaHD"));
				hd.setMaGS(rs.getString("MaGS"));
				hd.setMaLop(rs.getString("MaLop"));
				hd.setTienLePhi(rs.getFloat("TienLePhi"));
				hd.setThoiGian(rs.getDate("ThoiGian"));
				dsLocHD.add(hd);
			}
			conn.close();
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsLocHD;
	}

	
	

}
