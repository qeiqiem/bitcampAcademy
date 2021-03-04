package com.kkaekkt.biz.user.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.EquipmentVO;
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
	public void insertUser(BusinessVO vo) {	
		String temp=vo.getEquipment().substring(1,vo.getEquipment().length()-1); // 양 끝의  [  ] 제거
		String[] temp2=temp.split("},"); // {~},{~} 을 split하여 배열로 나눔
		List<EquipmentVO> list= new ArrayList<EquipmentVO>();
		Gson gson = new Gson();
		for(int i=0; i<temp2.length;i++) {
			if(i!=temp2.length-1) {//만약 마지막 { ~ }이 아니라면,
			temp2[i]+="}";//split 과정에서 떨어졌던 '}'를 붙여준다.
			}
			list.add(gson.fromJson(temp2[i], EquipmentVO.class));
		}
		vo.setEquipmentList(list);
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
		return null;
	}
	@Override
	public BusinessVO getUser(BusinessVO vo) {
		return null;
	}
	
}
