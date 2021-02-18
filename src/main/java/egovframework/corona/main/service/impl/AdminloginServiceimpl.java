package egovframework.corona.main.service.impl;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import egovframework.corona.main.service.AdminloginService;
import egovframework.corona.main.service.AdminloginVO;
import egovframework.corona.main.service.ConfirmVO;
import egovframework.corona.main.service.SearchCriteria;


@Service("adminLoginService")
public class AdminloginServiceimpl implements AdminloginService{
	@Resource(name="adminLoginMapper")
	private AdminloginMapper adminLoginMapper;

	@Override
	public int login(AdminloginVO vo) throws Exception{
		// TODO Auto-generated method stub
		return adminLoginMapper.login(vo);
	}

	@Override
	public void adminSignUp(AdminloginVO vo) {
		// TODO Auto-generated method stub
		adminLoginMapper.adminSignUp(vo);
	
	}

	@Override
	public List<AdminloginVO> adminList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.adminList(scri);
	}

	@Override
	public int adminListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.adminListCount(scri);
	}

	@Override
	public int idCheck(String adminId) throws Exception {
		// TODO Auto-generated method stub
		int result = adminLoginMapper.idCheck(adminId);
		return result;
	}

	@Override
	public void signUp(AdminloginVO vo) throws Exception{
		// TODO Auto-generated method stub
		adminLoginMapper.signUp(vo);
		
	}

	@Override
	public int checkcheck(AdminloginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.checkcheck(vo);
	}

	@Override
	public AdminloginVO adminRead(int ano) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.adminRead(ano);
	}

	@Override
	public void adminUpdate(AdminloginVO vo) throws Exception {
		// TODO Auto-generated method stub
		adminLoginMapper.adminUpdate(vo);
	}

	@Override
	public void adminPwUpdate(AdminloginVO vo) throws Exception {
		// TODO Auto-generated method stub
		adminLoginMapper.adminPwUpdate(vo);
	}

	@Override
	public void adminDelete(int ano) throws Exception {
		// TODO Auto-generated method stub
		adminLoginMapper.adminDelete(ano);
	}

	@Override
	public int confirmId(String adminId) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.confirmId(adminId);
	}

	@Override
	public int confirmRight(AdminloginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.confirmRight(vo);
	}

	@Override
	public AdminloginVO adminData(String adminId) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.adminData(adminId);
	}

	@Override
	public int idChk(AdminloginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.idChk(vo);
	}

	@Override
	public int passChk(AdminloginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.passChk(vo);
	}

	@Override
	public int anoCheck(int ano) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.anoCheck(ano);
	}

	@Override
	public List<AdminloginVO> adminList2(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.adminList2(scri);
	}

	@Override
	public List<AdminloginVO> adminList3(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.adminList3(scri);
	}

	@Override
	public List<AdminloginVO> adminList4(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginMapper.adminList4(scri);
	}

	@Override
	public int kakaoLogin(String account) {
		// TODO Auto-generated method stub
		return adminLoginMapper.kakaoLogin(account);
	}

	@Override
	public AdminloginVO kakaoAccount(String account) {
		// TODO Auto-generated method stub
		return adminLoginMapper.kakaoAccount(account);
	}

	@Override
	public void kakaoRegister(AdminloginVO vo) {
		// TODO Auto-generated method stub
		adminLoginMapper.kakaoRegister(vo);
	}

	@Override
	public int kakaoCount(String adminId) {
		// TODO Auto-generated method stub
		return adminLoginMapper.kakaoCount(adminId);
	}

	@Override
	public void kakaoDelete(String adminId) {
		// TODO Auto-generated method stub
		adminLoginMapper.kakaoDelete(adminId);
	}
	
	   
	

}
