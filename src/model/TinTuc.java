package model;

public class TinTuc {
	private int maSo;
	private String tieuDe;
	private String noiDung;
	private int loai;
	private byte[] hinhAnh;
	
	public byte[] getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(byte[] hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public int getMaSo() {
		return maSo;
	}
	public void setMaSo(int maSo) {
		this.maSo = maSo;
	}
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public int getLoai() {
		return loai;
	}
	public void setLoai(int loai) {
		this.loai = loai;
	}
	public TinTuc(int maSo, String tieuDe, String noiDung, int loai, byte[] hinhAnh) {
		super();
		this.maSo = maSo;
		this.tieuDe = tieuDe;
		this.noiDung = noiDung;
		this.loai = loai;
		this.hinhAnh = hinhAnh;
	}
	public TinTuc() {
		super();
	}
	
	
}
