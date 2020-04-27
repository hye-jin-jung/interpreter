package workerBoard.vo;

public class WbSearch extends WbCriteria{	//알바 게시판 검색을 위한 클래스
	
	private String searchType = "";
	private String keyword = "";
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return super.toString() + "WbSearch [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	

}
