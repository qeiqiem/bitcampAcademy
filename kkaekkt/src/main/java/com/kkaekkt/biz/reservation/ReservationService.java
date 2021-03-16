package com.kkaekkt.biz.reservation;

public interface ReservationService {
	public void insertRsv(ReservationVO vo);
	public void cancel(LaundryVO vo);
	public void complete(LaundryVO vo);
	public ReservationVO getRsv(ReservationVO vo);
	public ReservationListVO getRsvListPs(ReservationListVO vo);
	public ReservationListVO getRsvListBs(ReservationListVO vo);
}
