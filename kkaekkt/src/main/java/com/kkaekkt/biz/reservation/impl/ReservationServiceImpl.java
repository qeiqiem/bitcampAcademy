package com.kkaekkt.biz.reservation.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.reservation.ReservationVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;

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
	public ReservationListVO getRsvListPs(PersonVO vo) {
		ReservationListVO listVO=new ReservationListVO().setRsvList(reservationDAO.getRsvList(vo));
		for(ReservationVO rsvVO : listVO.getRsvList()) {
			rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
		}
		return listVO;
	}
	@Override
	public ReservationListVO getRsvListBs(BusinessVO vo) {
		ReservationListVO listVO=new ReservationListVO().setRsvList(reservationDAO.getRsvList(vo));
		for(ReservationVO rsvVO : listVO.getRsvList()) {
			rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
		}
		return listVO;
	}
	
}
