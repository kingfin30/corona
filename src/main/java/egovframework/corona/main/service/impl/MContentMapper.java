package egovframework.corona.main.service.impl;

import java.util.List;

import egovframework.corona.main.service.MContentLogVO;
import egovframework.corona.main.service.MContentVO;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.corona.main.service.SubCriteria;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mContentMapper")
public interface MContentMapper {
	
	public void insert(MContentVO mContentVO) throws Exception;
	
	public void insert_log(MContentLogVO mContentlogVO) throws Exception;
	
	public void insert_log2(MContentLogVO mContentlogVO) throws Exception;
	
	public List<MContentVO> mContentList(SearchCriteria scri) throws Exception;
	
	public List<MContentLogVO> mContentLogList(SubCriteria scri) throws Exception;
	
	public MContentLogVO mContentLogRead(int lno) throws Exception;
	
	public int mContentListCount(SearchCriteria scri) throws Exception;
	
	public int mContentLogListCount(int mno) throws Exception;
	
	public MContentVO mContentRead(int mno) throws Exception;
	
	public MContentVO mContentData(int rnum) throws Exception;
	
	public int mContentDataCount(int rnum)throws Exception;
	
	public MContentVO mContentPeriod()throws Exception;
	
	public int mContentPeriodCount() throws Exception;
	
	public void mContentUpdate(MContentVO mContentVO) throws Exception;
	
	public void mContentReset(MContentVO mContentVO)throws Exception;
	
	
	public int updateCount(int mno)throws Exception;
	
	public void mContentDelete(int mno)throws Exception;
	
	public void mContentDelete_log(int mno)throws Exception;

}
