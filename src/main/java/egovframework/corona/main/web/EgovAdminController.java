package egovframework.corona.main.web;

import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.corona.main.service.AdminloginService;
import egovframework.corona.main.service.AdminloginVO;
import egovframework.corona.main.service.ConfirmService;
import egovframework.corona.main.service.ConfirmVO;

import egovframework.corona.main.service.Days7;
import egovframework.corona.main.service.Locality;
import egovframework.corona.main.service.NewForm;
import egovframework.corona.main.service.PageMaker;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.corona.main.service.TableBoy;
import egovframework.corona.main.service.TableMaker;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class EgovAdminController {
	private static final Logger logger = LoggerFactory.getLogger(EgovAdminLoginController.class);
	
	@Resource(name="adminLoginService")
	private AdminloginService service;
	
	@Resource(name="confirmService")
	private ConfirmService confirmService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@RequestMapping(value="x.do")
	public String x(){
		return "/admin/pwCheck";
	}


	 @RequestMapping(value="/admin.do")
	 public String admin(HttpServletRequest req,RedirectAttributes rttr, ConfirmVO confirmVO, Model model) throws Exception{
		
		 
			HttpSession session = req.getSession();
			TableMaker tb = new TableMaker();
			Days7 days = new Days7();
			Locality lc = new Locality();
			TableBoy t = new TableBoy();
			
	/*
			t.setC0(confirmService.select_0("확진"));t.setD0(confirmService.select_0("사망"));t.setR0(confirmService.select_0("해제"));
			t.setC1(confirmService.select_1("확진"));t.setD1(confirmService.select_1("사망"));t.setR1(confirmService.select_1("해제"));
			t.setC2(confirmService.select_2("확진"));t.setD2(confirmService.select_2("사망"));t.setR2(confirmService.select_2("해제"));
			t.setC3(confirmService.select_3("확진"));t.setD3(confirmService.select_3("사망"));t.setR3(confirmService.select_3("해제"));
			t.setC4(confirmService.select_4("확진"));t.setD4(confirmService.select_4("사망"));t.setR4(confirmService.select_4("해제"));
			t.setC5(confirmService.select_5("확진"));t.setD5(confirmService.select_5("사망"));t.setR5(confirmService.select_5("해제"));
			t.setC6(confirmService.select_6("확진"));t.setD6(confirmService.select_6("사망"));t.setR6(confirmService.select_6("해제"));
			*/
			model.addAttribute("lc",lc);
			model.addAttribute("t",t);
		
			tb.setiConfirm(confirmService.confirms(confirmVO));
			tb.setiRealese(confirmService.releases(confirmVO));
			tb.setiDead(confirmService.deads(confirmVO));
			tb.setSumDead(confirmService.selectSumDeads(confirmVO));
			tb.setSumRelease(confirmService.selectSumReleases(confirmVO));
			tb.setSumConfirm(confirmService.selectSumConfirms(confirmVO));
		/*
			tb.setDay0(confirmService.selectDay_0(confirmVO));
			tb.setDay1(confirmService.selectDay_1(confirmVO));
			tb.setDay2(confirmService.selectDay_2(confirmVO));
			tb.setDay3(confirmService.selectDay_3(confirmVO));
			tb.setDay4(confirmService.selectDay_4(confirmVO));
			tb.setDay5(confirmService.selectDay_5(confirmVO));
			tb.setDay6(confirmService.selectDay_6(confirmVO));
*/
			
			confirmService.updateDays(days);
			/*
			days.setD0(confirmService.Day0());
			days.setD1(confirmService.Day1());
			days.setD2(confirmService.Day2());
			days.setD3(confirmService.Day3());
			days.setD4(confirmService.Day4());
			days.setD5(confirmService.Day5());
			days.setD6(confirmService.Day6());
		
	*/
			
			model.addAttribute("days", days);
			model.addAttribute("ctable", tb);
			if(session.getAttribute("member")!=null){
		
				return "/admin/main";
			}else{
				  rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";	
			}
		 
	 }
	 @RequestMapping(value="/adminList.do", method= RequestMethod.GET)
	 public String adminList(AdminloginVO vo, HttpServletRequest req,RedirectAttributes rttr, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception {
		 	logger.info("adminList");
		 	
			HttpSession session = req.getSession();
			if(session.getAttribute("member")!=null){
				if((session.getAttribute("member")).equals("admin")){
					model.addAttribute("adminList", service.adminList(scri));
					PageMaker pageMaker2 = new PageMaker();
					pageMaker2.setCri(scri);
					pageMaker2.setTotalCount(service.adminListCount(scri));
					pageMaker2.setTotalPage((int)Math.ceil(((float)service.adminListCount(scri)/scri.getPerPageNum())));
					pageMaker2.setCheck(service.checkcheck(vo));
					model.addAttribute("pageMaker",pageMaker2);
					model.addAttribute("read",service.adminRead(vo.getAno()));
				
					return "/admin/adminList";
				}else{
					rttr.addFlashAttribute("adminmsg", "최고관리자만 접근 가능합니다.");
					return "redirect:/admin.do";
				}
			}else{
				  rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";	
			}
		 
	 }
	 @RequestMapping(value="/adminView.do", method= RequestMethod.GET)
	 public String adminView(AdminloginVO vo, HttpServletRequest req,RedirectAttributes rttr, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception {
		 	logger.info("adminView");
		 	
			HttpSession session = req.getSession();
			if(session.getAttribute("member")!=null){
				if((session.getAttribute("member")).equals("admin")){
			
					model.addAttribute("adminView", service.adminList(scri));
					PageMaker pageMaker2 = new PageMaker();
					
					pageMaker2.setCri(scri);
					pageMaker2.setTotalCount(service.adminListCount(scri));
					pageMaker2.setTotalPage((int)Math.ceil(((float)service.adminListCount(scri)/scri.getPerPageNum())));
				
					model.addAttribute("pageMaker",pageMaker2);
				
					return "/admin/adminMake";
					
				}else{
					rttr.addFlashAttribute("adminmsg", "최고관리자만 접근 가능합니다.");
					return "redirect:/admin.do";					
				}
			}else{
				rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

				return "redirect:/login.do";	
				
			}
		 
	 }
	 @RequestMapping(value = "/make.do", method = RequestMethod.POST)
		public String make( HttpServletRequest req, RedirectAttributes rttr)throws Exception{
			logger.info("make");
			AdminloginVO vo = new AdminloginVO();
			
		
			vo.setAdminId(req.getParameter("adminId"));
			vo.setAdminName(req.getParameter("adminName"));
			vo.setAdminPassword(req.getParameter("adminPassword"));
			vo.setAmail(req.getParameter("mailf")+"@"+req.getParameter("mailb"));
			vo.setAcontact(req.getParameter("contact1")+"-"+ req.getParameter("contact2")+"-" + req.getParameter("contact3"));
			vo.setRight("일반관리자");
			int result=service.idChk(vo);
			try{
				if(result ==1){
					return "/admin/adminMake";
				}else if(result ==0){
					service.adminSignUp(vo);
				}
			}catch (Exception e){
				throw new RuntimeException();
			}
			return "redirect:/adminList.do";
	
		
		
			
		}
	 /*@RequestMapping(value="/idCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	 public String idCheck(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr)throws Exception{
	
		 HttpSession session = request.getSession();
		 
		 if(session.getAttribute("member")!=null){
			 String adminId = request.getParameter("adminId");
			 int result = service.confirmId(adminId);
			 System.out.println("adminId: "+ adminId + ", result= " + result);
			 request.setAttribute("adminId", adminId);
			 request.setAttribute("result", result);
		 }else{
			 rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

			 return "redirect:/login.do";	
		 }
		 

		 
		return "/admin/idCheck";
		 
	 }*/
	 
	 /*@ResponseBody
	 @RequestMapping(value = "/idCheck.do", produces="text/plane")
		public String ID_Check(@RequestBody String paramData) throws ParseException, Exception{
			//클라이언트가 보낸 ID값
			String ID = paramData.trim();
			System.out.println(ID);
			 
			 int result = service.confirmId(ID);
			 System.out.println(result);
			if(result != 0) {//결과 값이 있으면 아이디 존재	
				return "N";
			} else {		//없으면 아이디 존재 X
				System.out.println("null");
				return "Y";
			}
		}*/
	 
	 //패스워드 체크
	 @ResponseBody
	 @RequestMapping(value="/passChk.do", method=RequestMethod.POST)
	 public int passChk(AdminloginVO vo, HttpServletRequest req) throws Exception{
		 HttpSession session = req.getSession();
		 vo.setAdminId((String)session.getAttribute("member"));
		 int result = service.passChk(vo);
		 if(result == 1){
			 session.setAttribute("pwCheck", "Y");
		 }
		 return result;
	 }
	 //아이디 중복 체크
	 @ResponseBody
	 @RequestMapping(value="/idChk.do", method=RequestMethod.POST)
	 public int idChk(AdminloginVO vo) throws Exception{
		 int result = service.idChk(vo);
		 return result;
	 }
	 
		@RequestMapping(value = "/adminRead.do", method = RequestMethod.GET)
		public String adminRead(HttpServletRequest request,  RedirectAttributes rttr, AdminloginVO vo, Model model,@ModelAttribute("scri") SearchCriteria scri)throws Exception{
			logger.info("adminRead");
			HttpSession session = request.getSession();
			if(session.getAttribute("member")!=null){
				if((session.getAttribute("memberRight")).equals("최고관리자")){
					PageMaker pageMaker = new PageMaker();
					pageMaker.setCri(scri);
					pageMaker.setTotalCount(service.adminListCount(scri));
					pageMaker.setTotalPage((int)Math.ceil(((float)service.adminListCount(scri)/scri.getPerPageNum())));
					rttr.addAttribute("page", scri.getPage());
					rttr.addAttribute("perPageNum", scri.getPerPageNum());
					rttr.addAttribute("searchType", scri.getSearchType());
					rttr.addAttribute("keyword", scri.getKeyword());
					
					model.addAttribute("adminRead",service.adminRead(vo.getAno()));
					model.addAttribute("scri",scri);
					System.out.println("글자 : "+vo);
					return "/admin/adminReadView";
				}else{
					rttr.addFlashAttribute("adminmsg", "최고관리자만 접근 가능합니다.");
					return "redirect:/admin.do";						
				}
				
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		@RequestMapping(value = "/adminUpdateView.do", method = RequestMethod.GET)
		public String adminUpdateView(HttpServletRequest request,  RedirectAttributes rttr, AdminloginVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception{
			logger.info("adminUpdateView");
			NewForm newForm = new NewForm();
			
			vo = service.adminRead(vo.getAno());
			String ph = vo.getAcontact();
			String[] phIndex = ph.split("-");
			String mail = vo.getAmail();
			String[] mailIndex = mail.split("@");
			newForm.setPh1(phIndex[0]);
			newForm.setPh2(phIndex[1]);
			newForm.setPh3(phIndex[2]);
			newForm.setMail1(mailIndex[0]);
			newForm.setMail2(mailIndex[1]);
			System.out.println(phIndex[1] +", " + mailIndex[1]);
					
			 
			
			HttpSession session = request.getSession();
			if(session.getAttribute("member")!=null){
				if((session.getAttribute("memberRight")).equals("최고관리자")){
			
					model.addAttribute("adminUpdate", vo);
					model.addAttribute("newForm", newForm);
					model.addAttribute("scri",scri);
	
					return "/admin/adminUpdateView";
				}else{
					rttr.addFlashAttribute("adminmsg", "최고관리자만 접근 가능합니다.");
					return "redirect:/admin.do";
				}
			
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		
		@RequestMapping(value = "/adminUpdate.do", method = RequestMethod.POST)
		public String adminUpdate(HttpServletRequest req, AdminloginVO vo,@ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
			logger.info("adminUpdate");
			model.addAttribute("scri",scri);
			vo = service.adminRead(vo.getAno());
			vo.setAdminName(req.getParameter("adminName"));
			vo.setAmail(req.getParameter("mailf")+"@"+req.getParameter("mailb"));
			vo.setAcontact(req.getParameter("contact1")+"-"+req.getParameter("contact2")+"-"+req.getParameter("contact3"));

			service.adminUpdate(vo);
			
			return "redirect:/adminRead.do?ano="+vo.getAno();
		}
		
		@RequestMapping(value = "/adminDelete.do", method = RequestMethod.POST)
		public String adminDelete(HttpServletRequest req, RedirectAttributes rttr, HttpSession session, AdminloginVO vo)throws Exception{
			logger.info("adminDelete");
			vo = service.adminRead(vo.getAno());
			service.adminDelete(vo.getAno());
			System.out.println("글자 : "+vo);
			
			if(vo.getRight().equals("최고관리자")){
				rttr.addFlashAttribute("msg2", "최고관리자는 삭제가 불가능합니다.");
			}
			else{
				rttr.addFlashAttribute("msg2", "관리자를 삭제했습니다.");
			}
			
			
			return "redirect:/adminList.do";
		}
		@RequestMapping(value = "/adminDeleteCheck.do", method = RequestMethod.POST)
		public String adminDeleteCheck(HttpServletRequest req, RedirectAttributes rttr, HttpSession session, AdminloginVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception{
			logger.info("adminDeleteCheck");
			
			String[] arr = req.getParameterValues("chk");
			String aright; 
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.adminListCount(scri));
			pageMaker.setTotalPage((int)Math.ceil(((float)service.adminListCount(scri)/scri.getPerPageNum())));
		 
			model.addAttribute("pageMaker",pageMaker);
			model.addAttribute("scri", scri);
			
			
			
		
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

				for(int i=0; i<arr.length;i++){
					vo = service.adminRead(Integer.parseInt(arr[i]));
					aright = vo.getRight();
					if(aright.equals("최고관리자")){
						rttr.addFlashAttribute("msg2", "최고관리자는 삭제가 불가능합니다.");
					}else{
						service.adminDelete(Integer.parseInt(arr[i]));
					}
				}
				rttr.addFlashAttribute("msg2", arr.length + "명의 관리자를 삭제했습니다.");
			
			
			
			return "redirect:/adminList.do";
		}
		
		
		@RequestMapping(value = "/adminPwUpdateView.do", method = RequestMethod.GET)
		public String adminPwUpdateView(RedirectAttributes rttr, HttpServletRequest req, AdminloginVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception{
			logger.info("adminPwUpdateView");
			
			HttpSession session = req.getSession();
			if(session.getAttribute("member")!=null){
				if((session.getAttribute("memberRight")).equals("최고관리자")){
					if(session.getAttribute("pwCheck").equals("Y")){
						vo =  service.adminRead(vo.getAno());
						model.addAttribute("adminPwUpdateView", vo);
						model.addAttribute("scri",scri);
						session.setAttribute("pwCheck","");		
						return "/admin/adminPwUpdate";
					}else{
						rttr.addFlashAttribute("adminPwCheckMsg", "비정상적인 접근입니다.");
						return "redirect:/adminRead.do?ano="+vo.getAno();
					}
				}else{
					rttr.addFlashAttribute("adminmsg", "최고관리자만 접근 가능합니다.");
					return "redirect:/admin.do";
				}
			
				
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		@RequestMapping(value = "/adminPwUpdate.do", method = RequestMethod.POST)
		public String adminPwUpdate(RedirectAttributes rttr, HttpServletRequest req, AdminloginVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception{
			logger.info("adminPwUpdateView");
			model.addAttribute("scri", scri);
			HttpSession session = req.getSession();
			if(session.getAttribute("member")!=null){
				vo =  service.adminRead(vo.getAno());
				System.out.println("글자: " + vo +", 안녕: "+ req.getParameter("password0"));
				
				
					vo.setAdminPassword(req.getParameter("adminPassword"));
					rttr.addFlashAttribute("msg2", vo.getAdminId() + " 사용자의 패스워드가 변경되었습니다.");
					service.adminPwUpdate(vo);
					return "redirect:adminList.do";
				
				
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		
		@RequestMapping(value = "/adminMyPage.do", method = RequestMethod.GET)
		public String adminMyPage(HttpServletRequest request,  RedirectAttributes rttr, AdminloginVO vo, Model model)throws Exception{
			logger.info("adminMyPage");
			HttpSession session = request.getSession();
					
			if(session.getAttribute("member")!=null){
					vo.setAdminId((String)session.getAttribute("member"));
					vo = service.adminData(vo.getAdminId());
	
					model.addAttribute("adminRead",vo);
					System.out.println("글자 : "+vo);
					return "/admin/adminMyPage";
				
				
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		@RequestMapping(value = "/adminMyPageUpdateView.do", method = RequestMethod.GET)
		public String adminMyPageUpdateView(HttpServletRequest request,  RedirectAttributes rttr, AdminloginVO vo, Model model)throws Exception{
			logger.info("adminMyPageUpdateView");
			HttpSession session = request.getSession();
			NewForm newForm = new NewForm();
			
			
			vo.setAdminId((String)session.getAttribute("member"));
			vo = service.adminData(vo.getAdminId());
			String ph = vo.getAcontact();
			String[] phIndex = ph.split("-");
			String mail = vo.getAmail();
			String[] mailIndex = mail.split("@");
			newForm.setPh1(phIndex[0]);
			newForm.setPh2(phIndex[1]);
			newForm.setPh3(phIndex[2]);
			newForm.setMail1(mailIndex[0]);
			newForm.setMail2(mailIndex[1]);
			System.out.println(phIndex[1] +", " + mailIndex[1]);
					
			 
			
		
			if(session.getAttribute("member")!=null){
					
					model.addAttribute("adminUpdate", vo);
					model.addAttribute("newForm", newForm);
					return "/mypage/myUpdateView";
			
			
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		
		@RequestMapping(value = "/myUpdate.do", method = RequestMethod.POST)
		public String myUpdate(HttpServletRequest req, AdminloginVO vo)throws Exception{
			logger.info("myUpdate");
			vo = service.adminRead(vo.getAno());
			vo.setAdminName(req.getParameter("adminName"));
			vo.setAmail(req.getParameter("mailf")+"@"+req.getParameter("mailb"));
			vo.setAcontact(req.getParameter("contact1")+"-"+req.getParameter("contact2")+"-"+req.getParameter("contact3"));

			service.adminUpdate(vo);
			
			return "redirect:/adminMyPage.do";
		}
		@RequestMapping(value = "/adminMyPagePwUpdateView.do", method = RequestMethod.GET)
		public String adminMyPagePwUpdateView(RedirectAttributes rttr, HttpServletRequest req, AdminloginVO vo, Model model)throws Exception{
			logger.info("adminPwUpdateView");
			HttpSession session = req.getSession();
			if(session.getAttribute("member")!=null){
				
					vo.setAdminId((String)session.getAttribute("member"));
					vo = service.adminData(vo.getAdminId());
					model.addAttribute("adminPwUpdateView", vo);
		
					return "/mypage/myPwUpdate";
				
			
				
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		@RequestMapping(value = "/myPwUpdate.do", method = RequestMethod.POST)
		public String adminMyPagePwUpdate(RedirectAttributes rttr, HttpServletRequest req, AdminloginVO vo, Model model)throws Exception{
			logger.info("adminPwUpdateView");
			HttpSession session = req.getSession();
			if(session.getAttribute("member")!=null){
				vo =  service.adminRead(vo.getAno());
				System.out.println("글자: " + vo +", 안녕: "+ req.getParameter("password0"));
				
				if((vo.getAdminPassword()).equals(req.getParameter("password0")) ){
					vo.setAdminPassword(req.getParameter("adminPassword"));
					rttr.addFlashAttribute("msg", vo.getAdminId() + " 사용자의 패스워드가 변경되었습니다.");
					service.adminPwUpdate(vo);
				
					
					return "redirect:/admin.do";
					
				}else{
					rttr.addFlashAttribute("pwmsg", "기존 패스워드가 틀립니다.");
					return "redirect:/adminMyPagePwUpdateView.do?ano="+ vo.getAno();
				}
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		
		@RequestMapping(value = "/adminPwUpdateCheck.do", method = RequestMethod.GET)
		public String adminUpdateCheckView(RedirectAttributes rttr, HttpServletRequest req, AdminloginVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception{
			logger.info("adminPwUpdateView");
			
			HttpSession session = req.getSession();
			if(session.getAttribute("member")!=null){
				if((session.getAttribute("member")).equals("admin")){
					vo =  service.adminRead(vo.getAno());
					model.addAttribute("adminPwUpdateView", vo);
					model.addAttribute("scri",scri);
					return "/admin/adminPwUpdateChek";
				}else{
					rttr.addFlashAttribute("adminmsg", "최고관리자만 접근 가능합니다.");
					return "redirect:/admin.do";
				}
			
				
			}else{

		          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

		          return "redirect:/login.do";			
			}
		}
		

		
		
}
