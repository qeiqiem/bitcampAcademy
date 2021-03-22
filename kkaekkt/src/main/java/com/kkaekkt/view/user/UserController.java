package com.kkaekkt.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.BusinessListVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;
import com.kkaekkt.biz.user.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
//	@RequestMapping(value="/login.do", method=RequestMethod.POST) //인터페이스로 VO를 합칠지 고민 중..
//	public String Join(PersonVO vo) {
//		userService.insertUser(vo);		
//		return "Join.html";
//	}
//	@RequestMapping(value="/logout.do", method=RequestMethod.POST)
//	public String Join(PersonVO vo) {
//		userService.insertUser(vo);		
//		return "Join.html";
//	}
	@RequestMapping(value="/likeOff.do",method=RequestMethod.POST)
	@ResponseBody
	public void likeOff(BusinessVO vo) {
		userService.likeOff(vo);
	}
	@RequestMapping(value="/getLikedBs.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String getLikedBs(BusinessListVO vo) {
		Gson gson=new Gson();
		return gson.toJson(userService.getLikedBs(vo));
	}
	@RequestMapping(value="/joinPs.do", method=RequestMethod.POST)
	public String Join(PersonVO vo) {
		userService.insertUser(vo);
		return "index.jsp";
	}
	@RequestMapping(value="/joinBs.do", method=RequestMethod.POST)
	public String Join(BusinessVO vo) {
		System.out.println("메서드 진입");
		userService.insertUser(vo);
		return "index.jsp";
	}
	@RequestMapping(value="/updatePs.do", method=RequestMethod.POST)
	public String Update(PersonVO vo, HttpSession session) {
		System.out.println(vo);
		userService.updateUser(vo);
		if(vo.getId() != null) {
			PersonVO member = userService.getUser(vo);
			session.setAttribute("member", member);
		} 
		return "/jsp/mypageUser/mybio.jsp";
	}
	
	// 일반유저 로그인
		@RequestMapping(value = "/loginPs.do", method = RequestMethod.POST)
		public String Login(PersonVO vo, HttpSession session) {
			System.out.println("로그인처리");

			vo = userService.getUser(vo);

			System.out.println(vo); // 뭐가 담기는 지 보려했다

			if (vo.getMno() == 0) {
				session.setAttribute("person", null);
				System.out.println("회원정보없음");
				return "/jsp/loginPs.jsp";
			} else {
				session.setAttribute("person", vo);
			}
			return "/jsp/indexPerson.jsp";

		}

		// 업체유저 로그인
		@RequestMapping(value = "/loginBs.do", method = RequestMethod.POST)
		public String Login(BusinessVO vo, HttpSession session) {
			System.out.println("로그인처리");

			vo = userService.getUser(vo);

			System.out.println(vo); // 뭐가 담기는 지 보려했다

			if (vo.getMno() == 0) {
				session.setAttribute("personBs", null);
				System.out.println("회원정보없음");
				return "/jsp/loginBs.jsp";
			} else {
				session.setAttribute("personBs", vo);
			}
			return "/jsp/indexCompany.jsp";

		}

		// 소셜유저 로그인

		@RequestMapping(value = "/loginSNS.do", method = RequestMethod.POST)
		public String SNSLogin(PersonVO vo, HttpSession session) {
			System.out.println("로그인처리");

			vo = userService.getUser(vo);

			System.out.println(vo); // 뭐가 담기는 지 보려했다

			if (vo.getMno() == 0) {
				session.setAttribute("personSNS", null);
				System.out.println("회원정보없음");
				return "/jsp/loginPs.jsp";
			} else {
				session.setAttribute("personSNS", vo);
			}
			return "/jsp/indexPerson.jsp";

		}

		// 로그아웃
		@RequestMapping("/logout.do")
		public String logout(HttpSession session) {
			System.out.println("로그아웃 처리");
			session.invalidate();
			return "/jsp/index.jsp";
		}
	// 일반사양관리
		@RequestMapping(value="/selectComspec.do", method=RequestMethod.POST, produces="application/text;charset=utf-8")
		@ResponseBody
		public String SelcetComspec(BusinessVO vo) {
			System.out.println(vo);
			Gson gson=new Gson();
			String comspec=gson.toJson(userService.getComspec(vo));
			//System.out.println("test:" + comspec);
			return comspec;
		}
	// 일반설비관리
		@RequestMapping(value="/selectCoinspec.do", method=RequestMethod.POST, produces="application/text;charset=utf-8")
		@ResponseBody
		public String SelcetCoinspec(BusinessVO vo) {
			System.out.println(vo);
			Gson gson=new Gson();
			String coinspec=gson.toJson(userService.getCoinspec(vo));
			System.out.println("test:" + coinspec);
			return coinspec;
		}	
	// 일반(사양,설비)관리 update
		@RequestMapping(value="/updateSpec.do", method=RequestMethod.POST)
		public String Update(BusinessVO vo) {
			System.out.println("메서드 진입" + vo);
			userService.updateSpec(vo);
			if(vo.getBizType() == 1) {
				return "/jsp/mypageBiz/comspec.jsp";				
			} 
			return "/jsp/mypageBizCoin/coinspec.jsp";				
		}
	    @RequestMapping(value="/findId.do", method=RequestMethod.POST)
	    public String findId(AccountVO vo, Model model) {
	        System.out.println("findID 진입");
	        System.out.println(vo);
	        model.addAttribute("userId", userService.findId(vo));
	        return "/jsp/login/findIdConfirmed.jsp";
	    }
}
