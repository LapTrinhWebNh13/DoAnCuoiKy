package model;


public class GiaSu {	
	
	
	
	public GiaSu() {
		super();
	}
	public GiaSu(String maGS, String hoTen, String ngaySinh, String gioiTinh, String diaChi, String dienThoai,
			String giongNoi, byte[] hinhAnh, String nganhHoc, String trinhDo, String ngheNghiep,
			String uuDiem, String monDay, String lopDay, float luongYauCauToiThieu, String email) {
		super();
		this.maGS = maGS;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.dienThoai = dienThoai;
		this.giongNoi = giongNoi;
		this.hinhAnh = hinhAnh;
		this.nganhHoc = nganhHoc;
		this.trinhDo = trinhDo;
		this.ngheNghiep = ngheNghiep;
		this.uuDiem = uuDiem;
		this.monDay = monDay;
		this.lopDay = lopDay;
		this.luongYauCauToiThieu = luongYauCauToiThieu;
		this.email = email;
	}
	private String maGS;
	private String hoTen;
	private String ngaySinh;
	private String gioiTinh;
	private String diaChi;
	private String dienThoai;
	private String giongNoi;
	private byte[] hinhAnh;
	//private String hinhAnh;
	
	private String nganhHoc;
	private String trinhDo;
	private String ngheNghiep;
	private String uuDiem;
	private String monDay;
	private String lopDay;
	private float luongYauCauToiThieu;
	private String email;
	public String getMaGS() {
		return maGS;
	}
	public void setMaGS(String maGS) {
		this.maGS = maGS;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getDienThoai() {
		return dienThoai;
	}
	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}
	public String getGiongNoi() {
		return giongNoi;
	}
	public void setGiongNoi(String giongNoi) {
		this.giongNoi = giongNoi;
	}
	

	public String getNganhHoc() {
		return nganhHoc;
	}
	public void setNganhHoc(String nganhHoc) {
		this.nganhHoc = nganhHoc;
	}
	public String getTrinhDo() {
		return trinhDo;
	}
	public void setTrinhDo(String trinhDo) {
		this.trinhDo = trinhDo;
	}
	public String getNgheNghiep() {
		return ngheNghiep;
	}
	public void setNgheNghiep(String ngheNghiep) {
		this.ngheNghiep = ngheNghiep;
	}
	public String getUuDiem() {
		return uuDiem;
	}
	public void setUuDiem(String uuDiem) {
		this.uuDiem = uuDiem;
	}
	public String getMonDay() {
		return monDay;
	}
	public void setMonDay(String monDay) {
		this.monDay = monDay;
	}
	public String getLopDay() {
		return lopDay;
	}
	public void setLopDay(String lopDay) {
		this.lopDay = lopDay;
	}
	public float getLuongYauCauToiThieu() {
		return luongYauCauToiThieu;
	}
	public void setLuongYauCauToiThieu(float luongYauCauToiThieu) {
		this.luongYauCauToiThieu = luongYauCauToiThieu;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public byte[] getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(byte[] hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
}
