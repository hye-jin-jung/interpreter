package myBlogErEe.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import chatMatching.vo.ReviewVo;
import myBlogErEe.spring.MyBlogErEeService;
import myBlogErEe.vo.CareerVo;
import myBlogErEe.vo.IntroductionVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MyBlogErEeController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyBlogErEeController.class);

    private MyBlogErEeService myBlogErEeService;
    
	public void setMyBlogErEeService(MyBlogErEeService myBlogErEeService){
		this.myBlogErEeService = myBlogErEeService;
	}
	

	@RequestMapping(value = "/myBlogEr/{blogMaster}")
	public String home(@PathVariable String blogMaster,
			HttpSession session, Model model) {
		 
		String myuserCode = (String)session.getAttribute("myuserCode");
		
		IntroductionVo erIntro = myBlogErEeService.getErIntroduction(blogMaster);
		List<ReviewVo> review = myBlogErEeService.getErReview(blogMaster);
		int avgStar = myBlogErEeService.getErStar(blogMaster);
		//System.out.println(erIntro.getContents());
		System.out.println(avgStar);
		model.addAttribute("blogMaster", blogMaster);		
		model.addAttribute("erIntro", erIntro);//model에 담음
		model.addAttribute("review", review);
		model.addAttribute("avgStar", avgStar);
		
		return "myBlogErEe/myBlogEr";
	}
	
	@RequestMapping(value = "/myBlogEe/{blogMaster}")
	public String myBlogEe(@PathVariable String blogMaster, HttpSession session,
							Model model) {

		List<ReviewVo> review = new ArrayList<ReviewVo>();
		List<CareerVo> career = new ArrayList<CareerVo>();
		IntroductionVo eeIntro = new IntroductionVo();
		
		String myuserCode = (String)session.getAttribute("myuserCode");
		eeIntro = myBlogErEeService.getEeIntroduction(blogMaster);	
		if(eeIntro != null) {
			career = myBlogErEeService.getCareer(eeIntro.getIntroductionCode());
			System.out.println(eeIntro.getContents());//e.getIntroductionCode()
		}
		review = myBlogErEeService.getEeReview(blogMaster);
		int avgStar = myBlogErEeService.getEeStar(blogMaster);

		System.out.println(avgStar);
		
		model.addAttribute("blogMaster", blogMaster);
		model.addAttribute("eeIntro", eeIntro);//model에 담음
		model.addAttribute("career", career);
		model.addAttribute("review", review);
		model.addAttribute("avgStar", avgStar);
		return "myBlogErEe/myBlogEe";
	}
	

	
}
