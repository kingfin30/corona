package egovframework.corona.main.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.corona.main.service.ConfirmService;
import egovframework.corona.main.service.ConfirmVO;
import egovframework.corona.main.service.Days30;
import egovframework.corona.main.service.Days7;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.corona.main.service.TableMaker;

@Service("confirmService")
public class ConfirmServiceImpl implements ConfirmService {
	
	
	@Resource(name="confirmMapper")
	private ConfirmMapper confirmMapper;

	@Override
	public void write(ConfirmVO vo) throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.write(vo);
	}

	@Override
	public List<ConfirmVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.list(scri);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.listCount(scri);
	}

	@Override
	public ConfirmVO read(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.read(cno);
	}

	@Override
	public void update(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.update(confirmVO);
		
	}

	@Override
	public void updateRelease(int cno) throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.updateRelease(cno);
		
	}

	@Override
	public void updateDead(int cno) throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.updateDead(cno);
		
	}
	

	@Override
	public int confirms(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectConfirms(confirmVO);
	}

	@Override
	public int releases(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectReleases(confirmVO);
	}

	@Override
	public int deads(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDeads(confirmVO);
	}

	@Override
	public void updateReset(int cno) throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.updateReset(cno);
		
	}

	@Override
	public int selectSumDeads(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectSumDeads(confirmVO);
	}

	@Override
	public int selectSumReleases(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectSumReleases(confirmVO);
	}

	@Override
	public int selectSumConfirms(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectSumConfirms(confirmVO);
	}

	@Override
	public int selectDay_0(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDay_0(confirmVO);
	}

	@Override
	public int selectDay_1(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDay_1(confirmVO);
	}

	@Override
	public int selectDay_2(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDay_2(confirmVO);
	}

	@Override
	public int selectDay_3(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDay_3(confirmVO);
	}

	@Override
	public int selectDay_4(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDay_4(confirmVO);
	}

	@Override
	public int selectDay_5(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDay_5(confirmVO);
	}

	@Override
	public int selectDay_6(ConfirmVO confirmVO) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.selectDay_6(confirmVO);
	}

	@Override
	public Date Day6() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.Day6();
	}

	@Override
	public Date Day5() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.Day5();
	}

	@Override
	public Date Day4() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.Day4();
	}

	@Override
	public Date Day3() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.Day3();
	}

	@Override
	public Date Day2() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.Day2();
	}

	@Override
	public Date Day1() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.Day1();
	}

	@Override
	public Date Day0() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.Day0();
	}

	@Override
	public void updateDays(Days7 days) throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.updateDays(days);
		
	}

	@Override
	public int SEL(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.SEL(cno);
	}

	@Override
	public int PUS(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.PUS(cno);
	}

	@Override
	public int TAE(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.TAE(cno);
	}

	@Override
	public int INC(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.INC(cno);
	}

	@Override
	public int KWJ(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KWJ(cno);
	}

	@Override
	public int TAJ(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.TAJ(cno);
	}

	@Override
	public int USN(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.USN(cno);
	}

	@Override
	public int KYG(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KYG(cno);
	}

	@Override
	public int KAW(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KAW(cno);
	}

	@Override
	public int CCB(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CCB(cno);
	}

	@Override
	public int CCN(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CCN(cno);
	}

	@Override
	public int CLB(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CLB(cno);
	}

	@Override
	public int CLN(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CLN(cno);
	}

	@Override
	public int KSB(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KSB(cno);
	}

	@Override
	public int KSN(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KSN(cno);
	}

	@Override
	public int CHJ(int cno) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CHJ(cno);
	}

	@Override
	public void SELchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.SELchk();
	}

	@Override
	public void PUSchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.PUSchk();
	}

	@Override
	public void TAEchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.TAEchk();
	}

	@Override
	public void INCchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.INCchk();
	}

	@Override
	public void KWJchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.KWJchk();
	}

	@Override
	public void TAJchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.TAJchk();
	}

	@Override
	public void USNchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.USNchk();
	}

	@Override
	public void KYGchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.KYGchk();
	}

	@Override
	public void KAWchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.KAWchk();
	}

	@Override
	public void CCBchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.CCBchk();
	}

	@Override
	public void CCNchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.CCNchk();
	}

	@Override
	public void CLBchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.CLBchk();
	}

	@Override
	public void CLNchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.CLNchk();
	}

	@Override
	public void KSBchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.KSBchk();
	}

	@Override
	public void KSNchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.KSNchk();
	}

	@Override
	public void CHJchk() throws Exception {
		// TODO Auto-generated method stub
		confirmMapper.CHJchk();
	}

	@Override
	public int SELtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.SELtoday();
	}

	@Override
	public int PUStoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.PUStoday();
	}

	@Override
	public int TAEtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.TAEtoday();
	}

	@Override
	public int INCtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.INCtoday();
	}

	@Override
	public int KWJtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KWJtoday();
	}

	@Override
	public int TAJtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.TAJtoday();
	}

	@Override
	public int USNtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.USNtoday();
	}

	@Override
	public int KYGtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KYGtoday();
	}

	@Override
	public int KAWtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KAWtoday();
	}

	@Override
	public int CCBtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CCBtoday();
	}

	@Override
	public int CCNtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CCNtoday();
	}

	@Override
	public int CLBtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CLBtoday();
	}

	@Override
	public int CLNtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CLNtoday();
	}

	@Override
	public int KSBtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KSBtoday();
	}

	@Override
	public int KSNtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.KSNtoday();
	}

	@Override
	public int CHJtoday() throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.CHJtoday();
	}

	@Override
	public ConfirmVO data(int rnum) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.data(rnum);
	}

	@Override
	public int REGchk(String region) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.REGchk(region);
	}

	@Override
	public int REGtoday(String region) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.REGtoday(region);
	}

	@Override
	public int REGacc(String region) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.REGacc(region);
	}

	@Override
	public int select_0(String state) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.select_0(state);
	}

	@Override
	public int select_1(String state) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.select_1(state);
	}

	@Override
	public int select_2(String state) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.select_2(state);
	}

	@Override
	public int select_3(String state) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.select_3(state);
	}

	@Override
	public int select_4(String state) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.select_4(state);
	}

	@Override
	public int select_5(String state) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.select_5(state);
	}

	@Override
	public int select_6(String state) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.select_6(state);
	}

	@Override
	public int local(String local) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.local(local);
	}

	@Override
	public int gender(String gender) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.gender(gender);
	}

	@Override
	public int local_to(String local) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.local_to(local);
	}

	@Override
	public int gender_to(String gender) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.gender_to(gender);
	}

	@Override
	public int local_sum(String local) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.local_sum(local);
	}

	@Override
	public int gender_sum(String gender) throws Exception {
		// TODO Auto-generated method stub
		return confirmMapper.gender_sum(gender);
	}




		
}

	


