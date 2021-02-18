package egovframework.corona.main.service.impl;


import java.util.List;


import egovframework.corona.main.service.MailVO;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mailMapper")
public interface MailMapper {
	public void insertMail(MailVO vo)throws Exception; 
	public List<MailVO> subList(SearchCriteria scri) throws Exception;
	
	public int subListCount(SearchCriteria scri) throws Exception;
	
	public MailVO subRead(int cmno) throws Exception;
	
	public void subDelete(int cmno) throws Exception;
	public int checkMail(String mailaddress)throws Exception;

}
