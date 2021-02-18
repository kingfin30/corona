package egovframework.corona.main.service;

public class ListMaker {
	private int listNum=10;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		if (listNum <= 0 || listNum > 100) {
			this.listNum = 10;
			return;
		}
		
		this.listNum = listNum;
	}

}
