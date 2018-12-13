package model;


public class LopDK {
	public LopDK() {
		super();
	}
	public LopDK(Lop lop, GiaSu gs) {
		super();
		this.lop = lop;
		this.gs = gs;
	}
	private Lop lop;
	private GiaSu gs;
	public Lop getLop() {
		return lop;
	}
	public void setLop(Lop lop) {
		this.lop = lop;
	}
	public GiaSu getGs() {
		return gs;
	}
	public void setGs(GiaSu gs) {
		this.gs = gs;
	}
}
