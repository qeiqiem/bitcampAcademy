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
	public List<BusinessVO> getLikedBs(PersonVO vo) {
		List<BusinessVO> list=userDao.getLikedBs(vo);
		return list;
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
	public PersonVO getUser(PersonVO vo) {
		System.out.println("servie옴");
		return userDao.getUser(vo);
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

}
