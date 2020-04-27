package calendar.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import calendar.calendar.CalendarAddDto;
import calendar.calendar.CalendarDao;
import calendar.calendar.CalendarDto;


public class CalendarServiceImpl implements CalendarService {
	
	private CalendarDao calendarDao;

	public void setCalendarDao(CalendarDao calendarDao) {
		System.out.println("주입됨");
		this.calendarDao = calendarDao;
	}

	@Override
	public void updateService(CalendarAddDto calendarAddDto) {
		CalendarDto calendarDto = new CalendarDto();

		calendarDto.setUserCode(calendarAddDto.getUsername());
		calendarDto.setScheduleCode(calendarAddDto.get_id());
		calendarDto.setScheduleName(calendarAddDto.getTitle());
		calendarDto.setContents(calendarAddDto.getDescription());
		calendarDto.setStartDate(calendarAddDto.getStart());
		calendarDto.setEndDate(calendarAddDto.getEnd());
		calendarDto.setScheduleCategory(calendarAddDto.getType());
		calendarDto.setBackColor(calendarAddDto.getBackgroundColor());
		calendarDto.setFontColor(calendarAddDto.getTextColor());
		calendarDto.setAllDayCheck(calendarAddDto.getAllDay());

		calendarDao.updateCal(calendarDto);

	}

	@Override
	public String selectService(String id) {
		List<CalendarDto> list = calendarDao.selectAll(id);
		JSONArray jarray = new JSONArray();

		for (CalendarDto dtoList : list) {
			JSONObject json = new JSONObject();
			
			System.out.println("리스트확인"+dtoList.getScheduleCode());
			json.put("_id", dtoList.getScheduleCode());
			json.put("title", dtoList.getScheduleName());
			json.put("description", dtoList.getContents());
			json.put("start", dtoList.getStartDate());
			json.put("end", dtoList.getEndDate());
			json.put("type", dtoList.getScheduleCategory());
			json.put("username", dtoList.getUserCode());
			json.put("backgroundColor", dtoList.getBackColor());
			json.put("textColor", dtoList.getFontColor());
			json.put("allDay", dtoList.getAllDayCheck());

			jarray.add(json);

		}

		System.out.println(jarray.toJSONString());

		return jarray.toJSONString();
	}

	@Override
	public void addService(CalendarAddDto calendarAddDto) {
		CalendarDto calendarDto = new CalendarDto();

		calendarDto.setUserCode(calendarAddDto.getUsername());
		calendarDto.setScheduleCode(calendarAddDto.get_id());
		calendarDto.setScheduleName(calendarAddDto.getTitle());
		calendarDto.setContents(calendarAddDto.getDescription());
		calendarDto.setStartDate(calendarAddDto.getStart());
		calendarDto.setEndDate(calendarAddDto.getEnd());
		calendarDto.setScheduleCategory(calendarAddDto.getType());
		calendarDto.setBackColor(calendarAddDto.getBackgroundColor());
		calendarDto.setFontColor(calendarAddDto.getTextColor());
		calendarDto.setAllDayCheck(calendarAddDto.getAllDay());

		calendarDao.addCal(calendarDto);

	}

	@Override
	public void deleteService(String data) {
		calendarDao.deleteCal(data);
	}

	@Override
	public void dragNdrop(HashMap<String, Object> map) {
		calendarDao.dragNdrop(map);
		
	}

}
