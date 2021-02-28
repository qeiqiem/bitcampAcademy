package com.kkaekkt.bit.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkaekkt.bit.user.BusinessVO;
import com.kkaekkt.bit.user.PersonVO;
@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUser(PersonVO vo) {
		System.out.println("마이바티스 구동");
		mybatis.insert("UserDAO.insertPs",vo);
		System.out.println("마이바티스 작업완료");
	}
	public void insertUser(BusinessVO vo) {
		mybatis.insert("UserDAO.insertBs",vo);
	}
	public void updateUser(PersonVO vo) {
		mybatis.update("UserDAO.updatePs",vo);
	}
	public void updateUser(BusinessVO vo) {
		mybatis.update("UserDAO.updateBs",vo);
	}
	public void deleteUser(PersonVO vo) {
		mybatis.delete("UserDAO.deletePs",vo);
	}
	public void deleteUser(BusinessVO vo) {
		mybatis.delete("UserDAO.deleteBs",vo);
	}
	public PersonVO getUser(PersonVO vo) {
		mybatis.selectOne("UserDAO.getPs",vo);
		return null;
	}
	public BusinessVO getUser(BusinessVO vo) {
		mybatis.selectOne("UserDAO.getBs",vo);
		mybatis.selectList("UserDAO.getEquipments",vo);
		
		return null;
	}	
}
