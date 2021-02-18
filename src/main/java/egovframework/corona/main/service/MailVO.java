package egovframework.corona.main.service;

import java.util.Date;

public class MailVO {
	private int cmno;
	private String mailaddress;
	private String cbirth;
	private String cname;
	private String rnum;
	private Date regdate;
	
	public int getCmno() {
		return cmno;
	}
	public void setCmno(int cmno) {
		this.cmno = cmno;
	}
	public String getMailaddress() {
		return mailaddress;
	}
	public void setMailaddress(String mailaddress) {
		this.mailaddress = mailaddress;
	}
	public String getCbirth() {
		return cbirth;
	}
	public void setCbirth(String cbirth) {
		this.cbirth = cbirth;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String toString(){
		return "[MailVO] : "+ "[cmno = "+ cmno+ "], "+ "[cname = "+ cname+ "], "+ "[cbirth = "+ cbirth+ "], "+ "[mailaddress = "+ mailaddress+ "], "+ "[regdate = "+ regdate+ "] ";
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
}
