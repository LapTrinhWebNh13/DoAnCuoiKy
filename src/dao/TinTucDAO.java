package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.TinTuc;

public interface TinTucDAO {
	//insert Tin tuc
	public boolean themTinTuc(TinTuc a) throws SQLException;
	
	//get danh sach tin tuc
	public ArrayList<TinTuc> getListTinTuc();
	
	//xoa tin tuc
	public boolean xoaTinTuc(Integer maso) throws SQLException;
	
	//get tin tuc
	public ArrayList<TinTuc> getTinTuc();
	
	//get tuyen dung
	public ArrayList<TinTuc> getTuyenDung();
}
