package com.kkaekkt.view.map;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			userService.getPerson(account.getMno());		
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
	  
	  
		//회원업체 리뷰 조회
		@RequestMapping(value="/respay.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	  	public String respay(String userInfo, String arrayTos ) {
			
			MapListVO mapvo = new MapListVO();
			ResPayVO resvo = null;			
			List<ResPayVO> resList  = new ArrayList<>();
			
			System.out.println("예약관련정보 : "+ arrayTos); 	
			//가져온 문자열 튜닝
			arrayTos = arrayTos.replace("/", "");
			arrayTos = arrayTos.replace(",,", ",");			
			String[] arr = arrayTos.split(",");
			System.out.println("스플릿 결과 : " + Arrays.toString(arr));
			
			for (int i = 0; i < arr.length-1; i++) {
				resvo = new ResPayVO();
				if(i==0 ||(i&1)==0) {					
					System.out.println("lno : "+arr[i]+", cnt : "+arr[i+1]);
					resvo.setLno(Integer.parseInt(arr[i]));
					resvo.setCnt(Integer.parseInt(arr[i+1]));
					resList.add(resvo);
				}									
			}
			mapvo.setResList(resList);		
			
			System.out.println("유저관련정보 : "+ userInfo); 	
			//유저관련 정보
			String[] user = userInfo.split(",",4);
			mapvo.setMno(Integer.parseInt(user[0]));	
			mapvo.setTotalPrice(Integer.parseInt(user[1]));
			mapvo.setRbno(Integer.parseInt(user[2]));
			
			mapserv.respay(mapvo);
			
			return "success";
		}
		
}

