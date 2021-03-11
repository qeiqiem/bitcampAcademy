package com.kkaekkt.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.reservation.ReservationVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value="/mypagePs.do", method=RequestMethod.POST)
	public String getRsvListPs(PersonVO vo, HttpSession session) {
		session.setAttribute("member", vo); //세션 테스트용
		return "mypagePs.jsp";
	}
	@RequestMapping(value="/mypageBs.do", method=RequestMethod.POST)
	public String getRsvListBs(ReservationListVO vo, Model model) {
		model.addAttribute("rsvPage", reservationService.getRsvListBs(vo));
		return "mypageBs.jsp";
	}
	@RequestMapping(value="/ajax.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String testAjax(ReservationListVO vo) {
		Gson gson=new Gson();
		String test=gson.toJson(reservationService.getRsvListPs(vo));
		return test;
	}
	@RequestMapping(value="/cancel.do", method=RequestMethod.POST)
	public String cancelRsv(ReservationVO vo) {
		reservationService.cancelRsv(vo);
		return "Join.html";
	}
}
