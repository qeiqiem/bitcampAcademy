package com.kkaekkt.view.map;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kkaekkt.biz.map.MapListVO;
import com.kkaekkt.biz.map.MapService;
import com.kkaekkt.biz.map.ResPayVO;
import com.kkaekkt.biz.map.SingleListVO;
import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.PersonVO;
import com.kkaekkt.biz.user.UserService;


@Controller
public class MapListController {
	@Autowired
	MapService mapserv;
	@Autowired
	UserService userService;
	
		@RequestMapping(value="/showMap.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String loginView( HttpSession session, Model model) {
			
			if(session.getAttribute("user")==null) {
				PersonVO vo = new PersonVO();
				vo.setMno(0);
				vo.setMtype(0);
				model.addAttribute("person",vo);
				
				return "/jsp/searchMap/map.jsp";
			}
			
			System.out.println("map으로 이동  + 정보 : " + session.getAttribute("user"));
			AccountVO account = (AccountVO) session.getAttribute("user");			
			//로그인시 받아온 mno로 db 조회
			model.addAttribute("person", userService.getPerson(account.getMno()));
			return "/jsp/searchMap/map.jsp";
		}
	
	
		@RequestMapping(value="/maplist.do", method=RequestMethod.POST,produces="application/text;charset=utf-8")   
		public @ResponseBody String maplist(String keyaddr) {
		      String keyword = keyaddr;
		      System.out.println("ajax 요청 도착!"+keyword);    
		      
		      List<MapListVO> modelList = mapserv.selectlandry(keyword);
		      Gson gson=new Gson();
		      String keylist=gson.toJson(modelList);
		      System.out.println("select 데이터 확인 :" + keylist);
		      return keylist;
		}
	   
	   
		//업체 시간조회
		@RequestMapping(value="/singleTime.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
		public @ResponseBody String singleList(int bno) {
			System.out.println("단일 페이지 시간조회  : "+bno); 
			List<SingleListVO>single = mapserv.selectSingle(bno); 
			Gson gson=new Gson(); 
			String singleList = gson.toJson(single); 
			System.out.println("select 데이터 확인  : "+singleList); 
			return singleList; 
		}
	  
		//일반세탁 사양/가격조회
		@RequestMapping(value="/singleOption.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
		public @ResponseBody String singleOption(int bno) {
			System.out.println("일반세탁 사양조회  : "+bno); 
			List<SingleListVO>single = mapserv.singleOption(bno); 
			Gson gson=new Gson(); 
			String singleList = gson.toJson(single); 
			System.out.println("select 데이터 확인  : "+singleList); 
			return singleList; 
		}
		
		//회원업체 리뷰 조회
		@RequestMapping(value="/reviewList.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
		public @ResponseBody String reviewList(int bno) {
			System.out.println("리뷰조회 : "+bno); 
			List<SingleListVO>single = mapserv.reviewList(bno); 
			Gson gson=new Gson(); 
			String singleList = gson.toJson(single); 
			System.out.println("select 데이터 확인  : "+singleList); 
			return singleList; 
		}
		//예약 목록 추가 
		@RequestMapping(value="/respay.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	  	public int respay(MapListVO mapvo) {
			return mapserv.respay(mapvo);
		}
		
}

