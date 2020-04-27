package calendar.calendar;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class CalendarDao {
	
	private SqlSessionTemplate sqlSessionTemplate;
	private CalendarDto calendarDto;

	public CalendarDao() {
	}
	
	

	public CalendarDao(SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.sqlSessionTemplate = sqlSessionTemplate;
	}


	public void setCalendarDao(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setCalendarDto(CalendarDto dto) {
		this.calendarDto = dto;
	}
	
	//메서드 부분 
	//캘린더 목록 DB에서 가져오기
	public List<CalendarDto> selectAll(String id) {	
		System.out.println("sqlSessionTemplate:" + sqlSessionTemplate);
		return sqlSessionTemplate.selectList("CalendarDao.selectCalList",id);
	}
	
	//DB에 캘린더 일정 추가 
	public void addCal(CalendarDto cal) {
		System.out.println("쿼리실행시작");
		
		sqlSessionTemplate.insert("CalendarDao.insertCal", cal);		
	}
	
	//DB에 캘린더 일정 수정
	public void updateCal(CalendarDto cal) {
		sqlSessionTemplate.update("CalendarDao.update",cal);
	}
	
	//DB에 캘린더 일정 삭제
	public void deleteCal(String data) {
		sqlSessionTemplate.delete("CalendarDao.delete", data);
	}
	
	//DB에 드롭된 날짜 수정
	public void dragNdrop(HashMap<String,Object> map) {
		sqlSessionTemplate.update("CalendarDao.dragNdrop", map);
	}

}
