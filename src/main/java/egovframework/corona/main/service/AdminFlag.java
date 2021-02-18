package egovframework.corona.main.service;

import java.util.Date;

public class AdminFlag {
	private String adminId;
	private String	rflag;
	private	int		lsno;
	private Date	readDate;
	private int 	ano;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getRflag() {
		return rflag;
	}
	public void setRflag(String rflag) {
		this.rflag = rflag;
	}
	public int getLsno() {
		return lsno;
	}
	public void setLsno(int lsno) {
		this.lsno = lsno;
	}
	public Date getReadDate() {
		return readDate;
	}
	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}

}
