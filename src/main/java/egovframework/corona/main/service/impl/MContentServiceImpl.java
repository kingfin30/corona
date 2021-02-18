package egovframework.corona.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.corona.main.service.MContentLogVO;
import egovframework.corona.main.service.MContentService;
import egovframework.corona.main.service.MContentVO;
import egovframework.corona.main.service.SearchCriteria;
import egovframework.corona.main.service.SubCriteria;

@Service("mContentService")
public class MContentServiceImpl implements MContentService{
	@Resource(name="mContentMapper")
	private MContentMapper mContentMapper;

	@Override
	public void insert(MContentVO mContentVO) throws Exception {
		// TODO Auto-generated method stub
		mContentMapper.insert(mContentVO);
		
	}

	@Override
	public List<MContentVO> mContentList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentList(scri);
	}

	@Override
	public int mContentListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentListCount(scri);
	}

	@Override
	public MContentVO mContentRead(int mno) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentRead(mno);
	}

	@Override
	public MContentVO mContentData(int rnum) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentData(rnum);
	}

	@Override
	public MContentVO mContentPeriod() throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentPeriod();
	}

	@Override
	public int mContentPeriodCount() throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentPeriodCount();
	}

	@Override
	public void insert_log(MContentLogVO mContentlogVO) throws Exception {
		// TODO Auto-generated method stub
		mContentMapper.insert_log(mContentlogVO);
		
	}

	@Override
	public int mContentLogListCount(int mno) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentLogListCount(mno);
	}


	@Override
	public MContentLogVO mContentLogRead(int lno) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentLogRead(lno);
	}

	@Override
	public void mContentUpdate(MContentVO mContentVO) throws Exception {
		// TODO Auto-generated method stub
		mContentMapper.mContentUpdate(mContentVO);
	}

	@Override
	public List<MContentLogVO> mContentLogList(SubCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentLogList(scri);
	}

	@Override
	public void mContentReset(MContentVO mContentVO) throws Exception {
		// TODO Auto-generated method stub
		mContentMapper.mContentReset(mContentVO);
		
	}

	@Override
	public int updateCount(int mno) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.updateCount(mno);
	}

	@Override
	public void mContentDelete(int mno) throws Exception {
		// TODO Auto-generated method stub
		mContentMapper.mContentDelete(mno);
	}

	@Override
	public void mContentDelete_log(int mno) throws Exception {
		// TODO Auto-generated method stub
		mContentMapper.mContentDelete_log(mno);
	}

	@Override
	public void insert_log2(MContentLogVO mContentlogVO) throws Exception {
		// TODO Auto-generated method stub
		mContentMapper.insert_log2(mContentlogVO);
	}

	@Override
	public int mContentDataCount(int rnum) throws Exception {
		// TODO Auto-generated method stub
		return mContentMapper.mContentDataCount(rnum);
	} 

}
