package spms.vo;

public class Mountain {
	int mtno;
	String loc, mtname, trans, exp, locimg, loclink;
	
	public String getLocimg() {
		return locimg;
	}

	public Mountain setLocimg(String locimg) {
		this.locimg = locimg;
		return this;
	}

	public String getLoclink() {
		return loclink;
	}

	public Mountain setLoclink(String loclink) {
		this.loclink = loclink;
		return this;
	}

	public String getLoc() {
		return loc;
	}

	public Mountain setLoc(String loc) {
		this.loc = loc;
		return this;
	}

	public String getMtname() {
		return mtname;
	}

	public Mountain setMtname(String mtname) {
		this.mtname = mtname;
		return this;
	}

	public String getTrans() {
		return trans;
	}

	public Mountain setTrans(String trans) {
		this.trans = trans;
		return this;
	}

	public String getExp() {
		return exp;
	}

	public Mountain setExp(String exp) {
		this.exp = exp;
		return this;
	}

	public int getMtno() {
		return mtno;
	}

	public Mountain setMtno(int mtno) {
		this.mtno = mtno;
		return this;
	}

	
}
