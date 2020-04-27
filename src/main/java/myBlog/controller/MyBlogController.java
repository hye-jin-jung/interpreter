package myBlog.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import employerBoard.vo.EmployerBoardVO;
import freeboard.vo.FreeBoardVo;
import join.member.MemberAdminVo;
import love.vo.LoveVO;
import myBlog.myBlog.BbomGeCmtVO;
import myBlog.myBlog.BbomGeVO;
import myBlog.myBlog.PageMaker;
import myBlog.myBlog.SearchCriteria;
import myBlog.service.MyBlogService;
import workerBoard.vo.WorkerBoardVO;

@Controller
public class MyBlogController {

	private MyBlogService myBlogService;
	private SqlSessionTemplate sqlSessionTemplate;
	String fileRoot = "d:\\dev\\upload\\";// 저장될 외부 파일 경로

	public void setMyBlogService(MyBlogService myBlogService) {
		this.myBlogService = myBlogService;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setFileRoot(String fileRoot) {
		this.fileRoot = fileRoot;
	}

	public MyBlogController(MyBlogService myBlogService, SqlSessionTemplate sqlSessionTemplate) {
		super();
		this.myBlogService = myBlogService;
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public MyBlogController() {
		super();
	}
	

	// 세션에서 아이디 얻어오기
	public String getUserId(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String myuserCode = (String) session.getAttribute("myuserCode");
		model.addAttribute("myuserCode", myuserCode);
		return myuserCode;
	}


	// 마이블로그 메인 창
	@RequestMapping("/myBlog/main/{blogMaster}")
	public String MyBlogMain(HttpServletRequest request, Model model, @PathVariable String blogMaster) {

		String myuserCode = getUserId(request, model);
		HttpSession session = request.getSession();
		session.setAttribute("blogMaster", blogMaster);

		MemberAdminVo userInfo = myBlogService.selectUserInfo(blogMaster);
		int userLoveInfo = myBlogService.selectUserLoveInfo(blogMaster);
				
		HashMap<String, Integer> myCount = new HashMap<String, Integer>();
		Integer loveCount = new Integer(myBlogService.selectLoveCount(blogMaster));
		Integer MarkCount = new Integer(myBlogService.selectMarkCount(blogMaster));
		Integer GesiCount = new Integer(myBlogService.selectGesiCount(blogMaster));
		myCount.put("loveCount", loveCount);
		myCount.put("MarkCount", MarkCount);
		myCount.put("GesiCount", GesiCount);

		List<String> html = myBlogService.selectHtml(blogMaster);
		
		if (!html.isEmpty()) {
			List<String> imgPath = new ArrayList<String>();

			for (String htmlOne : html) {
				Document doc = Jsoup.parse(htmlOne);
				Element src = doc.select("img").first();
				String imgLink = src.attr("src");// attr은 기본적으로 String형이다.
				imgPath.add(imgLink);
			}
			model.addAttribute("imgPath", imgPath);
		}
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("userLoveInfo", userLoveInfo);
		model.addAttribute("myCount", myCount);
		return "myBlog/main";
	}

	// 마이블로그내에서 내가 쓴 게시글 메뉴 클릭(내가 쓴 게시글 - 사장님 게시글)
	@RequestMapping("/myBlog/myContent/{blogMaster}")
	public String MyContent(HttpServletRequest request, Model model, @ModelAttribute("scri") SearchCriteria scri, @PathVariable String blogMaster) {
		HttpSession session = request.getSession();
		session.setAttribute("blogMaster", blogMaster);
		
		String searchType = scri.getSearchType();
		String keyword = scri.getKeyword();
		int rowStart = scri.getRowStart();
		int rowEnd = scri.getRowEnd();

		HashMap<String, Object> map = new HashMap<>();

		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("rowStart", rowStart);
		map.put("rowEnd", rowEnd);
		map.put("userCode", blogMaster);

		List<EmployerBoardVO> list = myBlogService.selectMyErContent(map);
		model.addAttribute("employerBoardList", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(myBlogService.listCountEr(map));
		model.addAttribute("pageMaker", pageMaker);

		return "myBlog/myContent";
	}

	// 내가 쓴 게시글 - 알바생 게시글
	@RequestMapping("/myBlog/myEeContent/{blogMaster}")
	public String myEeContent(HttpServletRequest request, Model model, @ModelAttribute("scri") SearchCriteria scri, @PathVariable String blogMaster) {
		HttpSession session = request.getSession();
		session.setAttribute("blogMaster", blogMaster);
		
		String searchType = scri.getSearchType();
		String keyword = scri.getKeyword();
		int rowStart = scri.getRowStart();
		int rowEnd = scri.getRowEnd();

		HashMap<String, Object> map = new HashMap<>();

		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("rowStart", rowStart);
		map.put("rowEnd", rowEnd);
		map.put("userCode", blogMaster);

		List<WorkerBoardVO> list = myBlogService.selectMyEeContent(map);
		model.addAttribute("workerBoardList", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(myBlogService.listCountEe(map));
		model.addAttribute("pageMaker", pageMaker);

		return "myBlog/myEeContent";
	}

	// 내가 쓴 게시글 - 자유게시판
	@RequestMapping("/myBlog/myFreeContent/{blogMaster}")
	public String myFreeContent(HttpServletRequest request, Model model, @ModelAttribute("scri") SearchCriteria scri, @PathVariable String blogMaster) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("blogMaster", blogMaster);

		String searchType = scri.getSearchType();
		String keyword = scri.getKeyword();
		int rowStart = scri.getRowStart();
		int rowEnd = scri.getRowEnd();

		HashMap<String, Object> map = new HashMap<>();

		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("rowStart", rowStart);
		map.put("rowEnd", rowEnd);
		map.put("writerCode", blogMaster);
		
		List<FreeBoardVo> list = myBlogService.selectMyFreeContent(map);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(myBlogService.listCountF(map));
		model.addAttribute("pageMaker", pageMaker);

		return "myBlog/myFreeContent";
	}

	// 뽐게에서 글쓰기 버튼 눌렀을때 작성폼으로 넘어가게 해주는 매핑
	@RequestMapping("/myBlog/bbomGeWrite")
	public String BbomGeWrite(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String myuserCode = (String) session.getAttribute("myuserCode");
		session.setAttribute("blogMaster", myuserCode);
		return "myBlog/bbomGeWriteForm";
	}

	// 뽐게 글 작성폼에서 등록 버튼 눌렀을 때, 실행되는 함수
	@RequestMapping("/myBlog/write")
	public String BbomGeWriteForm(HttpServletRequest request, Model model) {

		String myuserCode = getUserId(request, model);
		HttpSession session = request.getSession();
		session.setAttribute("myuserCode", myuserCode);

		String writerCode = getUserId(request, model);
		String title = request.getParameter("title");
		String contents = request.getParameter("content");

		myBlogService.bbomGeInsert(writerCode, title, contents);
		return "redirect:/myBlog/bbomGeMain/{myuserCode}";
	}

	// (에이젝스로)이미지 업로드 했을 때, 외부 리소스 경로에 파일 업로드
	@RequestMapping(value = "/myBlog/uploadSummernoteImageFile", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, Model model) {

		JSONObject jsonObject = new JSONObject();

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명 (UUID는 파일명의 중복 방지를 위해 랜덤 생성)

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.append("url", "/interHealthyPretty/summernoteImageBbomGe/" + savedFileName);
			jsonObject.append("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.append("responseCode", "error");
			e.printStackTrace();
		}

		return jsonObject.toString();
	}

	// 뽐게 글 목록 불러오는 함수 + 페이징 + 검색 (뽐게 메인)
	@RequestMapping(value = "/myBlog/bbomGeMain/{blogMaster}", method = RequestMethod.GET)
	public String BbomGeList(HttpServletRequest request, Model model,
			@ModelAttribute("scri") SearchCriteria scri, @PathVariable String blogMaster) throws Exception {

		String searchType = scri.getSearchType();
		String keyword = scri.getKeyword();
		int rowStart = scri.getRowStart();
		int rowEnd = scri.getRowEnd();

		HashMap<String, Object> map = new HashMap<>();

		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("rowStart", rowStart);
		map.put("rowEnd", rowEnd);
		map.put("writerCode", blogMaster);
		List<BbomGeVO> list = myBlogService.listSearchB(map);
		
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(myBlogService.countSearchB(map));
		model.addAttribute("pageMaker", pageMaker);
		return "myBlog/bbomGeMain";
	}

	// 선택한 뽐게 글 불러오는 함수
	@RequestMapping("/myBlog/contentView")
	public String contentView(HttpServletRequest request, Model model) {
		String showCode = request.getParameter("showCode");
		blogupHit(showCode); // 조회수 1 올리고 시작
		model.addAttribute("request", request);
		BbomGeVO content = myBlogService.bbomGeContent(showCode);
		model.addAttribute("content", content);

		return "myBlog/bbomGeContent";
	}

	// 글 선택 후 조회수 올리는 함수
	public void blogupHit(String showCode) {
		sqlSessionTemplate.update("blogupHit", showCode);
	}

	// 컨텐츠 페이지에서 수정 버튼 누르면 수정폼으로 이동시켜주는 함수
	@RequestMapping(value = "/myBlog/bbomGeModify")
	public String contentModify(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String myuserCode = (String) session.getAttribute("myuserCode");
		session.setAttribute("blogMaster", myuserCode);
		
		String showCode = request.getParameter("showCode");
		BbomGeVO content = myBlogService.bbomGeContent(showCode);
		model.addAttribute("content", content);

		return "myBlog/bbomGeModifyForm";
	}

	// 뽐게 글 수정하는 함수
	@RequestMapping("/myBlog/modify")
	public String bbomGeModifyForm(HttpServletRequest request, Model model) {

		String myuserCode = getUserId(request, model);
		HttpSession session = request.getSession();
		session.setAttribute("myuserCode", myuserCode);

		String showCode = request.getParameter("showCode");
		String title = request.getParameter("title");
		String contents = request.getParameter("content");

		BbomGeVO content = myBlogService.bbomGeUpdate(showCode, title, contents);
		model.addAttribute("content", content);

		return "redirect:/myBlog/bbomGeMain/{myuserCode}";
	}

	// 뽐게 글 삭제하는 함수
	@RequestMapping("/myBlog/delete")
	public String contentDelete(HttpServletRequest request, Model model) {

		String myuserCode = getUserId(request, model);
		HttpSession session = request.getSession();
		session.setAttribute("myuserCode", myuserCode);

		String showCode = request.getParameter("showCode");
		myBlogService.bbomGeDelete(showCode);

		return "redirect:/myBlog/bbomGeMain/{myuserCode}";
	}

	// 댓글 등록
	@RequestMapping("/myBlog/addComment")
	@ResponseBody
	public String addComment(HttpServletRequest request, BbomGeCmtVO vo, Model model) throws Exception {
//		String myuserCode = getUserId(request, model);
//
//		if (myuserCode == null) {
//			return "login/login";
//		}
//
//		vo.setUserCode(myuserCode);
		myBlogService.bbomGeCmtInsert(vo);

		return "success";
	}

	// 댓글 리스트 읽어오기
	@RequestMapping("/myBlog/commentList")
	public String commentList(@RequestBody String articleCode, HttpServletRequest request, Model model)
			throws Exception {
		String myuserCode = getUserId(request, model);
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		List<BbomGeCmtVO> commentVO = myBlogService.bbomGeSelectCmt(articleCode);

		// 해당 게시물 댓글
		if (commentVO.size() > 0) {
			for (int i = 0; i < commentVO.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("num", commentVO.get(i).getNum());
				hm.put("userCode", commentVO.get(i).getUserCode());
				hm.put("comment", commentVO.get(i).getComments());
				hm.put("registDate", commentVO.get(i).getRegistDate());

				hmlist.add(hm);
			}
		}
		
		model.addAttribute("hmlist", hmlist);

		return "myBlog/commentView";
	}

	
	// 수정한 댓글 데이터베이스에 입력
	@RequestMapping(value="/myBlog/modifyCmt")
	@ResponseBody
	public String modifyCmt(HttpServletRequest request, @RequestBody BbomGeCmtVO vo, Model model) throws Exception {
		System.out.println("컨트롤러 옴");
		int a = vo.getNum();
		String b = vo.getComments();
		System.out.println(a+b);
		String myuserCode = getUserId(request, model);

		if (myuserCode == null) {
			return "login/login";
		}

		vo.setUserCode(myuserCode);
		myBlogService.bbomGeCmtUpdate(vo);

		return "success";
	}

	// 댓글 삭제하기

	@RequestMapping("/myBlog/deleteCmt")
	@ResponseBody
	public String deleteCmt(HttpServletRequest request, @RequestBody BbomGeCmtVO vo) throws Exception {

		myBlogService.bbomGeCmtDelete(vo);

		return "success";
	}

}
