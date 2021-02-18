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

import egovframework.corona.main.service.AdminloginService;
import egovframework.corona.main.service.ConfirmVO;
import egovframework.corona.main.service.MContentLogVO;
import egovframework.corona.main.service.MContentService;
import egovframework.corona.main.service.MContentVO;
import egovframework.corona.main.service.MailService;
import egovframework.corona.main.service.PageMaker;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.corona.main.service.SubCriteria;
import egovframework.corona.main.service.SubPageMaker;


@Controller
public class EgovMContentController {
	
	
	@Resource(name="mContentService")
	private MContentService service;
	
	@Resource(name="adminLoginService")
	private AdminloginService adminLoginService;
	

	
	private static final Logger logger = LoggerFactory.getLogger(EgovAdminLoginController.class);
	
	@RequestMapping(value="/mContentList.do")
	public String mContentList(HttpServletRequest req, Model model, RedirectAttributes rttr, @ModelAttribute("scri") SearchCriteria scri)throws NumberFormatException, Exception{
		logger.info("mContentList");
		
		HttpSession session = req.getSession();
		if(session.getAttribute("member")!=null){
			
			
			model.addAttribute("mContentList", service.mContentList(scri));
	
			PageMaker pageMaker2 = new PageMaker();
			pageMaker2.setCri(scri);
			pageMaker2.setTotalCount(service.mContentListCount(scri));
			pageMaker2.setTotalPage((int)Math.ceil(((float)service.mContentListCount(scri)/scri.getPerPageNum())));
			model.addAttribute("pageMaker",pageMaker2);
			model.addAttribute("mContentPeriod", service.mContentPeriod());
			
				return "/content/mContentList";

		}else{
			  rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";	
		}

	}
	
	@RequestMapping(value="/mContentWriteView.do",  method = RequestMethod.GET)
	public String mContentWriteView(HttpServletRequest request, RedirectAttributes rttr, Model model, @ModelAttribute("scri") SearchCriteria scri,  MContentVO mContentVO) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			logger.info("mContentWriteView");
			int result = service.mContentPeriodCount();
			model.addAttribute("result", result);
			model.addAttribute("mContentView", service.mContentList(scri));
			PageMaker pageMaker2 = new PageMaker();
			
			pageMaker2.setCri(scri);
			pageMaker2.setTotalCount(service.mContentListCount(scri));
			pageMaker2.setTotalPage((int)Math.ceil(((float)service.mContentListCount(scri)/scri.getPerPageNum())));
		
			model.addAttribute("pageMaker",pageMaker2);
			
