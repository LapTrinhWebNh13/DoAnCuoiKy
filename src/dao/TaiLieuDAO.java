package dao;

import java.sql.SQLException;
import java.util.ArrayList;


import model.TaiLieu;

public interface TaiLieuDAO {
	//lay danh sach Tai lieu
	public ArrayList<TaiLieu> getListTaiLieu();
	
	//xoa tai lieu
	public boolean xoaTaiLieu(Integer maso) throws SQLException;
}
