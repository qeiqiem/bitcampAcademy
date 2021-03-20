package com.kkaekkt.biz.user.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kkaekkt.biz.comm.EquipmentVO;
import com.kkaekkt.biz.comm.EtcVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.comm.ScheduleVO;
import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.BusinessListVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;
import com.kkaekkt.biz.user.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO userDao;

	@Override
	public void insertUser(PersonVO vo) {
		userDao.insertUser(vo);
	}

	@Override
	public void likeOff(BusinessVO vo) {
		userDao.likeOff(vo);
	}

	@Override
	public BusinessListVO getLikedBs(BusinessListVO vo) {
		vo.setTotalPostCount(userDao.countList(vo)); // 총 데이터행 입력
		System.out.println(vo.getTotalPostCount()+":개 행 출력");
		vo.booleanSet(); // 페이징 정보 입력
		vo.setBsList(userDao.getLikedBs(vo));
		for(BusinessVO bvo:vo.getBsList()) {
			System.out.println(bvo);
		}
		return vo;
	}

	@Override
	public void insertUser(BusinessVO vo) {
		System.out.println("서비스진입");
		vo.setScheduleList(convertToObj(vo.getSchedule(), ScheduleVO.class));
		System.out.println(vo.getScheduleList());
		if (vo.getBizType() == 1) { // 일반 세탁소라면
			vo.setLaundryList(convertToObj(vo.getLaundry(), LaundryVO.class));
		} else {
			vo.setEquipmentList(convertToObj(vo.getEquipment(), EquipmentVO.class));
			vo.setEtcList(convertToObj(vo.getEtc(), EtcVO.class));
		}
		userDao.insertUser(vo);
	}

	@Override
	public void updateUser(PersonVO vo) {
		userDao.updateUser(vo);

	}

	@Override
	public void updateUser(BusinessVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(PersonVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(BusinessVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public PersonVO getUser(AccountVO vo) {
		System.out.println("servie옴");
		if(vo.getMtype() == 1) {
			// 일반유저
			userDao.getUserPs(vo);			
		} else {
			// 업체유저
			userDao.getUserBs(vo);
		}
		return 
	}

	@Override
	public BusinessVO getUser(BusinessVO vo) {
		return null;
	}

	public <T> List<T> convertToObj(String json, Class<T> type) {
		String temp = json.substring(1, json.length() - 1); // 양 끝의 [ ] 제거
		String[] temp2 = temp.split("},"); // {~},{~} 을 split하여 배열로 나눔
		List<T> list = new ArrayList<T>();
		Gson gson = new Gson();
		for (int i = 0; i < temp2.length; i++) {
			if (i != temp2.length - 1) {// 만약 마지막 { ~ }이 아니라면,
				temp2[i] += "}";// split 과정에서 떨어졌던 '}'를 붙여준다.
			}
			list.add(gson.fromJson(temp2[i], type));
		}
		return list;
	}

	@Override
	public BusinessVO getComspec(BusinessVO vo) {
		//System.out.println("servie옴");
		vo.setLaundryList(userDao.getComspec(vo));
		vo.setScheduleList(userDao.getComspecschedule(vo));
		return vo;
	}

	@Override
<<<<<<< HEAD
	public void updateComspec(BusinessVO vo) {
		System.out.println("서비스진입");
		vo.setScheduleList(convertToObj(vo.getSchedule(), ScheduleVO.class));
		System.out.println(vo.getScheduleList());
		if (vo.getBizType() == 1) { // 일반 세탁소라면
			vo.setLaundryList(convertToObj(vo.getLaundry(), LaundryVO.class));
		} else {
			vo.setEquipmentList(convertToObj(vo.getEquipment(), EquipmentVO.class));
			vo.setEtcList(convertToObj(vo.getEtc(), EtcVO.class));
		}
		userDao.updateComspec(vo);	
	}
	
=======
	public PersonVO getUser(PersonVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AccountVO findId(AccountVO vo) {
		return userDao.findId(vo);
	}
>>>>>>> 79f82998ae036ca2d6e400cb5330cc0ad65e3045

}
