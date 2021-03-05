package com.kkaekkt.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.reservation.ReservationVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value="/myPagePs.do", method=RequestMethod.POST)
	public String getRsvListPs(PersonVO vo, Model model) {
		model.addAttribute("rsvList", reservationService.getRsvListPs(vo));
		return "Join.html";
	}
	@RequestMapping(value="/myPageBs.do", method=RequestMethod.POST)
	public String getRsvListBs(BusinessVO vo, Model model) {
		model.addAttribute("rsvList", reservationService.getRsvListBs(vo));
		return "Join.html";
	}
	@RequestMapping(value="/cancel.do", method=RequestMethod.POST)
	public String cancelRsv(ReservationVO vo) {
		reservationService.cancelRsv(vo);
		return "Join.html";
	}
}
