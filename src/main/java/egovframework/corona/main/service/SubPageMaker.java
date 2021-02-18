package egovframework.corona.main.service;



import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class SubPageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private SubCriteria sucri;
	private int totalPage;

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	
	
	public void setSucri(SubCriteria sucri) {
		this.sucri = sucri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public SubCriteria getsucri() {
		return sucri;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(sucri.getSubPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)sucri.getPerSubPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * sucri.getPerSubPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int subPage) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
							.queryParam("mno", sucri.getMno())
						    .queryParam("subPage", subPage)
							.queryParam("perSubPageNum", sucri.getPerSubPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}

	

}