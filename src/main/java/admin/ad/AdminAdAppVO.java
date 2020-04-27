package admin.ad;

public class AdminAdAppVO {
	
	int pageNo; //글번호
	String adAppNo; //광고 문의글 번호
	String userCode; //글 쓴 회원
	String enterprise; //업체명
	String image; //광고 이미지
	String adCategory; //업체 광고, 사장님, 알바생
	int adDate; //광고 기간일 수
	String link; //보여줄 블로그 주소
	String title; //광고글 제목
	String content; //광고글 내용
	String phone; //연락처
	String email; //이메일
	String regDate; //글 등록일
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getAdAppNo() {
		return adAppNo;
	}
	public void setAdAppNo(String adAppNo) {
		this.adAppNo = adAppNo;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getEnterprise() {
		return enterprise;
	}
	public void setEnterprise(String enterprise) {
		this.enterprise = enterprise;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAdCategory() {
		return adCategory;
	}
	public void setAdCategory(String adCategory) {
		this.adCategory = adCategory;
	}
	public int getAdDate() {
		return adDate;
	}
	public void setAdDate(int adDate) {
		this.adDate = adDate;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
