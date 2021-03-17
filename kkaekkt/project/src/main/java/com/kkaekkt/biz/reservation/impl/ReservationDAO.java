package com.kkaekkt.biz.reservation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationVO;
@Repository
public class ReservationDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertRsv(ReservationVO vo) {
		
	}
	public void cancel(LaundryVO vo) {
		mybatis.update("cancel",vo);
	}
	public void complete(LaundryVO vo) {
		mybatis.update("complete",vo);
	}
	public void likeOn(ReservationVO vo) {
		mybatis.insert("likeOn",vo);
	}
	public void likeOff(ReservationVO vo) {
		mybatis.delete("likeOff",vo);
	}
	public int getLiked(ReservationVO vo) {
		return mybatis.selectOne("checkLiked",vo);
	}
	public List<ReservationVO> getRsvListPs(ReservationListVO vo) {		
		return mybatis.selectList("reservationDAO.getRsvListPs",vo);
	}
	public List<LaundryVO> getLaundryList(ReservationVO vo) {
		return mybatis.selectList("getLaundry",vo);
	}
	public int countList(ReservationListVO vo) {
		int result = mybatis.selectOne("countList",vo);
		return result;
	}
	public List<ReservationVO> getRsvListBs_rn(ReservationListVO vo) {
		return mybatis.selectList("getRsvListBs_rn",vo);
	}
	public List<LaundryVO> getRsvListBs_ld(ReservationListVO vo) {
		return mybatis.selectList("getRsvListBs_ld",vo);
	}
}
