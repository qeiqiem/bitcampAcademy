package com.kkaekkt.biz.reservation;

import com.kkaekkt.biz.comm.AlertVO;
import com.kkaekkt.biz.comm.CommListVO;
import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;

public interface ReservationService {
	public void insertRsv(ReservationVO vo);
	public String cancel(LaundryVO vo);
	public void complete(LaundryVO vo);
	public void like(ReservationVO vo);
	public ReservationListVO getRsvListPs(ReservationListVO vo);
	public ReservationListVO getRsvListBs(ReservationListVO vo);
	public void regitComm(CommVO vo);
	public void updateComm(CommVO vo);
	public void deleteCommAb(CommVO vo);
	public void deleteCommCh(CommVO vo);
	public CommListVO getCommListBs(CommListVO vo);
	public String washingDone(LaundryVO vo);
	public void regitAlert(AlertVO vo);
}
