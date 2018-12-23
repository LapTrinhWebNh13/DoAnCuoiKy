package dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;

import model.Lop;
import model.LopDK;


public interface LopDAO {
	//lay danh sach lop
	public ArrayList<Lop> getListLop();
	
	//lay lop theo ma lop
	public Lop getLop(String malop);
	
	//them moi 1 lop moi
	public boolean themLopMoi(Lop lop) throws SQLException;
	
	//xoa lop
	public boolean xoaLop(String malop) throws SQLException;
	
	//chinh sua lop
	public boolean suaLop(Lop lop) throws SQLException;
	
	//tim kiem phu huynh theo ten phu huynh
	public Set<String> getDanhSachTheoMaLop();
	public ArrayList<Lop> locDanhSach(String malop);
	
	//lay danh sach lop moi chua giao
	public ArrayList<Lop> getListLopMoi();
	
	//them dang ky lop
	public boolean themDangKyLop(LopDK lopdk) throws SQLException;
	
	
}
