package model;

public class PhuHuynh {
	public PhuHuynh() {
		super();
	}
	public PhuHuynh(String maPH, String hoTen, String diaChi, String dienThoai, String email) {
		super();
		this.maPH = maPH;
		this.hoTen = hoTen;
		DiaChi = diaChi;
		DienThoai = dienThoai;
		Email = email;
	}
	
	public PhuHuynh(String maPH)
	{
		this.maPH = maPH;
	}
	
	private String maPH;
	private String hoTen;
	private String DiaChi;
	private String DienThoai;
	private String Email;
	
	public String getMaPH() {
		return maPH;
	}
	public void setMaPH(String maPH) {
		this.maPH = maPH;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getDienThoai() {
		return DienThoai;
	}
	public void setDienThoai(String dienThoai) {
		DienThoai = dienThoai;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
}
