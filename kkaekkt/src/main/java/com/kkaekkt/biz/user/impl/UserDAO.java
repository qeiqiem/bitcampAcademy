package com.kkaekkt.biz.user.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;
@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUser(PersonVO vo) {
		System.out.println("마이바티스 insert");
		mybatis.insert("UserDAO.insertPs",vo);
		System.out.println("마이바티스 insert완료");
	}
	public void insertUser(BusinessVO vo) {
		System.out.println("DAO진입");
		mybatis.insert("UserDAO.insertBs",vo);
	}
	public void updateUser(PersonVO vo) {
		System.out.println("마이바티스 update");
		mybatis.update("UserDAO.updatePs",vo);
		System.out.println("마이바티스 update완료");
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
