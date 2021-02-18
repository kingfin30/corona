package egovframework.corona.main.service;

import java.util.List;

public interface AdminloginService{
	
	public void adminSignUp(AdminloginVO vo);
	
	public int login(AdminloginVO vo) throws Exception;
	
	public int kakaoLogin(String account);
	
	public AdminloginVO kakaoAccount(String account);
	
	public int kakaoCount(String adminId);
	
	public void kakaoRegister(AdminloginVO vo);
	
	public List<AdminloginVO> adminList(SearchCriteria scri) throws Exception;
	public List<AdminloginVO> adminList2(SearchCriteria scri) throws Exception;
	public List<AdminloginVO> adminList3(SearchCriteria scri) throws Exception;
	public List<AdminloginVO> adminList4(SearchCriteria scri) throws Exception;
	
	public int adminListCount(SearchCriteria scri) throws Exception;
	
	public int idCheck(String adminId)throws Exception;
	
	public void signUp(AdminloginVO vo)throws Exception;
	
	public int checkcheck(AdminloginVO vo)throws Exception;
	
	public AdminloginVO adminRead(int ano) throws Exception;
	
	public AdminloginVO adminData(String adminId) throws Exception;
	
	public void kakaoDelete(String adminId);
	
	public void adminUpdate(AdminloginVO vo)throws Exception;
	
	public void adminPwUpdate(AdminloginVO vo)throws Exception;
	
	public void adminDelete(int ano)throws Exception;
	
	public int confirmId(String adminId) throws Exception;
	
	public int idChk(AdminloginVO vo)throws Exception;	
	
	public int passChk(AdminloginVO vo)throws Exception;
	
	public int confirmRight(AdminloginVO vo) throws Exception;
	
	public int anoCheck(int ano)throws Exception;
}
