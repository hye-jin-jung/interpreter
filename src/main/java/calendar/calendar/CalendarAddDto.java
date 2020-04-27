package calendar.calendar;

public class CalendarAddDto {
	private String _id;
	private String description;
	private String start;
	private String end;
	private String type;
	private String username;
	private String backgroundColor;
	private String textColor;
	private String allDay;
	private String title;
	
	public CalendarAddDto() {}

	public CalendarAddDto(String _id, String description, String start, String end, String type, String username,
			String backgroundColor, String textColor, String allDay, String title) {
		super();
		this._id = _id;
		this.description = description;
		this.start = start;
		this.end = end;
		this.type = type;
		this.username = username;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
		this.title = title;
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "CalendarAddDto [_id=" + _id + ", description=" + description + ", start=" + start + ", end=" + end
				+ ", type=" + type + ", username=" + username + ", backgroundColor=" + backgroundColor + ", textColor="
				+ textColor + ", allDay=" + allDay + ", title=" + title + "]";
	}
	
}
