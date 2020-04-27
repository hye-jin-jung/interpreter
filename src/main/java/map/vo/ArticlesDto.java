package map.vo;

public class ArticlesDto {
	
	private String ebcode;
	private String wbcode;
	private String title;
	private String usercode; 
	private String workstart; 
	private String workend;
	
	public ArticlesDto() {

	}




	public ArticlesDto(String ebcode, String wbcode, String title, String usercode, String workstart, String workend) {
		super();
		this.ebcode = ebcode;
		this.wbcode = wbcode;
		this.title = title;
		this.usercode = usercode;
		this.workstart = workstart;
		this.workend = workend;
	}



	public String getEbcode() {
		return ebcode;
	}






	public void setEbcode(String ebcode) {
		this.ebcode = ebcode;
	}






	public String getWbcode() {
		return wbcode;
	}






	public void setWbcode(String wbcode) {
		this.wbcode = wbcode;
	}






	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}




	public String getUsercode() {
		return usercode;
	}




	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}




	public String getWorkstart() {
		return workstart;
	}




	public void setWorkstart(String workstart) {
		this.workstart = workstart;
	}




	public String getWorkend() {
		return workend;
	}




	public void setWorkend(String workend) {
		this.workend = workend;
	}


	
	
	
	
	
	
	
	
	
}
