package com.kkaekkt.view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
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
	@RequestMapping(value = "/likeOff.do", method = RequestMethod.POST)
	@ResponseBody
	public void likeOff(BusinessVO vo) {
		userService.likeOff(vo);
	}

	@RequestMapping(value = "/getLikedBs.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String getLikedBs(BusinessListVO vo) {
		Gson gson = new Gson();
		return gson.toJson(userService.getLikedBs(vo));
	}

	// 아이디 중복체크
	@RequestMapping(value = "/idchk.do", method = RequestMethod.POST)
	@ResponseBody
	public String idchk(PersonVO vo) {
		System.out.println(vo);
		Gson gson = new Gson();
		vo.setState(userService.idchk(vo));
		return gson.toJson(vo);
	}

	// 회원개입-개인
	@RequestMapping(value = "/joinPs.do", method = RequestMethod.POST)
	public String Join(PersonVO vo) throws Exception {
		userService.insertUser(vo);
		int res = userService.idchk(vo);
		try {
			if (res == 1) {
				// 아이디 존재 -> 회원가입 페이지로 돌아가기
				System.out.println("아이디 존재");
				return "/joinPs.do";
			} else if (res == 0) {
				userService.insertUser(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "/jsp/join/joinConfirmed.jsp";
	}
// 	@RequestMapping(value="/joinPs.do", method=RequestMethod.POST)
// 	public String Join(PersonVO vo) {
// 		userService.insertUser(vo);
// 		return "index.jsp";
// 	}

	// 회원가입-업체
	@RequestMapping(value = "/joinBs.do", method = RequestMethod.POST)
	public String Join(BusinessVO vo) {
		System.out.println("메서드 진입");
		userService.insertUser(vo);
		return "index.jsp";
	}

	@RequestMapping(value="/updatePspwd.do", method=RequestMethod.POST)
	@ResponseBody
	public String UpdatePw(PersonVO vo, HttpSession session) {
		System.out.println(vo);
		userService.updateUser(vo);
		PersonVO person = userService.getUser(vo);
		System.out.println("컨트롤러" + person);	
		session.setAttribute("person", person);
		System.out.println("세션에 수정한 정보 올리기");
		Gson gson=new Gson();
		String password=gson.toJson(vo.getPassword());
		System.out.println(password);
		
		return password;
		
	}
	@RequestMapping(value="/updatePs.do", method=RequestMethod.POST)
	public String Update(PersonVO vo, HttpSession session) {
		System.out.println(vo);
		userService.updateUser(vo);
		PersonVO person = userService.getUser(vo);
		System.out.println("컨트롤러" + person);	
		session.setAttribute("person", person);
		System.out.println("세션에 수정한 정보 올리기");

		return "/jsp/mypageUser/mybio.jsp";
		
		
	// 일반유저 로그인
	@RequestMapping(value = "/loginPs.do", method = RequestMethod.POST)
		public String Login(PersonVO vo, HttpSession session) throws Exception{
			try {
				// 로그인 성공
			System.out.println("로그인처리");

			//vo = userService.getUser(vo);
			PersonVO user = userService.getUser(vo);

			
			System.out.println(vo); // 뭐가 담기는 지 보려했다

			if (user.getMno() == 0) {
				System.out.println("회원정보없음");
				//session.setAttribute("person", null);
				return "/jsp/loginPs.jsp";
			} else if(user.getMno() != 0) {
				session.setAttribute("person", vo);
			}
			return "/jsp/indexPerson.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패");
			return "/jsp/join/joinPerson.jsp";
		}
}
	// 업체유저 로그인
	@RequestMapping(value = "/loginBs.do", method = RequestMethod.POST)
	public String Login(BusinessVO vo, HttpSession session) {
		System.out.println("로그인처리");

		vo = userService.getUser(vo);

		System.out.println(vo); // 뭐가 담기는 지 보려했다

		if (vo.getMno() == 0) {
			System.out.println("회원정보없음");
			session.setAttribute("personBs", null);
			return "/jsp/login/loginBs.jsp";
		} else {
			session.setAttribute("personBs", vo);
			return "/jsp/indexCompany.jsp";
		}
	}

	// 소셜로그인
	@RequestMapping(value = "/loginSNS.do", method = RequestMethod.POST)
	public @ResponseBody String kakaologin(PersonVO vo, HttpSession session, HttpServletResponse response)
			throws Exception {
		System.out.println("카카오 로그인 컨트롤러 접속");
		try {
			// 로그인 성공했을 때
			vo = userService.method(vo);

			PersonVO user = vo;
			System.out.println(vo + "vo카카오"); // 카카오 로그인시 vo 확인
			System.out.println("user카카2" + user);

			if (user.getMno() != 0) {
				session.setAttribute("person", user);
				System.out.println("user정보 " + user);
				System.out.println("vo정보" + vo);
				return "/jsp/indexPerson.jsp";
			} else if (user.getMno() == 0) {
				session.setAttribute("person", user);
				System.out.println("user없는거 출력" + user);
				return "/jsp/join/joinPerson.jsp";
			}

			return "/jsp/indexPerson.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("카카오 로그인 실패");
			return "/jsp/join/joinNoPs.jsp";
		}
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리");
		session.invalidate();
		return "/jsp/index.jsp";
	}

	// 일반사양관리
	@RequestMapping(value = "/selectComspec.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String SelcetComspec(BusinessVO vo) {
		System.out.println(vo);
		Gson gson = new Gson();
		String comspec = gson.toJson(userService.getComspec(vo));
		// System.out.println("test:" + comspec);
		return comspec;
	}

	// 일반설비관리
	@RequestMapping(value = "/selectCoinspec.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String SelcetCoinspec(BusinessVO vo) {
		System.out.println(vo);
		Gson gson = new Gson();
		String coinspec = gson.toJson(userService.getCoinspec(vo));
		System.out.println("test:" + coinspec);

		return coinspec;

	}

	// 일반(사양,설비)관리 update
	@RequestMapping(value = "/updateSpec.do", method = RequestMethod.POST)
	public String Update(BusinessVO vo) {
		System.out.println("메서드 진입" + vo);
		userService.updateSpec(vo);
		if (vo.getBizType() == 1) {
			return "/jsp/mypageBiz/comspec.jsp";
		}
		return "/jsp/mypageBizCoin/coinspec.jsp";
	}

	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(AccountVO vo, Model model) {
		System.out.println("findID 진입");
		System.out.println(vo);
		model.addAttribute("userId", userService.findId(vo));
		return "/jsp/login/findIdConfirmed.jsp";
	}
}
