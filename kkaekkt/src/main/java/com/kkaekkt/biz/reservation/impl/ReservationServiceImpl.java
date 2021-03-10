package com.kkaekkt.biz.reservation.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.reservation.ReservationVO;
import com.kkaekkt.biz.user.BusinessVO;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	ReservationDAO reservationDAO;
	
	public void insertRsv(ReservationVO vo) {
		reservationDAO.insertRsv(vo);
	}
	public ReservationVO getRsv(ReservationVO vo) {
		reservationDAO.getRsv(vo);
		return null;
	}
	@Override
	public void cancelRsv(ReservationVO vo) {
		reservationDAO.cancelRsv(vo);
	}
	@Override
	public ReservationListVO getRsvListPs(ReservationListVO vo) {
				vo.setTotalPostCount(reservationDAO.countList(vo))
				.setRsvList(reservationDAO.getRsvListPs(vo));
		for(ReservationVO rsvVO : vo.getRsvList()) {
			rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
		}
		return vo;
	}
	@Override
	public ReservationListVO getRsvListBs(ReservationListVO vo) {
		ReservationListVO listVO=new ReservationListVO().setRsvList(reservationDAO.getRsvListBs(vo));
		for(ReservationVO rsvVO : listVO.getRsvList()) {
			rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
		}
		return listVO;
	}
	
}
