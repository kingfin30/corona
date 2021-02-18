package egovframework.corona.main.service;

import java.util.Date;

public class MContentVO {
	private int mno;
	private String writer;
	private String subject;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int contentbyte;
	private int rnum;
	private String right;
	private int ano;
	private String updater;
	private String updaterright;
	private int updateano;
	private String period;
	private int lno;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getRight() {
		return right;
	}
	public void setRight(String right) {
		this.right = right;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public String getUpdaterright() {
		return updaterright;
	}
	public void setUpdaterright(String updaterright) {
		this.updaterright = updaterright;
	}
	public int getUpdateano() {
		return updateano;
	}
	public void setUpdateano(int updateano) {
		this.updateano = updateano;
	}
	public int getContentbyte() {
		return contentbyte;
	}
	public void setContentbyte(int contentbyte) {
		this.contentbyte = contentbyte;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String toString(){
		return "[MContentVO] : "+ "[mno = "+ mno+ "], "+ "[writer = "+ writer+ "], "+ "[subject = "+ subject+ "], "+ "[content = "+ content+ "], " 
				+"[right = "+ right+ "], " + "[period = "+ period+ "], "+ "[regdate = "+ regdate+ "], "
				+ "[update = "+ updatedate+ "]";
	}
	

}
