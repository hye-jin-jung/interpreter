package calendar.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import calendar.calendar.CalendarAddDto;
import calendar.service.CalendarService;

@Controller /* Spring mvc에서 컨트롤러로 사용하겠다고 선언 */
public class HelloController {
	CalendarService calendarService;

	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

	@RequestMapping("/calendar/index")
	public String index(HttpServletRequest request, Model model) {
		System.out.println("옴");
		HttpSession session = request.getSession();
	    model.addAttribute("myuserCode",session.getAttribute("mysuerCode"));

		return "calendar/index";

	}

	
	@RequestMapping(value = "/calendar/test", produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String hello(@RequestBody String id) {
		
		System.out.println(id);
		String data = calendarService.selectService(id);
	
		return data;

	}

	@RequestMapping(value="/calendar/add", method=RequestMethod.POST)
	@ResponseBody
	public String add(@RequestBody CalendarAddDto cal) {
		calendarService.addService(cal);
		
		return "calendar/index";
	}

	@RequestMapping(value = "/calendar/update", method = RequestMethod.POST)
	@ResponseBody
	public String update(@RequestBody CalendarAddDto cal) {
		System.out.println("업데이트데이터 왔음");
		System.out.println(cal.toString());
		calendarService.updateService(cal);

		return "calendar/index";
	}
	
	@RequestMapping(value = "/calendar/delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestBody String data) {
		System.out.println("삭제데이터 왔음 ");
		System.out.println(data);
		
		calendarService.deleteService(data);
		
		return "calendar/index";
	}
	
	@RequestMapping(value = "/calendar/drop", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestBody HashMap<String,Object> map) {
		System.out.println("드롭 날짜 수정 데이터 왔음");
		System.out.println(map.toString());
		
		HashMap<String,Object> changeMap = new HashMap<String,Object>();
		changeMap.put("startDate", map.get("start"));
		changeMap.put("endDate", map.get("end"));
		changeMap.put("scheduleCode", map.get("_id"));
		
		calendarService.dragNdrop(changeMap);
		
		return "calendar/index";
	}

}
