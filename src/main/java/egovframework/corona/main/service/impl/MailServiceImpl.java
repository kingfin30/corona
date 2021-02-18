package egovframework.corona.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.corona.main.service.MailService;
import egovframework.corona.main.service.MailVO;
import egovframework.corona.main.service.SearchCriteria;

@Service("mailService")
public class MailServiceImpl implements MailService{
	@Resource(name="mailMapper")
	private MailMapper mailMapper;

	@Override
	public void insertMail(MailVO vo) throws Exception {
		// TODO Auto-generated method stub
		mailMapper.insertMail(vo);		
	}

	@Override
	public List<MailVO> subList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mailMapper.subList(scri);
	}

	@Override
	public int subListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mailMapper.subListCount(scri);
	}

	@Override
	public MailVO subRead(int cmno) throws Exception {
		// TODO Auto-generated method stub
		return mailMapper.subRead(cmno);
	}

	@Override
	public void subDelete(int cmno) throws Exception {
		// TODO Auto-generated method stub
		mailMapper.subDelete(cmno);
	}

	@Override
	public int checkMail(String mailaddress) throws Exception {
		// TODO Auto-generated method stub
		return mailMapper.checkMail(mailaddress);
	}

}
