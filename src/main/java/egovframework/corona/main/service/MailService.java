package egovframework.corona.main.service;

import java.util.List;

public interface MailService {
	public void insertMail(MailVO vo)throws Exception; 
	public List<MailVO> subList(SearchCriteria scri) throws Exception;
	
	public int subListCount(SearchCriteria scri) throws Exception;
	public MailVO subRead(int cmno) throws Exception;
	public void subDelete(int cmno) throws Exception;
	public int checkMail(String mailaddress)throws Exception;
}
