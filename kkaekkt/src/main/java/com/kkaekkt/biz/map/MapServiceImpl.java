package com.kkaekkt.biz.map;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mapService")
public class MapServiceImpl implements MapService {
	@Autowired
	MapListDAO maplistDao;

	public MapServiceImpl() {
		System.out.println("[MapServiceImpl진입----------------------]");
	}
	
	@Override
	public List<MapListVO> selectlandry(String keyaddr) {
		return maplistDao.selectlandry(keyaddr);
		
	}

	@Override public List<SingleListVO> selectSingle(int bno) {
		 return maplistDao.selectSingle(bno); 
	 }

	@Override
	public List<SingleListVO> singleOption(int bno) {
		return maplistDao.selectOption(bno); 
	}

	@Override
	public List<SingleListVO> reviewList(int bno) {
		return maplistDao.reviewList(bno); 
	}


	@Override
	public int respay(MapListVO mapvo) { 
		maplistDao.respay(mapvo);
		return maplistDao.getRsvNum(mapvo.getMno());
	}

	
}
