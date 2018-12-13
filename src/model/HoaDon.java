package model;

import java.util.Date;

public class HoaDon {
	
	public HoaDon() {
		super();
	}
	public HoaDon(String maHD, String maLop, String maGS, float tienLePhi, Date thoiGian) {
		super();
		this.maHD = maHD;
		this.maLop = maLop;
		this.maGS = maGS;
		this.tienLePhi = tienLePhi;
		this.thoiGian = thoiGian;
	}
	private String maHD;
	private String maLop;
	private String maGS;
	private float tienLePhi;
	private Date thoiGian;
	
	public String getMaHD() {
		return maHD;
	}
	public void setMaHD(String maHD) {
		this.maHD = maHD;
	}
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public String getMaGS() {
		return maGS;
	}
	public void setMaGS(String maGS) {
		this.maGS = maGS;
	}
	public float getTienLePhi() {
		return tienLePhi;
	}
	public void setTienLePhi(float tienLePhi) {
		this.tienLePhi = tienLePhi;
	}
	public Date getThoiGian() {
		return thoiGian;
	}
	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}
	
}
