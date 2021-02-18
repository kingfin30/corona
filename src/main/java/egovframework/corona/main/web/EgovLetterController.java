package egovframework.corona.main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.corona.main.service.AdminFlag;
import egovframework.corona.main.service.AdminloginService;
import egovframework.corona.main.service.AdminloginVO;
import egovframework.corona.main.service.LReceiver;
import egovframework.corona.main.service.LSender;
import egovframework.corona.main.service.LetterService;
import egovframework.corona.main.service.MContentLogVO;
import egovframework.corona.main.service.MContentVO;
import egovframework.corona.main.service.PageMaker;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.corona.main.service.SubPageMaker;

@Controller
public class EgovLetterController {
	
	@Resource(name="adminLoginService")
	private AdminloginService adminLoginService;
	
	@Resource(name="letterService")
	private LetterService service;
	
	@RequestMapping(value="/letter.do")
	public String sender(){
		return "/admin/letter";
	}
	
	
	@RequestMapping(value="/letterSearch.do")
	public String search(HttpServletRequest req,RedirectAttributes rttr, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		HttpSession session = req.getSession();
		if(session.getAttribute("member")!=null){
			PageMaker pageMaker2 = new PageMaker();
			scri.setPerPageNum(5);
			pageMaker2.setDisplayPageNum(5);
				model.addAttribute("adminList", adminLoginService.adminList2(scri));
				model.addAttribute("adminList2", adminLoginService.adminList3(scri));
				
				pageMaker2.setCri(scri);
				pageMaker2.setTotalCount(adminLoginService.adminListCount(scri));
				pageMaker2.setTotalPage((int)Math.ceil(((float)adminLoginService.adminListCount(scri)/scri.getPerPageNum())));
				
				model.addAttribute("pageMaker",pageMaker2);
				
			
				return "/popup/letterIdSearch";
			
		}else{
			  rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";	
		}
		
	}
	
