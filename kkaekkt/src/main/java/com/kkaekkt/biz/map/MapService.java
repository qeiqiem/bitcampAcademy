package com.kkaekkt.biz.map;

import java.util.List;

import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.BusinessVO;

public interface MapService {
	//데이터 바인딩을 위한 리스트 조회.
	public List<MapListVO> selectlandry(AccountVO vo);
	public List<SingleListVO> selectSingle(String bno);
	public List<SingleListVO> singleOption(String bno);
	public List<SingleListVO> reviewListGrade(String bno);
	public List<SingleListVO> reviewList(String bno);
	public int respay(MapListVO mapvo);
	public int likeYn(SingleListVO vo);
	public BusinessVO singleOptionCoin(String bno);
}
