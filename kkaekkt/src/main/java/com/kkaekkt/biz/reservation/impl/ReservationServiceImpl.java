package com.kkaekkt.biz.reservation.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.reservation.ReservationVO;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	ReservationDAO reservationDAO;

	
	@Override
	public void regitComm(CommVO vo) {
		reservationDAO.regitComm(vo);		
	}
	public void insertRsv(ReservationVO vo) {
		reservationDAO.insertRsv(vo);
	}
	@Override
	public void cancel(LaundryVO vo) {
		reservationDAO.cancel(vo);
	}
	@Override
	public void complete(LaundryVO vo) {
		reservationDAO.complete(vo);
	}
	@Override
	public void like(ReservationVO vo) {
		if(vo.getLike()==0) {//0이면 좋아요 삭제
			reservationDAO.likeOff(vo);
		}else {
			reservationDAO.likeOn(vo);
		}
	}

	@Override
	public ReservationListVO getRsvListPs(ReservationListVO vo) {
		vo.setTotalPostCount(reservationDAO.countList(vo)); // 총 데이터행 입력
		vo.booleanSet(); // 페이징 정보 입력
		vo.setRsvListRno(reservationDAO.getRsvListPs(vo));
		
		for (ReservationVO rsvVO : vo.getRsvListRno()) {
			rsvVO.setLike(reservationDAO.getLiked(rsvVO));
			rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
		}
		return vo;
	}

	@Override
	public ReservationListVO getRsvListBs(ReservationListVO vo) {
		vo.setTotalPostCount(reservationDAO.countList(vo));// 행 개수 출력
		vo.booleanSet();
		if (vo.getListType() == 2) { // 품목별 리스트라면,
			vo.setRsvListLno(reservationDAO.getRsvListBs_ld(vo));
		} else { // 품목별 리스트가 아니라면
			vo.setRsvListRno(reservationDAO.getRsvListBs_rn(vo));

			for (ReservationVO rsvVO : vo.getRsvListRno()) {
				rsvVO.setLaundryList(reservationDAO.getLaundryList(rsvVO));
			}
		}
		return vo;
	}
}
