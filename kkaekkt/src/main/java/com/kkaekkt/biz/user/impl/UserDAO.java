package com.kkaekkt.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.comm.ScheduleVO;
import com.kkaekkt.biz.user.BusinessListVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;
@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void likeOff(BusinessVO vo) {
		mybatis.delete("UserDAO.likeOff",vo);
	}
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
	public List<BusinessVO> getLikedBs(BusinessListVO vo) {
		return mybatis.selectList("UserDAO.getLikedBs",vo);
	}
	public int countList(BusinessListVO vo) {
		return mybatis.selectOne("UserDAO.countList",vo);
	}
	// 이해 못해서 잠시 일케 해둠
		public PersonVO getUserPs(AccountVO vo) {			
			System.out.println("mybatis로 기능처리 일반유저");
			return mybatis.selectOne("UserDAO.getPerson",vo);
		}
//		public UserVO getUser(UserVO vo) {
//			mybatis.selectOne("UserDAO.getUser", vo);
//			return null;
//		}
		
//	public PersonVO getUser(PersonVO vo) {
//		System.out.println("mybatis로 getUser() 기능처리");
//		return (PersonVO)mybatis.selectOne("UserDAO.getPerson", vo);
//	}
		
	public PersonVO getUser(PersonVO vo) {
		System.out.println("mybatis로 getUser() 기능처리");
		return mybatis.selectOne("UserDAO.getPerson", vo);
	}
	public BusinessVO getUser(BusinessVO vo) {
		mybatis.selectOne("UserDAO.getBs",vo);
		mybatis.selectList("UserDAO.getEquipments",vo);
		
		return null;
	}
	public List<LaundryVO> getComspec(BusinessVO vo) {
		System.out.println("dao : " + mybatis.selectList("UserDAO.getcomspecList",vo) );
		return mybatis.selectList("UserDAO.getcomspecList",vo);
	}
	public List<ScheduleVO> getComspecschedule(BusinessVO vo) {
		System.out.println("dao : " + mybatis.selectList("UserDAO.getcomscheduleList",vo) );
		return mybatis.selectList("UserDAO.getcomscheduleList",vo);
	}
}
