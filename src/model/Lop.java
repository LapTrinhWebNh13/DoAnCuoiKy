package model;

public class Lop {
		
	public Lop() {
		super();
	}
	public Lop(String maLop, String maPH, String lopDay, String monDay, int soBuoi, int soLuongHS, String hocLucHienTai,
			String thoiGianDay, String diaChi, float luong, float mucPhi, String yeuCau, int trangThai) {
		super();
		this.maLop = maLop;
		this.maPH = maPH;
		this.lopDay = lopDay;
		this.monDay = monDay;
		this.soBuoi = soBuoi;
		this.soLuongHS = soLuongHS;
		this.hocLucHienTai = hocLucHienTai;
		this.thoiGianDay = thoiGianDay;
		this.diaChi = diaChi;
		this.luong = luong;
		this.mucPhi = mucPhi;
		this.yeuCau = yeuCau;
		this.trangThai = trangThai;
	}
	private String maLop;
	private String maPH;
	private String lopDay;
	private String monDay;
	private int soBuoi;
	private int soLuongHS;
	private String hocLucHienTai;
	private String thoiGianDay;
	private String diaChi;
	private float luong;
	private float mucPhi;
	private String yeuCau;
	private int trangThai;
	
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public String getMaPH() {
		return maPH;
	}
	public void setMaPH(String maPH) {
		this.maPH = maPH;
	}
	public String getLopDay() {
		return lopDay;
	}
	public void setLopDay(String lopDay) {
		this.lopDay = lopDay;
	}
	public String getMonDay() {
		return monDay;
	}
	public void setMonDay(String monDay) {
		this.monDay = monDay;
	}
	public int getSoBuoi() {
		return soBuoi;
	}
	public void setSoBuoi(int soBuoi) {
		this.soBuoi = soBuoi;
	}
	public int getSoLuongHS() {
		return soLuongHS;
	}
	public void setSoLuongHS(int soLuongHS) {
		this.soLuongHS = soLuongHS;
	}
	public String getHocLucHienTai() {
		return hocLucHienTai;
	}
	public void setHocLucHienTai(String hocLucHienTai) {
		this.hocLucHienTai = hocLucHienTai;
	}
	public String getThoiGianDay() {
		return thoiGianDay;
	}
	public void setThoiGianDay(String thoiGianDay) {
		this.thoiGianDay = thoiGianDay;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public float getLuong() {
		return luong;
	}
	public void setLuong(float luong) {
		this.luong = luong;
	}
	public float getMucPhi() {
		return mucPhi;
	}
	public void setMucPhi(float mucPhi) {
		this.mucPhi = mucPhi;
	}
	public String getYeuCau() {
		return yeuCau;
	}
	public void setYeuCau(String yeuCau) {
		this.yeuCau = yeuCau;
	}
	public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	
	
}
