package admin.ad;

public class AdminAdVO {
	
	String adNo; //광고글 번호
	String adAppNo; //광고 문의글 번호(FK)
	String userCode; //글 쓴 회원
	String enterprise; //업체명
	String image; //광고 이미지
	String adcategory; //업체광고, 사장님, 알바생
	String start; //광고 시작일
	String end; //광고 종료일
	String link; //보여줄 링크 주소
	String title; //광고글 제목
	String regDate; //광고글 등록 날짜
	String address; //
	String salary; //
	
	public String getAdNo() {
		return adNo;
	}
	public void setAdNo(String adNo) {
		this.adNo = adNo;
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
	public String getAdcategory() {
		return adcategory;
	}
	public void setAdcategory(String adcategory) {
		this.adcategory = adcategory;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
}