			return "/content/mContentWrite";
		}else{
			  rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value="/mContentWrite.do",  method = RequestMethod.POST)
	public String mContentWrite(HttpServletRequest req, Model model, MContentVO mContentVO, RedirectAttributes rttr ) throws Exception{
		logger.info("mContentWrite");
		
		String period="nouse";
		int result = service.mContentPeriodCount();
		String[] arr = req.getParameterValues("period");
		mContentVO.setPeriod("nouse");
		//MContentLogVO mContentlogVO = new MContentLogVO();
		
		if(result == 0 && arr.length ==2 ){
			mContentVO.setPeriod(period);
			
		
			mContentVO.setPeriod("use");
			
			
			
			
			System.out.println(mContentVO.toString());
			
			service.insert(mContentVO);
			
			/*
			mContentlogVO.setMno(mContentVO.getMno());
			mContentlogVO.setSubject(mContentVO.getSubject());
			mContentlogVO.setContent(mContentVO.getContent());
			mContentlogVO.setWriter(mContentVO.getWriter());
			mContentlogVO.setRight(mContentVO.getRight());
			
			service.insert_log(mContentlogVO);
			*/
			rttr.addFlashAttribute("mailmsg", "컨텐츠가 등록되었습니다.");
			return "redirect:/mContentList.do";
		}else if(result == 1 && arr.length ==2){
			
			rttr.addFlashAttribute("mailmsg2", "이미 정기 컨텐츠로 지정된 컨텐츠가 있습니다.");
			return "redirect:/mContentWriteView.do";
		}
		else if(result == 0 && arr.length ==1){
			
			
			
			System.out.println(mContentVO.toString());
			service.insert(mContentVO);
			
			/*
			mContentlogVO.setMno(mContentVO.getMno());
			mContentlogVO.setSubject(mContentVO.getSubject());
			mContentlogVO.setContent(mContentVO.getContent());
			mContentlogVO.setWriter(mContentVO.getWriter());
			mContentlogVO.setRight(mContentVO.getRight());
			
			service.insert_log(mContentlogVO);
			*/
			rttr.addFlashAttribute("mailmsg", "컨텐츠가 등록되었습니다.");
			return "redirect:/mContentList.do";
		}
		else if(result == 1 && arr.length ==1){
			
		
			System.out.println(mContentVO.toString());
			
			service.insert(mContentVO);
			/*
			mContentlogVO.setMno(mContentVO.getMno());
			mContentlogVO.setSubject(mContentVO.getSubject());
			mContentlogVO.setContent(mContentVO.getContent());
			mContentlogVO.setWriter(mContentVO.getWriter());
			mContentlogVO.setRight(mContentVO.getRight());
			
			service.insert_log(mContentlogVO);
			*/
			rttr.addFlashAttribute("mailmsg", "컨텐츠가 등록되었습니다.");
			return "redirect:/mContentList.do";
		}else{
			rttr.addFlashAttribute("mailmsg2", "이미 정기 컨텐츠로 지정된 컨텐츠가 있습니다.");
			return "redirect:/mContentWriteView.do";
		}
	}
	@RequestMapping(value = "/mContentReadView.do", method = RequestMethod.GET)
	public String read(HttpServletRequest request,  RedirectAttributes rttr, MContentVO mContentVO,@ModelAttribute("scri") SearchCriteria scri, Model model, @ModelAttribute("sucri") SubCriteria sucri)throws Exception{
		logger.info("mContentReadView");
		HttpSession session = request.getSession();
		if(session.getAttribute("member")!=null){
			mContentVO= service.mContentRead(mContentVO.getMno());
			model.addAttribute("mContentRead", mContentVO);
			model.addAttribute("scri",scri);
			model.addAttribute("sucri", sucri);
			sucri.setMno(mContentVO.getMno());
			model.addAttribute("mContentLogList", service.mContentLogList(sucri));
			model.addAttribute("check", service.updateCount(mContentVO.getMno()));
			model.addAttribute("adminInfo", adminLoginService.adminRead(mContentVO.getAno()));
			model.addAttribute("uadminInfo", adminLoginService.adminRead(mContentVO.getUpdateano()));
			model.addAttribute("logadminInfo", adminLoginService);
			SubPageMaker pageMaker = new SubPageMaker();
			pageMaker.setSucri(sucri);
			pageMaker.setTotalCount(service.mContentLogListCount(mContentVO.getMno()));
			pageMaker.setTotalPage((int)Math.ceil(((float)service.mContentLogListCount(mContentVO.getMno())/sucri.getPerSubPageNum())));
			model.addAttribute("pageMaker",pageMaker);
			 
			
		
			return "/content/mContentRead";
			
		}else{

	          rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";			
		}
	}

	@RequestMapping(value="/mContentLogReadView.do", method = RequestMethod.GET)
	public String logRead(HttpServletRequest request, MContentLogVO mContentLogVO, Model model, MContentVO mContentVO, @ModelAttribute("sucri") SubCriteria sucri) throws Exception{
		
		mContentVO= service.mContentRead(mContentVO.getMno());
		model.addAttribute("mContentRead", mContentVO);
		
		sucri.setMno(mContentVO.getMno());
		mContentLogVO = service.mContentLogRead(mContentLogVO.getLno());
		model.addAttribute("log", mContentLogVO);
		model.addAttribute("adminInfo", adminLoginService.adminRead(mContentLogVO.getAno()));
		model.addAttribute("uadminInfo", adminLoginService.adminRead(mContentLogVO.getUpdateano()));
	
		model.addAttribute("mContentLogList", service.mContentLogList(sucri));
		return "/content/mContentLog";
	}
	@RequestMapping(value="/mContentLogReadBack.do", method = RequestMethod.GET)
	public String logRead2(HttpServletRequest request, MContentLogVO mContentLogVO, Model model, MContentVO mContentVO, @ModelAttribute("sucri") SubCriteria sucri) throws Exception{
		
		mContentVO= service.mContentRead(mContentVO.getMno());
		model.addAttribute("mContentRead", mContentVO);
		
		sucri.setMno(mContentVO.getMno());
		mContentLogVO = service.mContentLogRead(mContentLogVO.getLno());
		model.addAttribute("log", mContentLogVO);
		model.addAttribute("adminInfo", adminLoginService.adminRead(mContentLogVO.getAno()));
		model.addAttribute("uadminInfo", adminLoginService.adminRead(mContentLogVO.getUpdateano()));
	
		model.addAttribute("mContentLogList", service.mContentLogList(sucri));
		return "/content/mContentLog3";
	}
	
	@RequestMapping(value="/mContentUpdateView.do", method = RequestMethod.GET)
	public String UpdateView(MContentVO mContentVO, @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
		mContentVO= service.mContentRead(mContentVO.getMno());
		int result = service.mContentPeriodCount();
		model.addAttribute("mContentUpdate", mContentVO);
		model.addAttribute("result", result);
		model.addAttribute("scri",scri);

		return "/content/mContentUpdate";
	}
	
	@RequestMapping(value="/mContentUpdate.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String Update(RedirectAttributes rttr, HttpServletRequest request,  MContentVO mContentVO) throws Exception{
		
		String[] arr = request.getParameterValues("period");
		int result = service.mContentPeriodCount();
		int ano = Integer.parseInt(request.getParameter("ano"));
		String updater = request.getParameter("updater");
		String updaterright = request.getParameter("updaterright");

		mContentVO.setPeriod("nouse");
		
		
		if(result == 0){
			if(arr.length==2){
				
			
			MContentVO vo = new MContentVO();
			vo = service.mContentRead(mContentVO.getMno());
			MContentLogVO mContentlogVO = new MContentLogVO();
			mContentVO.setPeriod("use");
			mContentlogVO.setMno(vo.getMno());
			mContentlogVO.setSubject(vo.getSubject());
			mContentlogVO.setContent(vo.getContent());
			mContentlogVO.setUpdater(updater);
			mContentlogVO.setUpdaterright(updaterright);
			mContentlogVO.setUpdateano(ano);
			mContentlogVO.setWriter(vo.getWriter());
			mContentlogVO.setRight(vo.getRight());
			mContentlogVO.setWritedate(vo.getUpdatedate());
			mContentlogVO.setAno(vo.getAno());
			mContentlogVO.setContentbyte(vo.getContentbyte());
			mContentlogVO.setCommentx("  ");
			if(vo.getUpdateano() != 0){
				mContentlogVO.setAno(vo.getUpdateano());
			}
			if(vo.getUpdater() != null){
				mContentlogVO.setWriter(vo.getUpdater());
				mContentlogVO.setRight(vo.getUpdaterright());
			}
			if(!vo.getPeriod().equals(mContentVO.getPeriod())){
				mContentlogVO.setCommentx("※정기 컨텐츠 체크");
			}
		
			System.out.println("\n1-1=================================================================================================================");
			System.out.println("commentx : "+ mContentlogVO.getCommentx()+", ano : "+mContentlogVO.getAno()+", mno : "+mContentlogVO.getMno()+
					", subject : "+mContentlogVO.getSubject()+", \n content : \n"+mContentlogVO.getContent()+ "\n, updater : "+mContentlogVO.getUpdater()+
					", updaterright : "+mContentlogVO.getUpdaterright()+", updateano : "+mContentlogVO.getUpdateano()+", writer : "+mContentlogVO.getWriter()+
					", right : "+mContentlogVO.getRight()+", writedate : "+mContentlogVO.getWritedate()+"\n");
			service.insert_log(mContentlogVO);
			
			mContentVO.setUpdateano(ano);
			System.out.println("\n1-2=================================================================================================================");
			System.out.println("subject : "+ mContentVO.getSubject()+", \n content : \n"+mContentVO.getContent()+"\n, period : "+mContentVO.getPeriod()+", updater : "+
								mContentVO.getUpdater()+", updaterright : "+mContentVO.getUpdaterright()+", updateano : "+ mContentVO.getUpdateano()+
								", writer : " +mContentVO.getWriter() +"\n");

			
			
			
			service.mContentUpdate(mContentVO);
			
			
			rttr.addFlashAttribute("msg33", "저장되었습니다.");
			return "redirect:/mContentReadView.do?mno=" + mContentVO.getMno();
			}
			else{
				MContentVO vo = new MContentVO();
				vo = service.mContentRead(mContentVO.getMno());
				MContentLogVO mContentlogVO = new MContentLogVO();
				
				mContentlogVO.setMno(vo.getMno());
				mContentlogVO.setSubject(vo.getSubject());
				mContentlogVO.setContent(vo.getContent());
				mContentlogVO.setUpdater(updater);
				mContentlogVO.setUpdaterright(updaterright);
				mContentlogVO.setUpdateano(ano);
				mContentlogVO.setWriter(vo.getWriter());
				mContentlogVO.setRight(vo.getRight());
				mContentlogVO.setWritedate(vo.getUpdatedate());
				mContentlogVO.setAno(vo.getAno());
				mContentlogVO.setContentbyte(vo.getContentbyte());
				mContentlogVO.setCommentx(" ");
				if(vo.getUpdateano() != 0){
					mContentlogVO.setAno(vo.getUpdateano());
				}
				
				if(vo.getUpdater() != null){
					mContentlogVO.setWriter(vo.getUpdater());
					mContentlogVO.setRight(vo.getUpdaterright());
				}
				if(!vo.getPeriod().equals(mContentVO.getPeriod())){
					mContentlogVO.setCommentx("※정기 컨텐츠 체크해제");
				}
				
				System.out.println("\n2-1=================================================================================================================");
				System.out.println("commentx : "+ mContentlogVO.getCommentx()+", ano : "+mContentlogVO.getAno()+", mno : "+mContentlogVO.getMno()+
						", subject : "+mContentlogVO.getSubject()+", \n content : \n"+mContentlogVO.getContent()+ "\n, updater : "+mContentlogVO.getUpdater()+
						", updaterright : "+mContentlogVO.getUpdaterright()+", updateano : "+mContentlogVO.getUpdateano()+", writer : "+mContentlogVO.getWriter()+
						", right : "+mContentlogVO.getRight()+", writedate : "+mContentlogVO.getWritedate()+"\n");
				service.insert_log(mContentlogVO);
			
				mContentVO.setUpdateano(ano);
				System.out.println("\n2-2=================================================================================================================");
				System.out.println("subject : "+ mContentVO.getSubject()+", \n content : \n"+mContentVO.getContent()+"\n, period : "+mContentVO.getPeriod()+", updater : "+
									mContentVO.getUpdater()+", updaterright : "+mContentVO.getUpdaterright()+", updateano : "+ mContentVO.getUpdateano()+
									", writer : " +mContentVO.getWriter()+"\n");

				
				
				
				service.mContentUpdate(mContentVO);
				
				
				rttr.addFlashAttribute("msg33", "저장되었습니다.");
				return "redirect:/mContentReadView.do?mno=" + mContentVO.getMno();
			}
		}else{
			if(arr.length==2){
				if(result == 1){
					if(arr[0].equals(arr[1]) ){
						MContentVO vo = new MContentVO();
						vo = service.mContentRead(mContentVO.getMno());
						MContentLogVO mContentlogVO = new MContentLogVO();
						mContentVO.setPeriod("use");
						mContentlogVO.setMno(vo.getMno());
						mContentlogVO.setSubject(vo.getSubject());
						mContentlogVO.setContent(vo.getContent());
						mContentlogVO.setUpdater(updater);
						mContentlogVO.setUpdaterright(updaterright);
						mContentlogVO.setUpdateano(ano);
						mContentlogVO.setWriter(vo.getWriter());
						mContentlogVO.setRight(vo.getRight());
						mContentlogVO.setWritedate(vo.getUpdatedate());
						mContentlogVO.setAno(vo.getAno());
						mContentlogVO.setContentbyte(vo.getContentbyte());
						mContentlogVO.setCommentx(" ");
						if(vo.getUpdateano() != 0){
							mContentlogVO.setAno(vo.getUpdateano());
						}
						if(vo.getUpdater() != null){
							mContentlogVO.setWriter(vo.getUpdater());
							mContentlogVO.setRight(vo.getUpdaterright());
						}
						if(!vo.getPeriod().equals(mContentVO.getPeriod())){
							mContentlogVO.setCommentx("※정기 컨텐츠 체크");
						}
						System.out.println("\n3-1=================================================================================================================");
						System.out.println("commentx : "+ mContentlogVO.getCommentx()+", ano : "+mContentlogVO.getAno()+", mno : "+mContentlogVO.getMno()+
								", subject : "+mContentlogVO.getSubject()+", \n content : \n"+mContentlogVO.getContent()+ "\n, updater : "+mContentlogVO.getUpdater()+
								", updaterright : "+mContentlogVO.getUpdaterright()+", updateano : "+mContentlogVO.getUpdateano()+", writer : "+mContentlogVO.getWriter()+
								", right : "+mContentlogVO.getRight()+", writedate : "+mContentlogVO.getWritedate()+"\n");
						service.insert_log(mContentlogVO);
						
						mContentVO.setUpdateano(ano);
						System.out.println("\n3-2=================================================================================================================");
						System.out.println("subject : "+ mContentVO.getSubject()+", \n content : \n"+mContentVO.getContent()+"\n, period : "+mContentVO.getPeriod()+", updater : "+
											mContentVO.getUpdater()+", updaterright : "+mContentVO.getUpdaterright()+", updateano : "+ mContentVO.getUpdateano()+
											", writer : " +mContentVO.getWriter()+"\n");

						
						
						
						service.mContentUpdate(mContentVO);
						
						
						rttr.addFlashAttribute("msg33", "저장되었습니다.");
						return "redirect:/mContentReadView.do?mno=" + mContentVO.getMno();
						
					}else{
						
						rttr.addFlashAttribute("umsg", "이미 정기 등록컨테츠가 있습니다.\\n설정하시려면 해당컨텐츠를 해제한 후 설정해주세요. ");
						return "redirect:/mContentUpdateView.do?mno="+mContentVO.getMno();
					}
									
				}else{
					MContentVO vo = new MContentVO();
					vo = service.mContentRead(mContentVO.getMno());
					MContentLogVO mContentlogVO = new MContentLogVO();
					mContentVO.setPeriod("use");
					mContentlogVO.setMno(vo.getMno());
					mContentlogVO.setSubject(vo.getSubject());
					mContentlogVO.setContent(vo.getContent());
					mContentlogVO.setUpdater(updater);
					mContentlogVO.setUpdaterright(updaterright);
					mContentlogVO.setUpdateano(ano);
					mContentlogVO.setWriter(vo.getWriter());
					mContentlogVO.setRight(vo.getRight());
					mContentlogVO.setWritedate(vo.getUpdatedate());
					mContentlogVO.setAno(vo.getAno());
					mContentlogVO.setContentbyte(vo.getContentbyte());
					mContentlogVO.setCommentx(" ");
					if(vo.getUpdateano() != 0){
						mContentlogVO.setAno(vo.getUpdateano());
					}
					if(vo.getUpdater() != null){
						mContentlogVO.setWriter(vo.getUpdater());
						mContentlogVO.setRight(vo.getUpdaterright());
					}
					if(!vo.getPeriod().equals(mContentVO.getPeriod())){
						mContentlogVO.setCommentx("※정기 컨텐츠 체크");
					}
					System.out.println("\n4-1=================================================================================================================");
					System.out.println("commentx : "+ mContentlogVO.getCommentx()+", ano : "+mContentlogVO.getAno()+", mno : "+mContentlogVO.getMno()+
							", subject : "+mContentlogVO.getSubject()+", \n content : \n"+mContentlogVO.getContent()+ "\n, updater : "+mContentlogVO.getUpdater()+
							", updaterright : "+mContentlogVO.getUpdaterright()+", updateano : "+mContentlogVO.getUpdateano()+", writer : "+mContentlogVO.getWriter()+
							", right : "+mContentlogVO.getRight()+", writedate : "+mContentlogVO.getWritedate()+"\n");
					
					service.insert_log(mContentlogVO);
					
					mContentVO.setUpdateano(ano);
					System.out.println("\n4-2=================================================================================================================");
					System.out.println("subject : "+ mContentVO.getSubject()+",  \n content : \n"+mContentVO.getContent()+"\n, period : "+mContentVO.getPeriod()+", updater : "+
										mContentVO.getUpdater()+", updaterright : "+mContentVO.getUpdaterright()+", updateano : "+ mContentVO.getUpdateano()+
										", writer : " +mContentVO.getWriter()+"\n");

					
					
					
					service.mContentUpdate(mContentVO);
					
					rttr.addFlashAttribute("msg33", "저장되었습니다.");
					return "redirect:/mContentReadView.do?mno=" + mContentVO.getMno();
				}
				
			}else{
				MContentVO vo = new MContentVO();
				vo = service.mContentRead(mContentVO.getMno());
				MContentLogVO mContentlogVO = new MContentLogVO();
			
				mContentlogVO.setMno(vo.getMno());
				mContentlogVO.setSubject(vo.getSubject());
				mContentlogVO.setContent(vo.getContent());
				mContentlogVO.setUpdater(updater);
				mContentlogVO.setUpdaterright(updaterright);
				mContentlogVO.setUpdateano(ano);
				mContentlogVO.setWriter(vo.getWriter());
				mContentlogVO.setRight(vo.getRight());
				mContentlogVO.setWritedate(vo.getUpdatedate());
				mContentlogVO.setAno(vo.getAno());
				mContentlogVO.setContentbyte(vo.getContentbyte());
				mContentlogVO.setCommentx(" ");
				if(vo.getUpdateano() != 0){
					mContentlogVO.setAno(vo.getUpdateano());
				}
				if(vo.getUpdater() != null){
					mContentlogVO.setWriter(vo.getUpdater());
					mContentlogVO.setRight(vo.getUpdaterright());
				}
				if(!vo.getPeriod().equals(mContentVO.getPeriod())){
					mContentlogVO.setCommentx("※정기 컨텐츠 체크해제");
				}
				System.out.println("\n 5-1=================================================================================================================");
				System.out.println("commentx : "+ mContentlogVO.getCommentx()+", ano : "+mContentlogVO.getAno()+", mno : "+mContentlogVO.getMno()+
						", subject : "+mContentlogVO.getSubject()+", \n content : \n"+mContentlogVO.getContent()+ "\n, updater : "+mContentlogVO.getUpdater()+
						", updaterright : "+mContentlogVO.getUpdaterright()+", updateano : "+mContentlogVO.getUpdateano()+", writer : "+mContentlogVO.getWriter()+
						", right : "+mContentlogVO.getRight()+", writedate : "+mContentlogVO.getWritedate()+"\n");
			
				service.insert_log(mContentlogVO);
				
				mContentVO.setUpdateano(ano);
				System.out.println("\n 5-2=================================================================================================================");
				System.out.println("subject : "+ mContentVO.getSubject()+", \n content : \n"+mContentVO.getContent()+"\n, period : "+mContentVO.getPeriod()+", updater : "+
									mContentVO.getUpdater()+", updaterright : "+mContentVO.getUpdaterright()+", updateano : "+ mContentVO.getUpdateano()+
									", writer : " +mContentVO.getWriter()+"\n");

				
				
				
				service.mContentUpdate(mContentVO);
			/*	
				if(mContentVO.getPeriod().equals(vo.getPeriod())){
					mContentlogVO.setComments("");
				}else{
					mContentlogVO.setComments("( 정기 컨텐츠 변경 )");
				}*/
				
				
				
				
				rttr.addFlashAttribute("msg33", "저장되었습니다.");
				return "redirect:/mContentReadView.do?mno=" + mContentVO.getMno();
			}
			
		}
	
			
		
		
		
	}
	@RequestMapping(value="/mContentDelete.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String mContentDelete(RedirectAttributes rttr, HttpServletRequest request, MContentLogVO mContentlogVO, Model model, MContentVO mContentVO) throws Exception{
		
		System.out.println("mno : "+ mContentVO.getMno() );
		service.mContentDelete(mContentVO.getMno());
		service.mContentDelete_log(mContentVO.getMno());
		rttr.addFlashAttribute("msgdelete", "컨텐츠가 삭제됐습니다.");
		
		return "redirect:/mContentList.do";
	}
	
	@RequestMapping(value="/mContentDeleteCheck.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String mContentDeleteChk(RedirectAttributes rttr, HttpServletRequest req, @ModelAttribute("scri") SearchCriteria scri, MContentLogVO mContentlogVO, Model model, MContentVO mContentVO) throws Exception{
		String[] arr = req.getParameterValues("chk");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.mContentListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.mContentListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("scri", scri);
		
		for(int i=0; i<arr.length;i++){
			mContentVO = service.mContentRead(Integer.parseInt(arr[i]));
			service.mContentDelete(Integer.parseInt(arr[i]));
			service.mContentDelete_log(Integer.parseInt(arr[i]));
			
		}
		
		
	
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		System.out.println("mno : "+ mContentVO.getMno() );
		/*
		service.mContentDelete(mContentVO.getMno());
		service.mContentDelete_log(mContentVO.getMno());
		*/
		rttr.addFlashAttribute("msgdelete", "컨텐츠가 삭제됐습니다.");
		
		return "redirect:/mContentList.do";
	}
	
	@RequestMapping(value="/mContentReset.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String mContentReset(RedirectAttributes rttr, HttpServletRequest request, MContentLogVO mContentlogVO, Model model, MContentVO mContentVO) throws Exception{
		HttpSession session = request.getSession();
		//int ano = Integer.parseInt(request.getParameter("ano"));
		int ano = (int) session.getAttribute("memberNo");
		//String updater = request.getParameter("updater");
		String updater = (String) session.getAttribute("memberName");
		//String updaterright = request.getParameter("updaterright");
		String updaterright = (String) session.getAttribute("memberRight");
		String updaterID = (String)session.getAttribute("member");
		int loglno = Integer.parseInt(request.getParameter("loglno"));
		int loglmo = Integer.parseInt(request.getParameter("logmno"));
		System.out.println("----------------------------------------------------------------------------\n"+loglno);
		mContentVO = service.mContentRead(loglmo);
		
		mContentlogVO = service.mContentLogRead(loglno);
		
		MContentLogVO logVO = new MContentLogVO();
		MContentVO vo = new MContentVO();
		logVO.setSubject(mContentVO.getSubject());
		logVO.setContent(mContentVO.getContent());
		logVO.setWriter(mContentVO.getUpdater());
		logVO.setRight(mContentVO.getUpdaterright());
		logVO.setUpdater(updater);
		logVO.setUpdaterright(updaterright);
		logVO.setAno(mContentVO.getUpdateano());
		logVO.setUpdateano(ano);
		logVO.setCommentx("※ " + updater+"("+ updaterID  +")가 되돌림");
		logVO.setContentbyte(mContentVO.getContentbyte());
		logVO.setWritedate(mContentVO.getUpdatedate());
		logVO.setMno(mContentVO.getMno());
		logVO.setUpdatelno(loglno);
		vo.setSubject(mContentlogVO.getSubject());
		vo.setContent(mContentlogVO.getContent());
		vo.setLno(loglno);
		vo.setUpdater(updater);
		vo.setUpdateano(ano);
		vo.setMno(mContentVO.getMno());
		vo.setUpdaterright(updaterright);
		vo.setContentbyte(mContentlogVO.getContentbyte());
		rttr.addFlashAttribute("msg33", "편집본을 되돌렸습니다.");
		
	
		
		service.insert_log2(logVO);
		service.mContentReset(vo);
		
		
		
		return "redirect:/mContentReadView.do?mno=" + mContentVO.getMno();
	}
	
}
