package egovframework.corona.main.service;

import java.util.Date;

public class LReceiver {
	
	private String content;
	private String writer;
	private String receiver;
	private int lrno;
	private Date regdate;
	private Date readdate;
	private char rflag;
	private int	writerno;
	private int receiverno;
	private int lsno;
	private int rnum;

	
	public int getLsno() {
		return lsno;
	}
	public void setLsno(int lsno) {
		this.lsno = lsno;
	}
	public void setRflag(char rflag) {
		this.rflag = rflag;
	}

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
	public int getLrno() {
		return lrno;
	}
	public void setLrno(int lrno) {
		this.lrno = lrno;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getReaddate() {
		return readdate;
	}
	public void setReaddate(Date readdate) {
		this.readdate = readdate;
	}
	public char getRflag() {
		return rflag;
	}
	public void setRFLAG(char rflag) {
		this.rflag = rflag;
	}
	public int getWriterno() {
		return writerno;
	}
	public void setWriterno(int writerno) {
		this.writerno = writerno;
	}
	public int getReceiverno() {
		return receiverno;
	}
	public void setReceiverno(int receiverno) {
		this.receiverno = receiverno;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	
}
