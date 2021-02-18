package egovframework.corona.main.service.impl;

import java.util.List;

import egovframework.corona.main.service.AdminFlag;
import egovframework.corona.main.service.LReceiver;
import egovframework.corona.main.service.LSender;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("letterMapper")
public interface LetterMapper {
	public void inserts(LSender lSender)throws Exception;
	
	public void adminRflag(AdminFlag adminFlag)throws Exception;
	
	public void insertr(LReceiver lReceiver)throws Exception;
	
	public List<LSender> letterList(SearchCriteria scri)throws Exception;
	
	public int letterListCount(SearchCriteria scri)throws Exception;
	
	public LSender letterRead(int lsno)throws Exception;
	
	public List<LReceiver> receiveList(SearchCriteria scri)throws Exception;
	
	public LReceiver receiveRead(int lrno)throws Exception;
	
	public int  receiveListCount(SearchCriteria scri)throws Exception;
	
	public List<AdminFlag> rfList(int lsno)throws Exception;
	
	public int rfListCount(int lsno)throws Exception;
	
	public void read(LReceiver lreceiver)throws Exception;
	
	public AdminFlag readChk(LReceiver lreceiver)throws Exception;
	
	public int readCount(int ano)throws Exception;
	
	public int sendReadCount(int lsno)throws Exception;
	
	public void sendDelete(LSender lsender)throws Exception;
	
	public void rFlagDelete(LReceiver lreceiver)throws Exception;
	
	public void receiveDelete(LReceiver lreceiver)throws Exception;
	
	public void sFlagDelete(LSender lsender)throws Exception;
	

}
