package com.kkaekkt.biz.reservation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkaekkt.biz.reservation.LaundryVO;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;
@Repository
public class ReservationDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertRsv(ReservationVO vo) {
		
	}
	public void cancelRsv(ReservationVO vo) {
		mybatis.update("cancelRsv");
	}
	public ReservationVO getRsv(ReservationVO vo) {
		
		return mybatis.selectOne("getRsv");
	}
	public List<ReservationVO> getRsvList(PersonVO vo) {		
		return mybatis.selectList("reservationDAO.getRsvListPs",vo);
	}
	public List<ReservationVO> getRsvList(BusinessVO vo) {
		return mybatis.selectList("getRsvListBs",vo);
	}
	public List<LaundryVO> getLaundryList(ReservationVO vo) {
		return mybatis.selectList("getLaundry",vo);
	}
}
