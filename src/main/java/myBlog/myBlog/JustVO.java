package myBlog.myBlog;

public class JustVO {
	
	private String writerCode;
	private String keyword;
	private int rowStart;
	private int rowEnd;
	private String searchType;
	
	
	
	
	
	public JustVO() {
		
	}
	
	public JustVO(String writerCode, String keyword, int rowStart, int rowEnd, String searchType) {
		super();
		this.writerCode = writerCode;
		this.keyword = keyword;
		this.rowStart = rowStart;
		this.rowEnd = rowEnd;
		this.searchType = searchType;
	}
	
	public String getWriterCode() {
		return writerCode;
	}
	public void setWriterCode(String writerCode) {
		this.writerCode = writerCode;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getRowStart() {
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public int getRowEnd() {
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	
	
	
	
	
}
