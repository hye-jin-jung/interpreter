package bookMark.vo;

public class BookMarkVO {
	
	private String userCode;	//유저코드 FK
	private String bmkCode;	//북마크한 게시글코드
	
	
	public BookMarkVO() {}
	
	

	public BookMarkVO(String userCode, String bmkCode) {
		super();
		this.userCode = userCode;
		this.bmkCode = bmkCode;
	}



	public String getUserCode() {
		return userCode;
	}


	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getBmkCode() {
		return bmkCode;
	}


	public void setBmkCode(String bmkCode) {
		this.bmkCode = bmkCode;
	}
	
}
