package egovframework.corona.main.web;



import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.corona.main.service.AdminloginService;
import egovframework.corona.main.service.AdminloginVO;
import egovframework.corona.main.service.ConfirmVO;
import egovframework.corona.main.service.LetterService;
import egovframework.corona.main.service.PageMaker;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class EgovAdminLoginController {
	private static final Logger logger = LoggerFactory.getLogger(EgovAdminLoginController.class);
	
	@Resource(name="adminLoginService")
	private AdminloginService service;

	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@Resource(name="letterService")
	private LetterService letterService;
	
	private String viewName = "adminlogin/login";
	
	public String getViewName(){
		return this.viewName;
	}
	@RequestMapping(value = "/login.do",  method = RequestMethod.GET)
	public String loginView(HttpServletRequest request,  RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			return "redirect:/admin.do";
		}else{
			return getViewName();
		}
	}
	 @RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	   public String login(HttpServletRequest req, RedirectAttributes rttr)
	         throws Exception {
	      logger.info("post login");
	      System.out.println("안녕 친구들?!");
	      AdminloginVO vo = new AdminloginVO(req.getParameter("adminId"), req.getParameter("adminPassword"));
	      
	   

	      HttpSession session = req.getSession();
	      int login = service.login(vo); // 얘를 int형으로 바꿔줘야한다?
	      

	      System.out.println("로그인 리턴값" + login);
	      if (login == 1) { // login ==1 이면 success
	    	  vo = service.adminData(vo.getAdminId());
	         session.setAttribute("member", vo.getAdminId());
	         session.setAttribute("memberName", vo.getAdminName());
	         session.setAttribute("memberRight", vo.getRight());
	         session.setAttribute("memberNo", vo.getAno());
	         session.setAttribute("pwCheck","");
	         session.setAttribute("letterService", letterService);
	         session.setAttribute("kakao", service.kakaoCount(vo.getAdminId()));
	       
	        
	       
	         return "redirect:/admin.do";

	      } else { // 1이 아니면 fail
	         // req.setAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
	         rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
	         

	         return "redirect:/login.do";
	      }

	   }

	 @RequestMapping(value = "/kakaoRegister.do",  method = {RequestMethod.GET, RequestMethod.POST})
		public String kakaoRegister(HttpServletRequest req,  RedirectAttributes rttr, AdminloginVO vo, Model model) throws Exception {
			
			  logger.info("post kakaoRegister");
		      System.out.println("안녕 친구들?!");
		      String account = vo.getAccount();
		     
		      
		      
		   

		      HttpSession session = req.getSession();
		      int login = service.kakaoLogin(account); // 얘를 int형으로 바꿔줘야한다?
		      

		      System.out.println("로그인 리턴값" + login);
		      if (account == null) { // login ==1 이면 success
		  
		       
		         rttr.addFlashAttribute("msg", "다시 시도해주세요.");
		       
		        
		       
		         return "redirect:/login.do";

		      } else { // 1이 아니면 fail
		         // req.setAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
		         
		         if(service.kakaoLogin(account)==1){
		        	 rttr.addFlashAttribute("msg", "이미 등록된 아이디가 있습니다.");
		        	 return "redirect:login.do";
		         }
		         else
		        	 model.addAttribute("vo",vo);
		        	 return "/adminlogin/kakaoRegister";
		      }
		}
	 @RequestMapping(value = "/kakaoRegisterChk.do",  method = {RequestMethod.GET, RequestMethod.POST})
		public String kakaoRegisterChk(HttpServletRequest req,  RedirectAttributes rttr, AdminloginVO vo) throws Exception {
			
			  logger.info("post kakaoRegister");
		      System.out.println("안녕 친구들?!");
		      System.out.println("************************************************************");
		      String account = vo.getAccount();
		      System.out.println("계정 : "+account+ ", 아이디: "+ vo.getAdminId()+ "비밀번호 : "+ vo.getAdminPassword());
		     
		      
		   

		      HttpSession session = req.getSession();
		      int login = service.login(vo); // 얘를 int형으로 바꿔줘야한다?
		      

		      System.out.println("로그인 리턴값" + login);
		      if (login == 1) { // login ==1 이면 success
		    	  vo = service.adminData(vo.getAdminId());
		    	  vo.setAccount(account);
		    	  /*
		         session.setAttribute("member", vo.getAdminId());
		         session.setAttribute("memberName", vo.getAdminName());
		         session.setAttribute("memberRight", vo.getRight());
		         session.setAttribute("memberNo", vo.getAno());
		         session.setAttribute("pwCheck","");
		         session.setAttribute("letterService", letterService);
		         */
		         service.kakaoRegister(vo);
		         rttr.addFlashAttribute("msg", "카카오 계정이 등록되었습니다.");
		       
		        
		       
		         return "redirect:/login.do";

		      } else { // 1이 아니면 fail
		         // req.setAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
		         
		         
		    	  rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
		         return "redirect:/kakaoRegister.do?account="+vo.getAccount();
		      }
		}

	 
	 @RequestMapping(value = "/kakaoLogin.do", method = {RequestMethod.GET, RequestMethod.POST})
	   public String kakaoLogin(HttpServletRequest req, RedirectAttributes rttr,  AdminloginVO vo)
	         throws Exception {
	      logger.info("post kakaoLogin");
	      System.out.println("***************************************************************************");
	      System.out.println("카카오 계정 로그인 :" + vo.getAccount());
	  
	      
	    
	      
	   

	      HttpSession session = req.getSession();
	      int login = service.kakaoLogin(vo.getAccount()); // 얘를 int형으로 바꿔줘야한다?
	      
	      
	      
	      

	      System.out.println(" 카카오 로그인 리턴값" + login);
	     if (login == 1) { // login ==1 이면 success
	    	 	System.out.printf(vo.toString());
	    	 	vo = service.kakaoAccount(vo.getAccount());
	      		vo = service.adminData(vo.getAdminId());
	      		
	      		
	      		session.setAttribute("member", vo.getAdminId());
	      		session.setAttribute("memberName", vo.getAdminName());
	      		session.setAttribute("memberRight", vo.getRight());
	      		session.setAttribute("memberNo", vo.getAno());
	      		session.setAttribute("pwCheck","");
	      		session.setAttribute("letterService", letterService);
	      		session.setAttribute("adminService", service);
	      		session.setAttribute("kakao", service.kakaoCount(vo.getAdminId()));
	       
	        
	       
	      		return "redirect:/admin.do";

	      	} else { // 1이 아니면 fail
	      		// req.setAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
	      		
	         

	      		return "redirect:/kakaoRegister.do?account="+vo.getAccount();
	      	}

	   }
	 @RequestMapping(value="/logout.do")
	 public String logout(HttpServletRequest req) {
		 
		 //req.getSession().removeAttribute("member");
		 //req.getSession().removeAttribute("memberName");
		 req.getSession().invalidate();
		 return "redirect:/login.do";
		 
	 }
	 @RequestMapping(value="/kakaoDelete.do")
	 public String kakaoDelete(HttpServletRequest req,  RedirectAttributes rttr) {
		 HttpSession session = req.getSession();
		 //req.getSession().removeAttribute("member");
		 //req.getSession().removeAttribute("memberName");
		 service.kakaoDelete((String)session.getAttribute("member"));
		 session.setAttribute("kakao", service.kakaoCount((String)session.getAttribute("member")));
		 rttr.addFlashAttribute("msg55", "계정연동이 해제되었습니다.");
		
		 return "redirect:/adminMyPage.do";
		 
	 }

		

}