	@RequestMapping(value="/letterSend.do")
	public String send(HttpServletRequest req,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		HttpSession session = req.getSession();
		String sessionId = (String)session.getAttribute("member");
		int sessionNo = (int)session.getAttribute("memberNo");
		String[] arr = req.getParameterValues("chk");
		List<AdminloginVO> voList =  adminLoginService.adminList4(scri);
		int size = voList.size();
		LSender ls = new LSender();
		LReceiver lr = new LReceiver();
		AdminFlag af = new AdminFlag();
		String message =req.getParameter("message");
		
		System.out.println("-----여기-----");
		
		
		if(arr.length==1){
			String str = req.getParameter("receiver");
			String[] sttr = str.split(";");
			int[] lll = new int[sttr.length];
			for(int l=0; l< sttr.length; l++){
				lll[l] = adminLoginService.adminData(sttr[l]).getAno();
			}
			ls.setContent(message);
			ls.setWriter(sessionId);
			ls.setReceiver(str);
			ls.setWriterno(sessionNo);
			
			
			
			service.inserts(ls);
			
			lr.setContent(message);
			lr.setWriter(sessionId);
			lr.setWriterno(sessionNo);
	
			
			
			for(int i=0; i < sttr.length; i++){
				System.out.println(i+" : "+ sttr[i]);
				
				int receiverno = adminLoginService.adminData(sttr[i]).getAno();
				
				lr.setReceiver(sttr[i]);
				lr.setReceiverno(receiverno);
				af.setAdminId(sttr[i]);
				af.setAno(lll[i]);
			
			
				
				service.insertr(lr);	
				service.adminRflag(af);
			}
			rttr.addFlashAttribute("lettermsg", sttr.length+ "명에게 쪽지를 전송했습니다.");
			
		}else{
			System.out.println("-------------------------------------------------------------------------------------");
			String m="";
		
			for(int k=0; k<size; k++){
				if(!voList.get(k).getAdminId().equals(sessionId)){
					String arg = voList.get(k).getAdminId() + ";" ;
					m += arg;
				}
			}
		
			ls.setContent(message);
			ls.setWriter(sessionId);
			ls.setWriterno(sessionNo);
			ls.setReceiver(m);
		
			
			service.inserts(ls);
			
			lr.setContent(message);
			lr.setWriter(sessionId);			
			lr.setWriterno(sessionNo);

			
			
		

			
			for(int j=0; j<size; j++){
				System.out.println(j+" : "+voList.get(j).getAdminId());
				if(!voList.get(j).getAdminId().equals(sessionId)){
					lr.setReceiver(voList.get(j).getAdminId());
					lr.setReceiverno(voList.get(j).getAno());
					af.setAdminId(voList.get(j).getAdminId());	
					af.setAno(voList.get(j).getAno());
					service.adminRflag(af);
					service.insertr(lr);
					
					
				}
			}
			rttr.addFlashAttribute("lettermsg", size-1 + "명에게 쪽지를 전송했습니다.");
		}
		return "redirect:/letter.do";
	}
	@RequestMapping(value="/letterSend2.do")
	public String send2(HttpServletRequest req,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		HttpSession session = req.getSession();
		String sessionId = (String)session.getAttribute("member");
		int sessionNo = (int)session.getAttribute("memberNo");

		List<AdminloginVO> voList =  adminLoginService.adminList4(scri);
		int size = voList.size();
		LSender ls = new LSender();
		LReceiver lr = new LReceiver();
		AdminFlag af = new AdminFlag();
		String message =req.getParameter("message");
		
		System.out.println("-----여기-----");
		
		
	
			String str = req.getParameter("receiver");
			String[] sttr = str.split(";");
			int[] lll = new int[sttr.length];
			for(int l=0; l< sttr.length; l++){
				lll[l] = adminLoginService.adminData(sttr[l]).getAno();
			}
			ls.setContent(message);
			ls.setWriter(sessionId);
			ls.setReceiver(str);
			ls.setWriterno(sessionNo);
			
			
			
			service.inserts(ls);
			
			lr.setContent(message);
			lr.setWriter(sessionId);
			lr.setWriterno(sessionNo);
	
			
			
			for(int i=0; i < sttr.length; i++){
				System.out.println(i+" : "+ sttr[i]);
				
				int receiverno = adminLoginService.adminData(sttr[i]).getAno();
				
				lr.setReceiver(sttr[i]);
				lr.setReceiverno(receiverno);
				af.setAdminId(sttr[i]);
				af.setAno(lll[i]);
			
			
				
				service.insertr(lr);	
				service.adminRflag(af);
			}
			rttr.addFlashAttribute("lettermsg", sttr.length+ "명에게 쪽지를 전송했습니다.");
			
		
		return "redirect:/letter.do";
	}
	

	
	@RequestMapping(value="sendList.do")
	public String sendList(HttpServletRequest req, Model model, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		HttpSession session = req.getSession();
		String sessionId = (String)session.getAttribute("member");
		int sessionNo = (int)session.getAttribute("memberNo");
		scri.setWriter(sessionId);
		pageMaker.setTotalCount(service.letterListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.letterListCount(scri)/scri.getPerPageNum())));
		
	 
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("scri", scri);
		model.addAttribute("adminLoginService", adminLoginService);
		
		model.addAttribute("letterList", service.letterList(scri));
		model.addAttribute("service", service);

		
		
		
	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "/letter/sendList";
	}
	
	@RequestMapping(value="sendRead.do")
	public String sendRead(RedirectAttributes rttr, HttpServletRequest request, LSender lsender, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			lsender= service.letterRead(lsender.getLsno());
			model.addAttribute("lsender", lsender);
			model.addAttribute("scri",scri);
			model.addAttribute("service", service);
			model.addAttribute("adminLoginService", adminLoginService);

		
			return "/popup/sendRead";
			
		}else{

	          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";			
		}
	
		
	}
	
	@RequestMapping(value="receiveList.do")
	public String receiveLists(HttpServletRequest req, Model model, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		HttpSession session = req.getSession();
		String sessionId = (String)session.getAttribute("member");
		int sessionNo = (int)session.getAttribute("memberNo");
		scri.setReceiver(sessionId);
		pageMaker.setTotalCount(service.receiveListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.receiveListCount(scri)/scri.getPerPageNum())));
		
	  
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("scri", scri);
		
		model.addAttribute("letterList", service.receiveList(scri));
		model.addAttribute("service", service);
		model.addAttribute("adminService", adminLoginService);

		
		
		
	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "/letter/receiveList";
	}
	
	@RequestMapping(value="receiveRead.do")
	public String receiveRead(RedirectAttributes rttr, HttpServletRequest request, LReceiver lreceiver, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			lreceiver= service.receiveRead(lreceiver.getLrno());
			model.addAttribute("lreceiver", lreceiver);
			model.addAttribute("scri",scri);
			model.addAttribute("adminService", adminLoginService);
			
			AdminFlag f = new AdminFlag();
			
			f= service.readChk(lreceiver);
			
				
			
			if(f.getRflag().equals("N")){
				service.read(lreceiver);
			}

		
			return "/popup/receiveRead";
			
		}else{

	          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";			
		}
	
		
	}
	@RequestMapping(value="/receiveDelete.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String receiveDelete(RedirectAttributes rttr, HttpServletRequest req, @ModelAttribute("scri") SearchCriteria scri, Model model, LReceiver lr) throws Exception{
		String[] arr = req.getParameterValues("chk");
		HttpSession session = req.getSession();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		scri.setReceiver((String)session.getAttribute("member"));
		pageMaker.setTotalCount(service.receiveListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.receiveListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("scri", scri);
		System.out.println("==========================================================================================");
		for(int i=0; i<arr.length;i++){
			System.out.println(arr[i]);
		}
		for(int i=0; i<arr.length;i++){
			
			lr = service.receiveRead(Integer.parseInt(arr[i]));
		    service.rFlagDelete(lr);
			service.receiveDelete(lr);

			
		}
		
		
	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

	
		return "redirect:/receiveList.do";
	}
	
	@RequestMapping(value="/sendDelete.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String sendDelete(RedirectAttributes rttr, HttpServletRequest req, @ModelAttribute("scri") SearchCriteria scri, Model model, LSender ls) throws Exception{
		String[] arr = req.getParameterValues("chk");
		HttpSession session = req.getSession();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		scri.setReceiver((String)session.getAttribute("member"));
		pageMaker.setTotalCount(service.receiveListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.receiveListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("scri", scri);
		System.out.println("==========================================================================================");
		for(int i=0; i<arr.length;i++){
			System.out.println(arr[i]);
		}
		for(int i=0; i<arr.length;i++){
			
			ls = service.letterRead(Integer.parseInt(arr[i]));
		    
			service.sendDelete(ls);

			
		}
		
		
	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

	
		return "redirect:/sendList.do";
	}
	
	@RequestMapping(value="/reply.do")
	public String reply(LReceiver lr, Model model) throws Exception{
		int ano = lr.getWriterno();
		AdminloginVO vo = adminLoginService.adminRead(ano);
		model.addAttribute("vo",vo);
		return "/letter/reply";
	}

	@RequestMapping(value="/lsend.do")
	public String lSend(LReceiver lr, Model model) throws Exception{
		int ano = lr.getWriterno();
		AdminloginVO vo = adminLoginService.adminRead(ano);
		model.addAttribute("vo",vo);
		return "/letter/letter";
	}

}



