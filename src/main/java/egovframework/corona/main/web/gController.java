package egovframework.corona.main.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/g/*")
public class gController {
	private static final Logger logger = LoggerFactory.getLogger(EgovAdminLoginController.class);
	
	@RequestMapping(value = "/blockcrush.do",  method = RequestMethod.GET)
	public String blockcrush() {
		return "g/g1";
	}

	@RequestMapping(value = "/kung.do",  method = RequestMethod.GET)
	public String kung() {
		return "g/g2";
	}
	@RequestMapping(value = "/picPicker.do",  method = RequestMethod.GET)
	public String picPicker() {
		return "g/g3";
	}
	@RequestMapping(value = "/a.do",  method = RequestMethod.GET)
	public String tetris() {
		return "g/g4";
	}
	
	
}
