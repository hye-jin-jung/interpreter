package love.vo;

public class LoveVO {
	
	private String userCode;	//�� �����ڵ� 
	private String loverCode;	//���� ���� �����ڵ�
								//�ΰ� �� USER���̺� USER�÷� FK����
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
