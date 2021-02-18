package egovframework.corona.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.corona.main.service.AdminFlag;
import egovframework.corona.main.service.LReceiver;
import egovframework.corona.main.service.LSender;
import egovframework.corona.main.service.LetterService;
import egovframework.corona.main.service.SearchCriteria;

@Service("letterService")
public class LetterServiceImpl implements LetterService{
	@Resource(name="letterMapper")
	private LetterMapper letterMapper;

	@Override
	public void inserts(LSender lSender) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.inserts(lSender);
	}

	@Override
	public void adminRflag(AdminFlag adminFlag) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.adminRflag(adminFlag);
	}

	@Override
	public void insertr(LReceiver lReceiver) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.insertr(lReceiver);
	}

	@Override
	public List<LSender> letterList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.letterList(scri);
	}

	@Override
	public int letterListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.letterListCount(scri);
	}

	@Override
	public List<LReceiver> receiveList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.receiveList(scri);
	}

	@Override
	public int receiveListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.receiveListCount(scri);
	}

	@Override
	public List<AdminFlag> rfList(int lsno) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.rfList(lsno);
	}

	@Override
	public int rfListCount(int lsno) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.rfListCount(lsno);
	}

	@Override
	public LSender letterRead(int lsno) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.letterRead(lsno);
	}

	@Override
	public LReceiver receiveRead(int lrno) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.receiveRead(lrno);
	}

	@Override
	public void read(LReceiver lreceiver) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.read(lreceiver);
	}

	@Override
	public AdminFlag readChk(LReceiver lreceiver) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.readChk(lreceiver);
	}

	@Override
	public int readCount(int ano) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.readCount(ano);
	}

	@Override
	public int sendReadCount(int lsno) throws Exception {
		// TODO Auto-generated method stub
		return letterMapper.sendReadCount(lsno);
	}


	@Override
	public void receiveDelete(LReceiver lreceiver) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.receiveDelete(lreceiver);
	}

	@Override
	public void rFlagDelete(LReceiver lreceiver) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.rFlagDelete(lreceiver);
	}

	@Override
	public void sFlagDelete(LSender lsender) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.sFlagDelete(lsender);
	}

	@Override
	public void sendDelete(LSender lsender) throws Exception {
		// TODO Auto-generated method stub
		letterMapper.sendDelete(lsender);
	}





}
