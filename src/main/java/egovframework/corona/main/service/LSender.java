package egovframework.corona.main.service;

import java.util.Date;

public class LSender {

	private String content;
	private String writer;
	private String receiver;
	private int lsno;
	private Date regdate;
	private char rflag;
	private int writerno;
	private int rnum;


	
	

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public int getLsno() {
		return lsno;
	}
	public void setLsno(int lsno) {
		this.lsno = lsno;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public char getRflag() {
		return rflag;
	}
	public void setRflag(char rflag) {
		this.rflag = rflag;
	}
	public int getWriterno() {
		return writerno;
	}
	public void setWriterno(int writerno) {
		this.writerno = writerno;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	
	

}
