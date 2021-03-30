package com.kkaekkt.view.user;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
    @Autowired
    private JavaMailSender mailSender;

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
	public String Join(PersonVO vo) {
		System.out.println("메서드 진입");
		userService.insertUser(vo);
//		int res = userService.idchk(vo);
//		try {
//			if (res == 1) {
//				// 아이디 존재 -> 회원가입 페이지로 돌아가기
//				System.out.println("아이디 존재");
//				return "/joinPs.do";
//			} else if (res == 0) {
//				userService.insertUser(vo);
//			}
//		} catch (Exception e) {
//			throw new RuntimeException();
//		}
		System.out.println("vo객체 넘어감");
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
	// 개인 프로필 편집 (비밀번호 변경)
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
	// 개인 프로필 편집 - 세션
	@RequestMapping(value="/updatePs.do", method=RequestMethod.POST)
	public String Update(PersonVO vo, HttpSession session) {
		System.out.println(vo);
		userService.updateUser(vo);
		PersonVO person = userService.getUser(vo);
		System.out.println("컨트롤러" + person);	
		session.setAttribute("person", person);
		System.out.println("세션에 수정한 정보 올리기");

		return "/jsp/mypageUser/mybio.jsp";
	}
	// 업체  프로필 편집 (비밀번호 변경)
	@RequestMapping(value="/updateBspwd.do", method=RequestMethod.POST)
	@ResponseBody
	public String UpdatePw(BusinessVO vo, HttpSession session) {
		System.out.println(vo);
		userService.updateUser(vo);
		BusinessVO personBs = userService.getUser(vo);
		System.out.println("컨트롤러" + personBs);	
		session.setAttribute("person", personBs);
		System.out.println("세션에 수정한 정보 올리기 완료");
		Gson gson=new Gson();
		String password=gson.toJson(vo.getPassword());
		System.out.println(password);
		
		return password;
		
	}
	// 업체 프로필편집 - 세션
	@RequestMapping(value="/updateBs.do", method=RequestMethod.POST)
	public String Update(BusinessVO vo, HttpSession session) {
		System.out.println(vo);
		userService.updateUser(vo);
		vo = userService.getUser(vo);
		vo.setLikedNum(userService.countLikeBs(vo));	// 프로필편집에서 찜 인원 뽑아와야해서 추가
		vo.setEval(userService.avgGradeBs(vo));	// 프로필편집에서 찜 인원 뽑아와야해서 추가
		System.out.println("컨트롤러" + vo);	
		session.setAttribute("person", vo);
		System.out.println("세션에 수정한 정보 올리기 완료");

		return "/jsp/mypageBiz/combio.jsp";
	}
	
	// 이메일 체크 sns에서 로그인할때 디비에 있는지 확인하려고 만든 컨트롤러이다
		@RequestMapping(value = "/findemail.do", method = RequestMethod.POST)
		@ResponseBody
		public String email(PersonVO vo) {
			System.out.println("controller에서 이메일 찾음");
			//vo = userService.email(vo);
            
			vo.setEmail(userService.email(vo));
			System.out.println("vo"+vo);
            PersonVO findEmail = vo;
            System.out.println("findEmail"+findEmail);

			
			Gson gson = new Gson();
			return gson.toJson(findEmail);
		}
		
	// 로그인할때 아이디나 비밀번호 있는지 체크하려고 만든 컨트롤러이다.
		@RequestMapping(value = "/loginchk.do", method = RequestMethod.POST)
		@ResponseBody
		public String loginChk(AccountVO vo) {
			System.out.println("컨트롤러 진입");
			System.out.println(vo + "가 담김");
			Gson gson = new Gson();
			vo.setMno(userService.loginchk(vo));
			return gson.toJson(vo);
		}
			

		// 일반유저 로그인
		@RequestMapping(value = "/loginPs.do", method = RequestMethod.POST)
		public String Login(PersonVO vo, HttpSession session) throws Exception {
			try {
				// 로그인 성공
				System.out.println("로그인처리");

				vo = userService.getUser(vo);
				PersonVO user = userService.getUser(vo);

				System.out.println(vo); // 뭐가 담기는 지 보려했다

				if (user.getMno() == 0) {
					System.out.println("회원정보없음");
					return "/jsp/login/loginPs.jsp";
				} else if (user.getMno() != 0) {
					session.setAttribute("person", vo);
				}
				return "/jsp/indexPerson.jsp";

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("로그인 실패");
				return "/jsp/login/loginPs.jsp";
			}
		}
	
	

	// 업체유저 로그인
	@RequestMapping(value = "/loginBs.do", method = RequestMethod.POST)
	public String Login(BusinessVO vo, HttpSession session) throws Exception {
		try {
			// 로그인 성공
			System.out.println("로그인처리");

			vo = userService.getUser(vo);
			vo.setLikedNum(userService.countLikeBs(vo));	// 프로필편집에서 찜 인원 뽑아와야해서 추가
			vo.setEval(userService.avgGradeBs(vo));	// 프로필편집에서 찜 인원 뽑아와야해서 추가

			System.out.println(vo); // 뭐가 담기는 지 보려했다

			if (vo.getBno() == 0) {
				System.out.println("회원정보없음");
				//session.setAttribute("personBs", null);
				return "/jsp/login/loginBs.jsp";
			} else if (vo.getBno() != 0) {
				session.setAttribute("person", vo);
			}
			return "/jsp/indexCompany.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패");
			return "/jsp/join/joinSelect.jsp"; // 추후 업체로그인 부분으로 변경예정
		}
	}


	// 소셜로그인
	   @RequestMapping(value = "/loginSNS.do", method = RequestMethod.POST)
	      public @ResponseBody String kakaologin(PersonVO vo, HttpSession session, HttpServletResponse response){
	         System.out.println("카카오 로그인 컨트롤러 접속");
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
	            }else {
	               System.out.println("카카오 로그인 실패");
	               return "/jsp/login/loginPs";
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

	// 아이디찾기
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(AccountVO vo, Model model) {
		System.out.println("findID 진입");
		System.out.println(vo);
		model.addAttribute("userId", userService.findId(vo));
		return "/jsp/login/findIdConfirmed.jsp";
	}

	// 비밀번호찾기
	@RequestMapping(value="/findPw.do", method=RequestMethod.POST)
	public String findPw(AccountVO vo, Model model) {
		System.out.println(vo);
		model.addAttribute("userPw", userService.findPw(vo));
 		return "/jsp/join/findPwSendMail.jsp";
 	}
	/* 이메일 인증 */
    @RequestMapping(value="/mailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        System.out.println("이메일 데이터 전송 확인");
        System.out.println("인증번호 : " + email);
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 " + checkNum);
        /* 이메일 보내기 */
        String setFrom = "kkaekkt@naver.com";			// bean에 지정해둔 계정
        String toMail = email;		// 받는메일 테스트 이후 받아온 email변수로 변경

        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);

        return num;
        
    }
}
