package egovframework.corona.main.web;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import egovframework.corona.main.service.AdminloginVO;
import egovframework.corona.main.service.ByteArrayDataSource;
import egovframework.corona.main.service.ConfirmService;
import egovframework.corona.main.service.ConfirmVO;
import egovframework.corona.main.service.MContentService;
import egovframework.corona.main.service.MContentVO;
import egovframework.corona.main.service.MailService;
import egovframework.corona.main.service.MailVO;
import egovframework.corona.main.service.PageMaker;
import egovframework.corona.main.service.SearchCriteria;

@Controller
public class EgovMailController extends HttpServlet{
	private static final Logger logger = LoggerFactory.getLogger(EgovAdminLoginController.class);
	
	@Resource(name="mailService")
	private MailService service;
	
	@Resource(name="mContentService")
	private MContentService mContentService;
	
	@Resource(name="confirmService")
	private ConfirmService confirmService;
	
	@RequestMapping(value="/sender.do")
	public String sender(){
		return "/admin/mailSender";
	}
	@RequestMapping(value="/sender2.do")
	public String sender2(){
		return "/admin/mailSender2";
	}
	@RequestMapping(value="/insertMail.do")
	public String insertMail(HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		MailVO vo = new MailVO();
		vo.setCbirth(req.getParameter("cbirth"));
		vo.setMailaddress(req.getParameter("mailaddress"));
		vo.setCname(req.getParameter("cname"));
		System.out.println(vo.toString());
		if(service.checkMail(vo.getMailaddress())==0){
			service.insertMail(vo);
			rttr.addFlashAttribute("submsg", vo.getCname()+"님의 구독 신청이 완료되었습니다.");
			return "redirect:/index.do";
		}else{
			rttr.addFlashAttribute("submsg", "이미 등록된 이메일 입니다.");
			return "redirect:/index.do";
		}
		
		
	}
	@RequestMapping(value="subscribeList.do")
	public String subscribeList(HttpServletRequest req, Model model, RedirectAttributes rttr, @ModelAttribute("scri") SearchCriteria scri)throws Exception{
		
		HttpSession session = req.getSession();
		if(session.getAttribute("member")!=null){
			model.addAttribute("subList", service.subList(scri));
			PageMaker pageMaker2 = new PageMaker();
			pageMaker2.setCri(scri);
			pageMaker2.setTotalCount(service.subListCount(scri));
			pageMaker2.setTotalPage((int)Math.ceil(((float)service.subListCount(scri)/scri.getPerPageNum())));
			model.addAttribute("pageMaker",pageMaker2);
			
			
				return "/subscribe/subList";

		}else{
			  rttr.addFlashAttribute("msg", "로그인이 필요합니다.");

	          return "redirect:/login.do";	
		}

	}

	
	@RequestMapping(value="/sendMail.do")
	public String mailSender(HttpServletRequest request, RedirectAttributes rttr)throws AddressException, MessagingException{
		String subject = (String) request.getParameter("subject");
		String message = (String) request.getParameter("message");
		String receiver = (String) request.getParameter("receiver");
		final String host = "smtp.gmail.com";
		final String accountId = "dlatjdanr786";
		final String accountPwd = "anr957050";
		final int port = 465;
		
		String sender = "noreply@mookcorona.tk";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host );
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(accountId,accountPwd);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
	
		
		mimeMessage.setFrom(new InternetAddress(sender));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		
		mimeMessage.setSubject(subject);
		mimeMessage.setContent(message,"text/html; charset=utf-8");
		Transport.send(mimeMessage);
		rttr.addFlashAttribute("mailmsg", "메일 전송 완료");
		return "redirect:/sender.do";
	}
	@RequestMapping(value = "/subDeleteCheck.do", method = RequestMethod.POST)
	public String subDeleteCheck(HttpServletRequest req, RedirectAttributes rttr, HttpSession session, MailVO vo,  @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
		logger.info("subDeleteCheck");
		String[] arr = req.getParameterValues("chk");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.subListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.subListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());


			for(int i=0; i<arr.length;i++){
				vo = service.subRead(Integer.parseInt(arr[i]));
			
					service.subDelete(Integer.parseInt(arr[i]));
				
			}
			rttr.addFlashAttribute("msg2", arr.length + "명의 구독자를 삭제했습니다.");
		
		
		
		return "redirect:/subscribeList.do";
	}
	@RequestMapping(value = "/subSendCheck.do", method = RequestMethod.POST)
	public String subSendCheck(HttpServletRequest req, RedirectAttributes rttr, HttpSession session, MailVO vo,  @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
		logger.info("subSendCheck");
		if(mContentService.mContentPeriodCount()>0){
		ConfirmVO confirmVO = new ConfirmVO();
		
		MContentVO mContentVO= new MContentVO();
		mContentVO = mContentService.mContentPeriod();
		String subMessage = 
				"일일 확진자 수  : " + confirmService.confirms(confirmVO) + "\n"+
				"일일 격리해제 수  : " + confirmService.releases(confirmVO) + "\n"+
				"일일 사망자 수  : " + confirmService.deads(confirmVO) + "\n\n";
		String subject = mContentVO.getSubject();
		String message = subMessage + mContentVO.getContent();

		final String host = "smtp.gmail.com";
		final String accountId = "dlatjdanr786";
		final String accountPwd = "anr957050";
		final int port = 465;
		
		String sender = "noreply@mookcorona.tk";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host );
		
		String[] arr = req.getParameterValues("chk");
		InternetAddress[] toAddr = new InternetAddress[arr.length];
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.subListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.subListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());


		for(int i=0; i<arr.length;i++){
			vo = service.subRead(Integer.parseInt(arr[i]));
			toAddr[i] = new InternetAddress(vo.getMailaddress());

		}
		Session mailsession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(accountId,accountPwd);
			}
		});
		mailsession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailsession);
		mimeMessage.setFrom(new InternetAddress(sender));
		mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(message);
		Transport.send(mimeMessage);
		rttr.addFlashAttribute("mailmsg", arr.length+ "명의 구독자에게 메일을 전송했습니다.");

		}else
			rttr.addFlashAttribute("mailmsg","보낼 정기 컨텐츠가 존재하지않습니다.");
		

		return "redirect:/subscribeList.do";
	}
	@RequestMapping(value = "/subSendCheckInput.do", method = RequestMethod.POST)
	public String subSendCheckInput(HttpServletRequest req, RedirectAttributes rttr, HttpSession session, MailVO vo,  @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
		logger.info("subSendCheckInput");
		
		
		ConfirmVO confirmVO = new ConfirmVO();
		
		MContentVO mContentVO= new MContentVO();
		System.out.println("-----------------------------------------------------\n"+req.getParameter("mrno2"));
		int rnum = Integer.parseInt(req.getParameter("mrno2"));
		if(mContentService.mContentDataCount(rnum) > 0){
		mContentVO = mContentService.mContentData(rnum);
		String subMessage = 
				"일일 확진자 수  : " + confirmService.confirms(confirmVO) + "\n"+
				"일일 격리해제 수  : " + confirmService.releases(confirmVO) + "\n"+
				"일일 사망자 수  : " + confirmService.deads(confirmVO) + "\n\n";
		String subject = mContentVO.getSubject();
		String message = subMessage + mContentVO.getContent();

		final String host = "smtp.gmail.com";
		final String accountId = "dlatjdanr786";
		final String accountPwd = "anr957050";
		final int port = 465;
		
		String sender = "noreply@mookcorona.tk";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host );
		
		String[] arr = req.getParameterValues("chk");
		InternetAddress[] toAddr = new InternetAddress[arr.length];
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.subListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.subListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());


		for(int i=0; i<arr.length;i++){
			vo = service.subRead(Integer.parseInt(arr[i]));
			toAddr[i] = new InternetAddress(vo.getMailaddress());

		}
		Session mailsession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(accountId,accountPwd);
			}
		});
		mailsession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailsession);
		mimeMessage.setFrom(new InternetAddress(sender));
		mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(message);
		Transport.send(mimeMessage);
		rttr.addFlashAttribute("mailmsg", arr.length+ "명의 구독자에게 "+req.getParameter("mrno2")+ "번 메일을 전송했습니다.");
		}else
			rttr.addFlashAttribute("mailmsg", "해당 컨텐츠가 존재하지 않습니다.");
		
		return "redirect:/subscribeList.do";
	}
	@RequestMapping(value = "/subSendAll.do", method = RequestMethod.POST)
	public String subSendAll(HttpServletRequest req, RedirectAttributes rttr, HttpSession session, MailVO vo,  @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
		logger.info("subSendAll");
		if(mContentService.mContentPeriodCount()>0){
		ConfirmVO confirmVO = new ConfirmVO();
		MContentVO mContentVO= new MContentVO();
		mContentVO = mContentService.mContentPeriod();
		String subMessage = 
				"일일 확진자 수  : " + confirmService.confirms(confirmVO) + "\n"+
				"일일 격리해제 수  : " + confirmService.releases(confirmVO) + "\n"+
				"일일 사망자 수  : " + confirmService.deads(confirmVO) + "\n\n";
		
		String subject = mContentVO.getSubject();
		String message = subMessage + mContentVO.getContent();

		final String host = "smtp.gmail.com";
		final String accountId = "dlatjdanr786";
		final String accountPwd = "anr957050";
		final int port = 465;
		
		String sender = "noreply@mookcorona.tk";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host );
		
		List<MailVO> arr = service.subList(scri);
		InternetAddress[] toAddr = new InternetAddress[arr.size()];
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.subListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.subListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		//다중 메일 전송
		/*for(int i=0; i<arr.size();i++){
			vo = service.subRead(arr.get(i).getCmno());
			toAddr[i] = new InternetAddress(vo.getMailaddress());
		}*/
	
		Session mailsession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(accountId,accountPwd);
			}
		});
		mailsession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailsession);
		mimeMessage.setFrom(new InternetAddress(sender));
		
		//mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(message);
		
		// 다중 사용자에게 하나씩 메일 전송
		for(int i=0; i<arr.size();i++){
			vo = service.subRead(arr.get(i).getCmno());
			toAddr[i] = new InternetAddress(vo.getMailaddress()); 
			mimeMessage.setRecipient(Message.RecipientType.TO, toAddr[i]);
			Transport.send(mimeMessage);
		}
		
		//Transport.send(mimeMessage);
		rttr.addFlashAttribute("mailmsg", "전체 구독자에게 메일을 전송했습니다.");
		}
		else
			rttr.addFlashAttribute("mailmsg", "보낼 정기 컨텐츠가 존재하지않습니다.");
		return "redirect:/subscribeList.do";
	}
	@RequestMapping(value = "/subSendAllInput.do", method = RequestMethod.POST)
	public String subSendAllInput(HttpServletRequest req, RedirectAttributes rttr, HttpSession session, MailVO vo,  @ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception{
		logger.info("subSendAllInput");
	
		ConfirmVO confirmVO = new ConfirmVO();
		MContentVO mContentVO= new MContentVO();
		int rnum = Integer.parseInt(req.getParameter("mrno1"));
		System.out.println("-----------------------------------------------------\n"+rnum);
		
		if(mContentService.mContentDataCount(rnum) != 0){
		mContentVO = mContentService.mContentData(rnum);
		String subMessage = 
				"일일 확진자 수  : " + confirmService.confirms(confirmVO) + "\n"+
				"일일 격리해제 수  : " + confirmService.releases(confirmVO) + "\n"+
				"일일 사망자 수  : " + confirmService.deads(confirmVO) + "\n\n";
		
		String subject = mContentVO.getSubject();
		String message = subMessage + mContentVO.getContent();

		final String host = "smtp.gmail.com";
		final String accountId = "dlatjdanr786";
		final String accountPwd = "anr957050";
		final int port = 465;
		
		String sender = "noreply@mookcorona.tk";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host );
		
		List<MailVO> arr = service.subList(scri);
		InternetAddress[] toAddr = new InternetAddress[arr.size()];
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.subListCount(scri));
		pageMaker.setTotalPage((int)Math.ceil(((float)service.subListCount(scri)/scri.getPerPageNum())));
	 
		model.addAttribute("pageMaker",pageMaker);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		//다중 메일 전송
		/*for(int i=0; i<arr.size();i++){
			vo = service.subRead(arr.get(i).getCmno());
			toAddr[i] = new InternetAddress(vo.getMailaddress());
		}*/
	
		Session mailsession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(accountId,accountPwd);
			}
		});
		mailsession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailsession);
		mimeMessage.setFrom(new InternetAddress(sender));
		
		//mimeMessage.setRecipients(Message.RecipientType.TO, toAddr);
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(message);
		
		// 다중 사용자에게 하나씩 메일 전송
		for(int i=0; i<arr.size();i++){
			vo = service.subRead(arr.get(i).getCmno());
			toAddr[i] = new InternetAddress(vo.getMailaddress());
			mimeMessage.setRecipient(Message.RecipientType.TO, toAddr[i]);
			Transport.send(mimeMessage);
		}
		
		//Transport.send(mimeMessage);
		
		rttr.addFlashAttribute("mailmsg", "전체 구독자에게 "+req.getParameter("mrno1")+ "번 메일을 전송했습니다.");
		}else
			rttr.addFlashAttribute("mailmsg", "해당 컨텐츠가 존재하지 않습니다.");

		return "redirect:/subscribeList.do";
	}
	
	@RequestMapping(value="/fileSend.do")
	public String mailSender2(HttpServletRequest request, RedirectAttributes rttr, MultipartHttpServletRequest mpRequest)throws AddressException, MessagingException{
		String subject = (String) request.getParameter("subject");
		String message = (String) request.getParameter("message");
		String receiver = (String) request.getParameter("receiver");
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath("file");
		final String host = "smtp.gmail.com";
		final String accountId = "dlatjdanr786";
		final String accountPwd = "anr957050";
		final int port = 465;
		 int maxSize = 1024*1024*5;
		 String encType = "euc-kr";
		 String filename1="";
		String sender = "dlatjdanr786@gmail.com";
		
		Properties props = System.getProperties();
		props.put("mail.smtp.user", sender);
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host );
		props.put("mail.smtp.starttls.enable", "true");
		
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
				protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
					return new javax.mail.PasswordAuthentication(accountId,accountPwd);
				}
			});
			MultipartRequest multi=new MultipartRequest(mpRequest, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			Enumeration<?> files = multi.getFileNames();
			String file1=(String)files.nextElement();
			filename1 = multi.getFilesystemName(file1);
			String fullpath= realFolder + "/" + filename1;
			System.out.println("--------------------------------------------------------------------------------------------");
			System.out.println(file1);
			System.out.println(fullpath);

		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setSubject(subject);
		mimeMessage.setFrom(new InternetAddress(sender));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		
		BodyPart messageBodyPart = new MimeBodyPart();
		
		
		messageBodyPart.setText(message);
		Multipart multipart = new MimeMultipart();
		multipart.addBodyPart(messageBodyPart);
		
		
		messageBodyPart = new MimeBodyPart();
		
		String path = new String();
		
		File file = new File(fullpath);
		
		FileDataSource fds = new FileDataSource(file);
		messageBodyPart.setDataHandler(new DataHandler(fds));
		messageBodyPart.setFileName(fds.getName());
		multipart.addBodyPart(messageBodyPart);
		
		
		
		mimeMessage.setContent(multipart, "text/plain;charset=UTF-8");
		
	
		
		Transport.send(mimeMessage);
		rttr.addFlashAttribute("mailmsg", "메일 전송 완료");
		return "redirect:/sender2.do";
		}catch(Exception e){
			System.out.println("I am here??? ");
		
			e.printStackTrace();
			
			rttr.addFlashAttribute("mailmsg", "메일 전송 실패");
			
			return "redirect:/sender2.do";
		}
	}
	



	

}
