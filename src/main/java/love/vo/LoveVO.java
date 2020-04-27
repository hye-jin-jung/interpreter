package love.vo;

public class LoveVO {
	
	private String userCode;	//내 유저코드 
	private String loverCode;	//내가 찜한 유저코드
								//두개 다 USER테이블 USER컬럼 FK참조
	public LoveVO() {}
	
	
	public LoveVO(String userCode, String loverCode) {
		super();
		this.userCode = userCode;
		this.loverCode = loverCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getLoverCode() {
		return loverCode;
	}

	public void setLoverCode(String loverCode) {
		this.loverCode = loverCode;
	}
	
	
	
}
