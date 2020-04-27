package calendar.service;

import java.util.HashMap;

import calendar.calendar.CalendarAddDto;
public interface CalendarService {
	
	void updateService(CalendarAddDto calendarAddDto);
	String selectService(String id);
	void addService(CalendarAddDto calendarAddDto);
	void deleteService(String data);
	void dragNdrop(HashMap<String,Object> map);
}
