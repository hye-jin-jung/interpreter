package calendar.calendar;

import java.util.Date;

public class CalendarDto {
	private String scheduleCode;
	private String userCode;
	private String scheduleName;
	private String contents;
	private String startDate;
	private String endDate;
	private String scheduleCategory;
	private String backColor;
	private String fontColor;
	private String allDayCheck;
	
	public CalendarDto() {
		super();
	}

	public CalendarDto(String scheduleCode, String userCode, String scheduleName, String contents, String startDate,
			String endDate, String scheduleCategory, String backColor, String fontColor, String allDayCheck) {
		super();
		this.scheduleCode = scheduleCode;
		this.userCode = userCode;
		this.scheduleName = scheduleName;
		this.contents = contents;
		this.startDate = startDate;
		this.endDate = endDate;
		this.scheduleCategory = scheduleCategory;
		this.backColor = backColor;
		this.fontColor = fontColor;
		this.allDayCheck = allDayCheck;
	}

	public String getScheduleCode() {
		return scheduleCode;
	}

	public void setScheduleCode(String scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getScheduleName() {
		return scheduleName;
	}

	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getScheduleCategory() {
		return scheduleCategory;
	}

	public void setScheduleCategory(String scheduleCategory) {
		this.scheduleCategory = scheduleCategory;
	}

	public String getBackColor() {
		return backColor;
	}

	public void setBackColor(String backColor) {
		this.backColor = backColor;
	}

	public String getFontColor() {
		return fontColor;
	}

	public void setFontColor(String fontColor) {
		this.fontColor = fontColor;
	}

	public String getAllDayCheck() {
		return allDayCheck;
	}

	public void setAllDayCheck(String allDayCheck) {
		this.allDayCheck = allDayCheck;
	}

	@Override
	public String toString() {
		return "CalendarDto [scheduleCode=" + scheduleCode + ", userCode=" + userCode + ", scheduleName=" + scheduleName
				+ ", contents=" + contents + ", startDate=" + startDate + ", endDate=" + endDate + ", scheduleCategory="
				+ scheduleCategory + ", backColor=" + backColor + ", fontColor=" + fontColor + ", allDayCheck="
				+ allDayCheck + "]";
	}
	
	
	
}