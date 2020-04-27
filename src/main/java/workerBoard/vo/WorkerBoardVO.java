package workerBoard.vo;

public class WorkerBoardVO {
	
	private int num;
	private String wbCode;
	private String userCode;
	private String regDate;
	private String title;
	private String address;
	private double lat;
	private double lng;
	private String workStart;
	private String workEnd;
	private String workTime;
	private int salary;
	private String job;
	private int age;
	private String deadline;
	private String content;
	private int count;
	private char timeover;
	
	public WorkerBoardVO() {}

	public WorkerBoardVO(String title, String address, double lat, double lng, String workStart, String workEnd,
			String workTime, int salary, String job, int age, String deadline, String content, int count) {
		super();
		this.title = title;			//제목
		this.address = address;		//주소
		this.lat = lat;				//위도
		this.lng = lng;				//경도
		this.workStart = workStart;	//근무시작일
		this.workEnd = workEnd;		//근무종료일
		this.workTime = workTime;	//근무시간대
		this.salary = salary;		//급여
		this.job = job;				//업직종
		this.age = age;				//나이
		this.deadline = deadline;	//공고마감일
		this.content = content;		//내용
		this.count = count;			//조회수
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWbCode() {
		return wbCode;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public void setWbCode(String wbCode) {
		this.wbCode = wbCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getWorkStart() {
		return workStart;
	}

	public void setWorkStart(String workStart) {
		this.workStart = workStart;
	}

	public String getWorkEnd() {
		return workEnd;
	}

	public void setWorkEnd(String workEnd) {
		this.workEnd = workEnd;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public char getTimeover() {
		return timeover;
	}

	public void setTimeover(char timeover) {
		this.timeover = timeover;
	}
	
}
