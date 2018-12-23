package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;

import model.GiaSu;
import model.Lop;


public interface GiaSuDAO {
	//lay danh sach gia su
	public ArrayList<GiaSu> getListGiaSu();
	
	//lay gia su theo ma gia su
	public GiaSu getGiaSu(String mags);
	
	//them moi gia su
	public boolean themGiaSu(GiaSu gs) throws SQLException;
	
	//xoa gia su
	public boolean xoaGiaSu(String mags) throws SQLException;
	
	//tim kiem phu huynh theo ten phu huynh
	public Set<String> getDanhSachTheoTen();
	public ArrayList<GiaSu> locDanhSach(String ten);
	
	//lay cac lop da day
	public ArrayList<Lop> getLopDaDay(String mags);
	
	//lay danh sach gia su dang ky nhan lop
	public ArrayList<GiaSu> getDSGiaSuDKNhanLop(String malop);
}
