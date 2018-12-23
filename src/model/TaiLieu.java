package model;

public class TaiLieu {
	private int maSo;
	private String tieuDe;
	private String fileName;
	private String path;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public TaiLieu(int maSo, String tieuDe, String fileName, String path) {
		super();
		this.maSo = maSo;
		this.tieuDe = tieuDe;
		this.fileName = fileName;
		this.path = path;
	}
	public TaiLieu() {
		super();
	}
	
}
