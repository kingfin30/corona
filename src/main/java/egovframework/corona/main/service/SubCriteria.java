package egovframework.corona.main.service;

public class SubCriteria {
	private int mno;
	private int subPage;
	private int perSubPageNum;
	private int rowStart;
	private int rowEnd;
	
	public SubCriteria(){
		this.subPage = 1;
		this.perSubPageNum = 10;
	}
	public void setSubPage(int subPage) {
		if (subPage <= 0) {
			this.subPage = 1;
			return;
		}
		this.subPage = subPage;
	}
	public int getSubPage() {
		return subPage;
	}
	public void setPerSubPageNum(int perSubPageNum){
		if(perSubPageNum <=0 || perSubPageNum > 100){
			this.perSubPageNum = 10;
			return;
		}
		this.perSubPageNum = perSubPageNum;
	}
	public int getPerSubPageNum(){
		return perSubPageNum;
	}
	public int getPageStart(){
		return (this.subPage - 1) * perSubPageNum;
	}
	public int getRowStart() {
		rowStart = ((subPage - 1) * perSubPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perSubPageNum - 1;
		return rowEnd;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}


}
