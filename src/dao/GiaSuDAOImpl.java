package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import connect.DBConnect;
import model.GiaSu;
import model.Lop;

public class GiaSuDAOImpl implements GiaSuDAO{
	public static ArrayList<GiaSu> dsGiaSu = new ArrayList<>();
	public static Set<String> dsTen = new TreeSet<>();
	
	public GiaSuDAOImpl()
	{
		dsGiaSu.removeAll(dsGiaSu);
	}
	
	@Override
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
				//gs.setHinhAnh(rs.getString("HinhAnh"));
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

	@Override
	public GiaSu getGiaSu(String mags) {
		Connection conn =DBConnect.getConnection();
		String sql = "select * from giasu where MaGS='" + mags +"'";
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
				//gs.setHinhAnh(rs.getString("HinhAnh"));
				
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

	@Override
	public boolean themGiaSu(GiaSu gs) throws SQLException {
		if(gs == null)
			return false;
		
		Connection conn = DBConnect.getConnection();
		String sql = "{CALL proc_ThemGiaSu(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, gs.getHoTen());
		ps.setString(2, gs.getNgaySinh());
		ps.setString(3, gs.getGioiTinh());
		ps.setString(4, gs.getDiaChi());
		ps.setString(5, gs.getDienThoai());
		ps.setString(6, gs.getGiongNoi());
		
		ps.setBytes(7, gs.getHinhAnh());
		//ps.setString(7, gs.getHinhAnh());
		
		ps.setString(9, gs.getNganhHoc());
		ps.setString(10, gs.getTrinhDo());
		ps.setString(11, gs.getNgheNghiep());
		ps.setString(12, gs.getUuDiem());
		ps.setString(13, gs.getMonDay());
		ps.setString(14, gs.getLopDay());
		ps.setFloat(15, gs.getLuongYauCauToiThieu());
		ps.setString(16, gs.getEmail());
		
		boolean rowInsert = ps.executeUpdate()>0;
		
		conn.close();
		
		return rowInsert;
	}

	@Override
	public boolean xoaGiaSu(String maGS) throws SQLException {
		Connection conn =DBConnect.getConnection();
		String sql = "delete from GIASU where MaGS='"+ maGS +"'";
		PreparedStatement ps = conn.prepareStatement(sql);		
		boolean rowDelete = ps.executeUpdate()>0;		
		conn.close();
		return rowDelete;
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
	public ArrayList<GiaSu> locDanhSach(String ten) {
		Connection conn =DBConnect.getConnection();
		String sql = "{CALL proc_TimKiemGS('"+ten+"')}";
		ArrayList<GiaSu> dsLoc = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				GiaSu gs =new GiaSu();
				gs.setMaGS(rs.getString("MaGS"));
				gs.setHoTen(rs.getString("HoTen"));
				gs.setGioiTinh(rs.getString("GioiTinh"));
				gs.setNgaySinh(rs.getString("NgaySinh"));
				gs.setDiaChi(rs.getString("DiaChi"));
				gs.setDienThoai(rs.getString("DienThoai"));
				gs.setGiongNoi(rs.getString("GiongNoi"));
				gs.setHinhAnh(rs.getBytes("HinhAnh"));
				//gs.setHinhAnh(rs.getString("HinhAnh"));
				gs.setNganhHoc(rs.getString("NganhHoc"));
				gs.setTrinhDo(rs.getString("TrinhDo"));
				gs.setNgheNghiep(rs.getString("NgheNghiep"));
				gs.setUuDiem(rs.getString("UuDiem"));
				gs.setMonDay(rs.getString("MonDay"));
				gs.setLopDay(rs.getString("LopDay"));
				gs.setLuongYauCauToiThieu(rs.getFloat("LuongYeuCauToiThieu"));	
				gs.setEmail(rs.getString("Email"));
				dsLoc.add(gs);
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
	public ArrayList<Lop> getLopDaDay(String mags) {
		Connection conn =DBConnect.getConnection();
		String sql = "select l.MaLop, l.LopDay, l.MonDay, l.ThoiGianDay, l.DiaChi from giasu gs, hoadon hd,"
				+ " lop l where gs.MaGS=hd.MaGS and l.MaLop=hd.MaLop and gs.MaGS='"+mags+"'";
		ArrayList<Lop> dsLopDaDay = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Lop lop = new Lop();
				lop.setMaLop(rs.getString("MaLop"));
				
				lop.setLopDay(rs.getString("LopDay"));
				lop.setMonDay(rs.getString("MonDay"));
				
				lop.setThoiGianDay(rs.getString("ThoiGianDay"));
				lop.setDiaChi(rs.getString("DiaChi"));
				
				dsLopDaDay.add(lop);
			}
		
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		return dsLopDaDay;
	}

	@Override
	public ArrayList<GiaSu> getDSGiaSuDKNhanLop(String malop) {
		Connection conn =DBConnect.getConnection();
		String sql = "select gs.HinhAnh, gs.MaGS, gs.HoTen, gs.TrinhDo from dangky dk, giasu gs " + 
				"where dk.MaLop='"+malop+"' and dk.MaGS=gs.MaGS";
		ArrayList<GiaSu> dsGS = new ArrayList<>();
		try
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				GiaSu gs = new GiaSu();
				gs.setHinhAnh(rs.getBytes("HinhAnh"));
				gs.setMaGS(rs.getString("MaGS"));
				gs.setHoTen(rs.getString("HoTen"));
				gs.setTrinhDo(rs.getString("TrinhDo"));
				dsGS.add(gs);
			}
		
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		return dsGS;
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
				//gs.setHinhAnh(rs.getString("HinhAnh"));
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
