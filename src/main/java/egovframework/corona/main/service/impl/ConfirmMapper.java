package egovframework.corona.main.service.impl;

import java.util.Date;
import java.util.List;

import egovframework.corona.main.service.ConfirmVO;

import egovframework.corona.main.service.Days7;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("confirmMapper")
public interface ConfirmMapper {
	public void write(ConfirmVO vo)throws Exception;
	
	public List<ConfirmVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public ConfirmVO read(int cno) throws Exception;
	
	public ConfirmVO data(int rnum)throws Exception;
	
	public void update(ConfirmVO confirmVO) throws Exception;
	
	public void updateRelease(int cno) throws Exception;
	
	public void updateDead(int cno) throws Exception;
	
	public void updateReset(int cno) throws Exception;
	
	public int REGchk(String region)throws Exception;
	
	public int REGtoday(String region)throws Exception;
	
	public int REGacc(String region)throws Exception;
	
	public int SEL(int cno) throws Exception;
	
	public int PUS(int cno) throws Exception;
	
	public int TAE(int cno) throws Exception;
	
	public int INC(int cno) throws Exception;
	
	public int KWJ(int cno) throws Exception;
	
	public int TAJ(int cno) throws Exception;
	
	public int USN(int cno) throws Exception;
	
	public int KYG(int cno) throws Exception;
	
	public int KAW(int cno) throws Exception;
	
	public int CCB(int cno) throws Exception;
	
	public int CCN(int cno) throws Exception;
	
	public int CLB(int cno) throws Exception;
	
	public int CLN(int cno) throws Exception;
	
	public int KSB(int cno) throws Exception;	
	
	public int KSN(int cno) throws Exception;
	
	public int CHJ(int cno) throws Exception;
	
	public void SELchk() throws Exception;
	
	public void PUSchk() throws Exception;
	
	public void TAEchk() throws Exception;
	
	public void INCchk() throws Exception;
	
	public void KWJchk() throws Exception;
	
	public void TAJchk() throws Exception;
	
	public void USNchk() throws Exception;
	
	public void KYGchk() throws Exception;
	
	public void KAWchk() throws Exception;
	
	public void CCBchk() throws Exception;
	
	public void CCNchk() throws Exception;
	
	public void CLBchk() throws Exception;
	
	public void CLNchk() throws Exception;
	
	public void KSBchk() throws Exception;	
	
	public void KSNchk() throws Exception;
	
	public void CHJchk() throws Exception;
	
	public int SELtoday() throws Exception;
	
	public int PUStoday() throws Exception;
	
	public int TAEtoday() throws Exception;
	
	public int INCtoday() throws Exception;
	
	public int KWJtoday() throws Exception;
	
	public int TAJtoday() throws Exception;
	
	public int USNtoday() throws Exception;
	
	public int KYGtoday() throws Exception;
	
	public int KAWtoday() throws Exception;
	
	public int CCBtoday() throws Exception;
	
	public int CCNtoday() throws Exception;
	
	public int CLBtoday() throws Exception;
	
	public int CLNtoday() throws Exception;
	
	public int KSBtoday() throws Exception;	
	
	public int KSNtoday() throws Exception;
	
	public int CHJtoday() throws Exception;
	
	public int selectConfirms(ConfirmVO confirmVO) throws Exception;
	
	public int selectReleases(ConfirmVO confirmVO) throws Exception;
	
	public int selectDeads(ConfirmVO confirmVO) throws Exception;
	
	public int selectSumDeads(ConfirmVO confirmVO) throws Exception;
	
	public int selectSumReleases(ConfirmVO confirmVO) throws Exception;
	
	public int selectSumConfirms(ConfirmVO confirmVO) throws Exception;
	
	public int selectDay_0(ConfirmVO confirmVO) throws Exception;
	
	public int selectDay_1(ConfirmVO confirmVO) throws Exception;
	
	public int selectDay_2(ConfirmVO confirmVO) throws Exception;
	
	public int selectDay_3(ConfirmVO confirmVO) throws Exception;
	
	public int selectDay_4(ConfirmVO confirmVO) throws Exception;
	
	public int selectDay_5(ConfirmVO confirmVO) throws Exception;
	
	public int selectDay_6(ConfirmVO confirmVO) throws Exception;
	
	
	public int select_0(String state) throws Exception;
	
	public int select_1(String state) throws Exception;
	
	public int select_2(String state) throws Exception;
	
	public int select_3(String state) throws Exception;
	
	public int select_4(String state) throws Exception;
	
	public int select_5(String state) throws Exception;
	
	public int select_6(String state) throws Exception;
	
	public Date Day6() throws Exception;
	
	public Date Day5() throws Exception;
	
	public Date  Day4() throws Exception;
	
	public Date Day3() throws Exception;
	
	public Date  Day2() throws Exception;
	
	public Date  Day1() throws Exception;
	
	public Date  Day0() throws Exception;
	
	public void updateDays(Days7 days) throws Exception;
	
	public int local(String local) throws Exception;
	
	public int gender(String gender)throws Exception;
	
	public int local_to(String local) throws Exception;
	
	public int gender_to(String gender)throws Exception;
	
	public int local_sum(String local) throws Exception;
	
	public int gender_sum(String gender)throws Exception;



}
