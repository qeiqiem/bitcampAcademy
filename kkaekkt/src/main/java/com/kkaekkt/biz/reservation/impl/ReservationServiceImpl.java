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
			vo.setTotalPostCount(reservationDAO.countList(vo)) //총 데이터행 입력
			.booleanSet() //페이징 정보 입력
			.setRsvListRno(reservationDAO.getRsvListPs(vo));
			
		for(ReservationVO rsvVO : vo.getRsvListRno()) {
			rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
		}
		return vo;
	}
	@Override
	public ReservationListVO getRsvListBs(ReservationListVO vo) {
		vo.setTotalPostCount(reservationDAO.countList(vo)).booleanSet();
		System.out.println(vo.getTotalPostCount()+" : 포스트 개수");
		if(vo.getListType()==2) {
			vo.setRsvListLno(reservationDAO.getRsvListBs_p(vo));
		} else {
			vo.setRsvListRno(reservationDAO.getRsvListBs_rn(vo));
			for(ReservationVO rsvVO : vo.getRsvListRno()) {
				rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
			}
		}
	return vo;
	}
}
