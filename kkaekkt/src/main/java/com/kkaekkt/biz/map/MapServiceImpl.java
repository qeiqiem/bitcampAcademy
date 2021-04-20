package com.kkaekkt.biz.map;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.impl.UserDAO;

@Service("mapService")
public class MapServiceImpl implements MapService {
	@Autowired
	MapListDAO maplistDao;
	@Autowired
	UserDAO userDao;

	public MapServiceImpl() {
		System.out.println("[MapServiceImpl진입----------------------]");
	}
	
	@Override
	public List<MapListVO> selectlandry(AccountVO vo) {
		return maplistDao.selectlandry(vo);		
	}

	@Override public List<SingleListVO> selectSingle(String bno) {
		 return maplistDao.selectSingle(bno); 
	 }

	@Override
	public List<SingleListVO> singleOption(String bno) {
		return maplistDao.selectOption(bno); 
	}

	@Override
	public BusinessVO singleOptionCoin(String bno) {
		BusinessVO vo=new BusinessVO();
		vo.setEquipmentList(userDao.getEquipment(bno));
		vo.setEtcList(userDao.getEtc(bno));
		return vo; 
	}
	
	
	@Override
	public List<SingleListVO> reviewList(String bno) {
		return maplistDao.reviewList(bno); 
	}

	@Override
	public List<SingleListVO> reviewListGrade(String bno) {
		return maplistDao.reviewListGrade(bno); 
	}

	@Override
	public int respay(MapListVO mapvo) { 
		maplistDao.respay(mapvo);
		return maplistDao.getRsvNum(mapvo.getMno());
	}

	@Override
	public int likeYn(SingleListVO vo) {		
		return maplistDao.likeYn(vo);
	}



	
}
