package com.kkaekkt.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kkaekkt.biz.reservation.LaundryVO;
import com.kkaekkt.biz.reservation.ReservationListVO;
import com.kkaekkt.biz.reservation.ReservationService;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value="/mypagePs.do", method=RequestMethod.POST)
	public String myPagePs(PersonVO vo, HttpSession session) {
		session.setAttribute("member", vo); //세션 테스트용
		return "/jsp/mypageUser/mypagePs.jsp";
	}
	@RequestMapping(value="/mypageBs.do", method=RequestMethod.POST)
	public String getRsvListBs(BusinessVO vo, HttpSession session) {
		session.setAttribute("business",vo);
		return "mypageBs.jsp";
	}
	@RequestMapping(value="/getRsvListPs.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String getRsvListPs(ReservationListVO vo) {
		System.out.println(vo);
		Gson gson=new Gson();
		String test=gson.toJson(reservationService.getRsvListPs(vo));
		return test;
	}
	@RequestMapping(value="/getRsvListBs.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String getRsvListBs(ReservationListVO vo) {
		System.out.println(vo);
		Gson gson=new Gson();
		String test=gson.toJson(reservationService.getRsvListBs(vo));
		return test;
	}
	@RequestMapping(value="/cancel.do", method=RequestMethod.POST)
	@ResponseBody
	public void cancelRsv(LaundryVO vo) {		
		reservationService.cancel(vo);
	}
	@RequestMapping(value="/complete.do", method=RequestMethod.POST)
	@ResponseBody
	public String completeRsv(LaundryVO vo) {
		System.out.println("완료진입 :"+vo);
		reservationService.cancel(vo);
		return "완료";
	}
	
}
