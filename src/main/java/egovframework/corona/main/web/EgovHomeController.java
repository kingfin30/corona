package egovframework.corona.main.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.corona.main.service.ConfirmService;
import egovframework.corona.main.service.ConfirmVO;
import egovframework.corona.main.service.TableMaker;



/**
 * Handles requests for the application home page.
 */
@Controller
public class EgovHomeController {
	

	@Resource(name="confirmService")
	private ConfirmService service;
	

	
	@RequestMapping(value = "/index.do")
	public String index(ConfirmVO confirmVO, Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		TableMaker tb = new TableMaker();
	
		tb.setiConfirm(service.confirms(confirmVO));
		tb.setiRealese(service.releases(confirmVO));
		tb.setiDead(service.deads(confirmVO));
		tb.setSumDead(service.selectSumDeads(confirmVO));
		tb.setSumRelease(service.selectSumReleases(confirmVO));
		tb.setSumConfirm(service.selectSumConfirms(confirmVO));
		model.addAttribute("table", tb);
	

		return "index/index";
	}
	@RequestMapping(value = "/intro.do",  method = RequestMethod.GET)
	public String introduce() {
		return "index/introduce";
	}

	
}
