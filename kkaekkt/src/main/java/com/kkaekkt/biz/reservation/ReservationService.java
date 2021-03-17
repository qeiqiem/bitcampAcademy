package com.kkaekkt.biz.reservation;

import com.kkaekkt.biz.comm.LaundryVO;

public interface ReservationService {
	public void insertRsv(ReservationVO vo);
	public void cancel(LaundryVO vo);
	public void complete(LaundryVO vo);
	public void like(ReservationVO vo);
	public ReservationListVO getRsvListPs(ReservationListVO vo);
	public ReservationListVO getRsvListBs(ReservationListVO vo);
}
