package bookMark.vo;

public class BookMarkVO {
	
	private String userCode;	//�����ڵ� FK
	private String bmkCode;	//�ϸ�ũ�� �Խñ��ڵ�
	
	
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
