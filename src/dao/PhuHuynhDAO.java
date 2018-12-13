package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;

import model.PhuHuynh;

public interface PhuHuynhDAO {
	//lay danh sach phu huynh
	public ArrayList<PhuHuynh> getListPhuHuynh();
	
	//lay phu huynh theo ma phu huynh
	public PhuHuynh getPhuHuynh(String maph);
	
	//them moi 1 phu huynh
	public boolean themPhuHuynh(PhuHuynh ph, String tendn, String matkhau) throws SQLException;
	
	//chinh sua phu huynh
	public boolean suaPhuHuynh(PhuHuynh ph) throws SQLException;
	
	//xoa phu huynh
	public boolean xoaPhuHuynh(String maph) throws SQLException;
	
	//tim kiem phu huynh theo ten phu huynh
	public Set<String> getDanhSachTheoTen();
	public ArrayList<PhuHuynh> locDanhSach(String ten);
	
	//
	public Set<String> getDanhSachTheoMaPH();
}
