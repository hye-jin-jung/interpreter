package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminController {
	
	AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("/admin")
	public String admin() {
		
		return "admin/adminLogIn";
	}
	
	@RequestMapping(value="/admin/LogIn", method=RequestMethod.POST)
	public String adminLogIn(AdminVO vo, HttpServletRequest request, RedirectAttributes rdat) {
		
		HttpSession session = request.getSession();
		
		AdminVO loginCheck = adminService.adminLogIn(vo);
		
		if(loginCheck == null) {
			session.setAttribute("admin", null);
			rdat.addFlashAttribute("message", false);
		} else {
			session.setAttribute("admin", loginCheck);
			session.setAttribute("myuserCode", vo.getAdminID());
		}
		
		return "redirect:/admin/user/1";
		
	}
	
	@RequestMapping(value="/admin/LogOut")
	public String adminLogOut(HttpSession session) {
		
		session.invalidate();

		return "redirect:/admin";
		
	}
	
}
