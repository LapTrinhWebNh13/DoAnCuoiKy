package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import model.HoaDon;
import model.LopDK;


public interface HoaDonDAO {
	//lay danh sach hoa don
	public ArrayList<HoaDon> getListHoaDon();
	
	//lay danh sach lop co gia su dang ky
	public ArrayList<LopDK> getListDangKy();
	
	//xoa hoa don
	public boolean xoaHoaDon(String mahd) throws SQLException;
	
	//them hoa don
	public boolean themHoaDon(HoaDon hd) throws SQLException;
}
