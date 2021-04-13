package com.kkaekkt.biz.map;

import java.util.List;

import com.kkaekkt.biz.user.AccountVO;

public interface MapService {
	
	/* 일반세탁 관련기능
	 * 1. 리스트 조회시 데이터 바인딩.
	 * 2. 상세내역 조회시 viewtable 사용
	*/
	
	//데이터 바인딩을 위한 리스트 조회.
	public List<MapListVO> selectlandry(AccountVO vo);
	public List<SingleListVO> selectSingle(int bno);
	public List<SingleListVO> singleOption(int bno);
	public List<SingleListVO> reviewList(int bno);
	public int respay(MapListVO mapvo);
}
