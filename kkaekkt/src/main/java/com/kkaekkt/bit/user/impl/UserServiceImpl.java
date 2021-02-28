package com.kkaekkt.bit.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkaekkt.bit.user.BusinessVO;
import com.kkaekkt.bit.user.PersonVO;
import com.kkaekkt.bit.user.UserService;
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
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateUser(PersonVO vo) {
		// TODO Auto-generated method stub
		
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
