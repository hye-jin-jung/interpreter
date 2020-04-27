package employerBoard.vo;

public class EbSearch extends EbCriteria{	//사장 게시판 검색을 위한 클래스
	
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
		return super.toString() + "EbSearch [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	

}
