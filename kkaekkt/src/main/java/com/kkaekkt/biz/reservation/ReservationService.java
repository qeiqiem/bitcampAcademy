package com.kkaekkt.biz.reservation;

import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;

public interface ReservationService {
	public void insertRsv(ReservationVO vo);
	public void cancelRsv(ReservationVO vo);
	public ReservationVO getRsv(ReservationVO vo);
	public ReservationListVO getRsvListPs(PersonVO vo);
	public ReservationListVO getRsvListBs(BusinessVO vo);
}
