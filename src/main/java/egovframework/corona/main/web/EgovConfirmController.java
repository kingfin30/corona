package egovframework.corona.main.web;


import java.text.SimpleDateFormat;
import java.util.Date;

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

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.corona.main.service.ConfirmService;
import egovframework.corona.main.service.ConfirmVO;
import egovframework.corona.main.service.Days30;
import egovframework.corona.main.service.Days7;
import egovframework.corona.main.service.Locality;
import egovframework.corona.main.service.PageMaker;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.corona.main.service.TableBoy;
import egovframework.corona.main.service.TableMaker;
import egovframework.corona.main.service.SubTable;


@Controller
@RequestMapping("/confirm/*")
public class EgovConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(EgovConfirmController.class);
	

	@Resource(name="confirmService")
	private ConfirmService service;
	


	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String writeView(HttpServletRequest request,  RedirectAttributes rttr) throws Exception{
		logger.info("writeView");
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			return "/confirm/writeView";	
		}else{

	          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";
	         
	      }
	}
	
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(ConfirmVO vo, HttpServletRequest req)throws Exception{
		logger.info("write");
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(new Date());
		int thisDay = Integer.parseInt(today);
		String address_detail = req.getParameter("address_detail");
		String address_extra = req.getParameter("address_extra");
		if(address_detail=="" || address_detail == null){
			vo.setAddress_detail(null);
		}
		if(address_extra=="" || address_detail == null){
			vo.setAddress_extra(null);
		}
		String sortNo = req.getParameter("sortno");
		String age19 = "19";
		String age18 = "18";
		String age20 = "20";
		String birth6 = req.getParameter("birthinfo");
		String birth8;
		String address = req.getParameter("address");
		String[] addressList = address.split(" ");
		System.out.println(addressList[0]);
		String phone = req.getParameter("contact1")+"-"+req.getParameter("contact2")+"-"+req.getParameter("contact3");
		vo.setPhone(phone);
		vo.setRegion(addressList[0]);
		if(addressList[0].equals("세종특별자치시")){
			vo.setRegion("세종");
		}
		if(addressList[0].equals("제주특별자치도")){
			vo.setRegion("제주");
		}
		/*
		 주민 등록
		 1: 1900년생 남자		2: 1900년생 여자		3: 2000년생 남자
		 4: 2000년생 여자		5: 1900년생 외국인 남자	6: 1900년생 외국인 여자
		 7: 2000년생 외국인 남자	8: 2000년생 외국인 여자	9: 1800년생 남자		0: 1800년생 여자
		 */
		if(sortNo.equals("1") || sortNo.equals("3") || sortNo.equals("9")){
			vo.setGender("남성");
			vo.setLocal("내국인");
			if(sortNo.equals("1")){
				birth8 = age19 + birth6;
				vo.setBirth(birth8);
			}
			else if(sortNo.equals("3")){
				birth8 = age20 + birth6;
				vo.setBirth(birth8);
			}
			else if(sortNo.equals("9")){
				birth8 = age18 + birth6;
				vo.setBirth(birth8);
			}
		}else if(sortNo.equals("2") || sortNo.equals("4") || sortNo.equals("0")){
			vo.setGender("여성");
			vo.setLocal("내국인");
			if(sortNo.equals("2")){
				birth8 = age19 + birth6;
				vo.setBirth(birth8);
			}else if(sortNo.equals("4")){
				birth8 = age20 + birth6;
				vo.setBirth(birth8);
			}else if(sortNo.equals("0")){
				birth8 = age18 + birth6;
				vo.setBirth(birth8);
			}
			
		}else if(sortNo.equals("5") || sortNo.equals("7") ){
			vo.setGender("남성");
			vo.setLocal("외국인");
			if(sortNo.equals("5")){
				birth8 = age19 + birth6;
				vo.setBirth(birth8);
			}else if(sortNo.equals("7")){
				birth8 = age20 + birth6;
				vo.setBirth(birth8);
			}
		}
		else if(sortNo.equals("6") || sortNo.equals("8") ){
			vo.setGender("여성");
			vo.setLocal("외국인");
			if(sortNo.equals("6")){
				birth8 = age19 + birth6;
				vo.setBirth(birth8);
			}else if(sortNo.equals("8")){
				birth8 = age20 + birth6;
				vo.setBirth(birth8);
			}
		}
	
	
	
		service.write(vo);
		return "redirect:list.do";
	}
	
	
	@RequestMapping(value="/list.do", method= RequestMethod.GET)
	public String list(ConfirmVO confirmVO,HttpServletRequest request,  RedirectAttributes rttr, Model model, @ModelAttribute("scri") SearchCriteria scri)throws Exception{
		logger.info("list");
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(new Date());
		int thisDay = Integer.parseInt(today);
	
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			model.addAttribute("list", service.list(scri));
			PageMaker pageMaker = new PageMaker();
		
			pageMaker.setCri(scri);
			
			pageMaker.setTotalCount(service.listCount(scri));
			
			pageMaker.setTotalPage((int)Math.ceil(((float)service.listCount(scri)/scri.getPerPageNum())));
			
			

			model.addAttribute("scri", scri);
			model.addAttribute("thisDay", thisDay);
			model.addAttribute("pageMaker",pageMaker);
			
		
			
		
				return "confirm/list";
		
			
		}else{

	          rttr.addFlashAttribute("msg", "관리자 로그인이 필요합니다.");

	          return "redirect:/login.do";
	         
	      }
	      

	}
	
	
	@RequestMapping(value = "/read.do", method = RequestMethod.GET)
	public String read(HttpServletRequest request,  RedirectAttributes rttr, ConfirmVO confirmVO,@ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
		logger.info("read");
		HttpSession session = request.getSession();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String today = format.format(new Date());
		int thisDay = Integer.parseInt(today);
		
		if(session.getAttribute("member")!=null){
			confirmVO= service.read(confirmVO.getCno());
			String birth = confirmVO.getBirth();
			int ageInfo = thisDay - Integer.parseInt(birth);
			String age = (Integer.toString(ageInfo));
			String manAge;
			if(age.length()==7){
				manAge = age.substring(0, 3);
				
			}else{
				manAge = age.substring(0, 2);
			}
			model.addAttribute("read", confirmVO);
			model.addAttribute("scri",scri);
			model.addAttribute("manAge", Integer.parseInt(manAge));
		
			return "/confirm/readView";
			
		}else{

	          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";			
		}
	}
	
	@RequestMapping(value="/change.do", method = RequestMethod.GET)
	public String updateView(HttpServletRequest request,  RedirectAttributes rttr, ConfirmVO confirmVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			confirmVO = service.read(confirmVO.getCno());
			model.addAttribute("update", confirmVO );
			String contact = confirmVO.getPhone();
			String[] contacts = contact.split("-");
			model.addAttribute("contact1", contacts[0] );
			model.addAttribute("contact2", contacts[1] );
			model.addAttribute("contact3", contacts[2] );
			
			model.addAttribute("scri", scri);
			System.out.println("글자 : "+confirmVO );
		
		
			return "/confirm/updateView";
		}else{
			  rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";	
		}
	}
	
	
	@RequestMapping(value="save.do",  method = RequestMethod.POST)
	public String update(ConfirmVO confirmVO, HttpServletRequest req,  @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		System.out.println("글자 : "+confirmVO );
		String address_detail = req.getParameter("address_detail");
		String address_extra = req.getParameter("address_extra");
		if(address_detail=="" || address_detail == null){
			confirmVO.setAddress_detail(null);
		}
		if(address_extra=="" || address_detail == null){
			confirmVO.setAddress_extra(null);
		}
		String sortNo = req.getParameter("sortno");
		String age19 = "19";
		String age18 = "18";
		String age20 = "20";
		String birth6 = req.getParameter("birthinfo");
		String birth8;
		String address = req.getParameter("address");
		String[] addressList = address.split(" ");
		System.out.println(addressList[0]);
		String phone = req.getParameter("contact1")+"-"+req.getParameter("contact2")+"-"+req.getParameter("contact3");
		confirmVO.setPhone(phone);
		confirmVO.setRegion(addressList[0]);
		if(addressList[0].equals("세종특별자치시")){
			confirmVO.setRegion("세종");
		}
		if(addressList[0].equals("제주특별자치도")){
			confirmVO.setRegion("제주");
		}
		/*
		 주민 등록
		 1: 1900년생 남자		2: 1900년생 여자		3: 2000년생 남자
		 4: 2000년생 여자		5: 1900년생 외국인 남자	6: 1900년생 외국인 여자
		 7: 2000년생 외국인 남자	8: 2000년생 외국인 여자	9: 1800년생 남자		0: 1800년생 여자
		 */
		if(sortNo.equals("1") || sortNo.equals("3") || sortNo.equals("9")){
			confirmVO.setGender("남성");
			confirmVO.setLocal("내국인");
			if(sortNo.equals("1")){
				birth8 = age19 + birth6;
				confirmVO.setBirth(birth8);
			}
			else if(sortNo.equals("3")){
				birth8 = age20 + birth6;
				confirmVO.setBirth(birth8);
			}
			else if(sortNo.equals("9")){
				birth8 = age18 + birth6;
				confirmVO.setBirth(birth8);
			}
		}else if(sortNo.equals("2") || sortNo.equals("4") || sortNo.equals("0")){
			confirmVO.setGender("여성");
			confirmVO.setLocal("내국인");
			if(sortNo.equals("2")){
				birth8 = age19 + birth6;
				confirmVO.setBirth(birth8);
			}else if(sortNo.equals("4")){
				birth8 = age20 + birth6;
				confirmVO.setBirth(birth8);
			}else if(sortNo.equals("0")){
				birth8 = age18 + birth6;
				confirmVO.setBirth(birth8);
			}
			
		}else if(sortNo.equals("5") || sortNo.equals("7") ){
			confirmVO.setGender("남성");
			confirmVO.setLocal("외국인");
			if(sortNo.equals("5")){
				birth8 = age19 + birth6;
				confirmVO.setBirth(birth8);
			}else if(sortNo.equals("7")){
				birth8 = age20 + birth6;
				confirmVO.setBirth(birth8);
			}
		}
		else if(sortNo.equals("6") || sortNo.equals("8") ){
			confirmVO.setGender("여성");
			confirmVO.setLocal("외국인");
			if(sortNo.equals("6")){
				birth8 = age19 + birth6;
				confirmVO.setBirth(birth8);
			}else if(sortNo.equals("8")){
				birth8 = age20 + birth6;
				confirmVO.setBirth(birth8);
			}
		}
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		service.update(confirmVO);
		
		
		
		
		return "redirect:read.do?cno="+ confirmVO.getCno();
	}
	
	@RequestMapping(value="release.do",  method = RequestMethod.GET)
	public String updateRelease( ConfirmVO confirmVO,  @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("updateRelease");
		
		model.addAttribute("list", service.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.listCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);
		
		
		
		model.addAttribute("updateRelease", service.read(confirmVO.getCno()));	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addFlashAttribute("msg2", confirmVO.getCno()+"번 확진자 격리 해제로 변경되었습니다.");
		
	
		service.updateRelease(confirmVO.getCno());
		return "redirect:read.do?cno="+ confirmVO.getCno();
				
	}
	
	
	@RequestMapping(value="releaseCheck.do",  method = RequestMethod.POST)
	public String updateReleaseCheck( HttpServletRequest request, ConfirmVO confirmVO,  @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("updateReleaseCheck");
		String[] arr = request.getParameterValues("chk");
		model.addAttribute("list", service.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.listCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);

		model.addAttribute("updateRelease", service.read(confirmVO.getCno()));	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addFlashAttribute("msg2", arr.length+"명의 확진자가 격리 해제로 변경되었습니다.");

			System.out.println("안녕: ");
			for(int i=0; i< arr.length; i++){
				System.out.println(i +" : " + arr[i]);
				service.updateRelease(Integer.parseInt(arr[i]));
			}
		
	
			return "redirect:list.do";
	
	}
	
	@RequestMapping(value="dead.do",  method = RequestMethod.GET)
	public String updateDead(ConfirmVO confirmVO,  @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("updateDead");
		model.addAttribute("list", service.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.listCount(scri)/scri.getPerPageNum())));
	    
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("updateDead", service.read(confirmVO.getCno()));		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		//rttr.addFlashAttribute("msg2", confirmVO.getCno()+"번 확진자 사망 상태로 변경되었습니다.");
		
		service.updateDead(confirmVO.getCno());
		return "redirect:read.do?cno="+ confirmVO.getCno();
	}
	
	@RequestMapping(value="deadCheck.do",  method = RequestMethod.POST)
	public String updateDeadCheck(HttpServletRequest request, ConfirmVO confirmVO,  @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("updateDeadCheck");
		String[] arr = request.getParameterValues("chk");
		model.addAttribute("list", service.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.listCount(scri)/scri.getPerPageNum())));
	    
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("updateDead", service.read(confirmVO.getCno()));	
	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addFlashAttribute("msg2", arr.length+"명의 확진자가 사망 상태로 변경되었습니다.");
		

		
		System.out.println("안녕: ");
		for(int i=0; i< arr.length; i++){
			System.out.println(i +" : " + arr[i]);
			service.updateDead(Integer.parseInt(arr[i]));
		}
		
	
			return "redirect:list.do";
		
	}
	
	@RequestMapping(value="reset.do",  method = RequestMethod.GET)
	public String updateReset(ConfirmVO confirmVO,  @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, Model model) throws Exception{
		logger.info("updateReset");
		
		model.addAttribute("list", service.list(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.listCount(scri)/scri.getPerPageNum())));
	   
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("updateReset", service.read(confirmVO.getCno()));		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addFlashAttribute("msg2", confirmVO.getCno()+"번 확진자 초기화되었습니다.");
		
		service.updateReset(confirmVO.getCno());
		return "redirect:read.do?cno="+ confirmVO.getCno();
	}
	
	
	@RequestMapping(value="table.do")
	public String ctable(ConfirmVO confirmVO, RedirectAttributes rttr, Model model, @ModelAttribute("scri") SearchCriteria scri,  SubTable subTable)throws Exception{
		logger.info("ctable");
		
		TableMaker tb = new TableMaker();
		Days7 days = new Days7();
		Locality lc = new Locality();
		TableBoy t = new TableBoy();
		
		lc.setSeNow(service.REGchk("서울"));lc.setSeAcc(service.REGacc("서울"));lc.setSeToday(service.REGtoday("서울"));
		lc.setIcNow(service.REGchk("인천"));lc.setIcAcc(service.REGacc("인천"));lc.setIcToday(service.REGtoday("인천"));
		lc.setPsNow(service.REGchk("부산"));lc.setPsAcc(service.REGacc("부산"));lc.setPsToday(service.REGtoday("부산"));
		lc.setUsNow(service.REGchk("울산"));lc.setUsAcc(service.REGacc("울산"));lc.setUsToday(service.REGtoday("울산"));
		lc.setTgNow(service.REGchk("대구"));lc.setTgAcc(service.REGacc("대구"));lc.setTgToday(service.REGtoday("대구"));
		lc.setKjNow(service.REGchk("광주"));lc.setKjAcc(service.REGacc("광주"));lc.setKjToday(service.REGtoday("광주"));
		lc.setTjNow(service.REGchk("대전"));lc.setTjAcc(service.REGacc("대전"));lc.setTjToday(service.REGtoday("대전"));
		lc.setSjNow(service.REGchk("세종"));lc.setSjAcc(service.REGacc("세종"));lc.setSjToday(service.REGtoday("세종"));
		lc.setKkNow(service.REGchk("경기"));lc.setKkAcc(service.REGacc("경기"));lc.setKkToday(service.REGtoday("경기"));
		lc.setCbNow(service.REGchk("충북"));lc.setCbAcc(service.REGacc("충북"));lc.setCbToday(service.REGtoday("충북"));
		lc.setCnNow(service.REGchk("충남"));lc.setCnAcc(service.REGacc("충남"));lc.setCnToday(service.REGtoday("충남"));
		lc.setJbNow(service.REGchk("전북"));lc.setJbAcc(service.REGacc("전북"));lc.setJbToday(service.REGtoday("전북"));
		lc.setJnNow(service.REGchk("전남"));lc.setJnAcc(service.REGacc("전남"));lc.setJnToday(service.REGtoday("전남"));
		lc.setKbNow(service.REGchk("경북"));lc.setKbAcc(service.REGacc("경북"));lc.setKbToday(service.REGtoday("경북"));
		lc.setKnNow(service.REGchk("경남"));lc.setKnAcc(service.REGacc("경남"));lc.setKnToday(service.REGtoday("경남"));
		lc.setKwNow(service.REGchk("강원"));lc.setKwAcc(service.REGacc("강원"));lc.setKwToday(service.REGtoday("강원"));
		lc.setJjNow(service.REGchk("제주"));lc.setJjAcc(service.REGacc("제주"));lc.setJjToday(service.REGtoday("제주"));
		
		t.setC0(service.select_0("확진"));t.setD0(service.select_0("사망"));t.setR0(service.select_0("해제"));
		t.setC1(service.select_1("확진"));t.setD1(service.select_1("사망"));t.setR1(service.select_1("해제"));
		t.setC2(service.select_2("확진"));t.setD2(service.select_2("사망"));t.setR2(service.select_2("해제"));
		t.setC3(service.select_3("확진"));t.setD3(service.select_3("사망"));t.setR3(service.select_3("해제"));
		t.setC4(service.select_4("확진"));t.setD4(service.select_4("사망"));t.setR4(service.select_4("해제"));
		t.setC5(service.select_5("확진"));t.setD5(service.select_5("사망"));t.setR5(service.select_5("해제"));
		t.setC6(service.select_6("확진"));t.setD6(service.select_6("사망"));t.setR6(service.select_6("해제"));

		
		tb.setiConfirm(service.confirms(confirmVO));
		tb.setiRealese(service.releases(confirmVO));
		tb.setiDead(service.deads(confirmVO));
		tb.setSumDead(service.selectSumDeads(confirmVO));
		tb.setSumRelease(service.selectSumReleases(confirmVO));
		tb.setSumConfirm(service.selectSumConfirms(confirmVO));
	
		tb.setDay0(service.selectDay_0(confirmVO));
		tb.setDay1(service.selectDay_1(confirmVO));
		tb.setDay2(service.selectDay_2(confirmVO));
		tb.setDay3(service.selectDay_3(confirmVO));
		tb.setDay4(service.selectDay_4(confirmVO));
		tb.setDay5(service.selectDay_5(confirmVO));
		tb.setDay6(service.selectDay_6(confirmVO));
		
		service.updateDays(days);
		days.setD0(service.Day0());
		days.setD1(service.Day1());
		days.setD2(service.Day2());
		days.setD3(service.Day3());
		days.setD4(service.Day4());
		days.setD5(service.Day5());
		days.setD6(service.Day6());
		
		model.addAttribute("days", days);
		model.addAttribute("ctable", tb);
		model.addAttribute("lc",lc);
		model.addAttribute("t",t);
		model.addAttribute("girl", service.gender("여성"));
		model.addAttribute("boy", service.gender("남성"));
		model.addAttribute("nfor", service.local("내국인"));
		model.addAttribute("fore", service.local("외국인"));
		model.addAttribute("girl_to", service.gender_to("여성"));
		model.addAttribute("boy_to", service.gender_to("남성"));
		model.addAttribute("nfor_to", service.local_to("내국인"));
		model.addAttribute("for_to", service.local_to("외국인"));
		model.addAttribute("girl_sum", service.gender_sum("여성"));
		model.addAttribute("boy_sum", service.gender_sum("남성"));
		model.addAttribute("nfor_sum", service.local_sum("내국인"));
		model.addAttribute("for_sum", service.local_sum("외국인"));
		model.addAttribute("subTable", subTable);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.listCount(scri)/scri.getPerPageNum())));
	    
		model.addAttribute("pageMaker",pageMaker);
	/*
		rttr.addAttribute("seoul", tb.getiSeoul());
		rttr.addAttribute("chungbuk", tb.getiChungbuk());
		rttr.addAttribute("chungnam", tb.getiChungnam());
		rttr.addAttribute("gyungbuk", tb.getiGyungbuk());
		rttr.addAttribute("gyungnam", tb.getiGyungnam());
		rttr.addAttribute("junbuk", tb.getiJunbuk());
		rttr.addAttribute("junnam", tb.getiJunnam());
		rttr.addAttribute("gangwon", tb.getiGangwon());
		rttr.addAttribute("jejus", tb.getiJeju());
		*/
		return "/index/ctable";
	}
	
	
}
