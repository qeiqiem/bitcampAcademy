package com.kkaekkt.view.user;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.kkaekkt.biz.comm.ChatVO;
import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;
import com.kkaekkt.biz.user.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/initRoomLi.do",method=RequestMethod.GET,produces = "application/text;charset=utf-8")
	@ResponseBody
	public String initRoomLi(ChatVO vo) {
		Gson gson=new Gson();
		return gson.toJson(userService.initRoomLi(vo));
	}
	
	@RequestMapping(value="/getChatRog.do",method=RequestMethod.GET,produces = "application/text;charset=utf-8")
	@ResponseBody
	public String readChatRog(ChatVO vo) {
		Gson gson=new Gson();
		return gson.toJson(userService.readChatRog(vo));
	}
	
	@RequestMapping(value="/exitChatRoom.do",method=RequestMethod.GET)
	@ResponseBody
	public void exitChatRoom(ChatVO vo) {
		userService.exitChatRoom(vo);
	}
	
	@RequestMapping(value="/readChat.do",method=RequestMethod.GET)
	@ResponseBody
	public void readChat(ChatVO vo) {
		userService.readChat(vo);
	}
	
	@RequestMapping(value="/sendChat.do",method=RequestMethod.GET,produces = "application/text;charset=utf-8")
	@ResponseBody
	public String sendChat(ChatVO vo) {
		userService.sendChat(vo);
		return "success";
	}
	@RequestMapping(value="/crtRoom.do",method=RequestMethod.POST,produces = "application/text;charset=utf-8")
	@ResponseBody
	public String crtRoom(ChatVO vo) {
		Gson gson = new Gson();
		return gson.toJson(userService.crtRoom(vo));
	}
	
	@RequestMapping(value="/index.do",method={RequestMethod.GET,RequestMethod.POST})
	public String index(HttpSession session,Model model) {
		
		if(session.getAttribute("user")==null) {
			AccountVO user=new AccountVO();
			user.setMno(0);
			user.setMtype(0);
			model.addAttribute("user",user);	
			return "/jsp/index.jsp";
		}else {
			return "/jsp/index.jsp";		
		}
	}
	
	@RequestMapping(value="/bnoChk.do",method=RequestMethod.POST)
	@ResponseBody
	public int bnoChk(int bno) {
		return userService.bnoChk(bno);
	}
	@RequestMapping(value = "/likeOff.do", method = RequestMethod.POST)
	@ResponseBody
	public void likeOff(BusinessVO vo) {
		userService.likeOff(vo);
	}
	@RequestMapping(value = "/likeOn.do", method = RequestMethod.POST)
	@ResponseBody
	public void likeOn(BusinessVO vo) {
		userService.likeOn(vo);
	}
	@RequestMapping(value = "/getLikedBs.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String getLikedBs(int mno) {//개인 마이페이지 > 좋아요한 업체 목록 조회
		Gson gson = new Gson();
		return gson.toJson(userService.getLikedBs(mno));
	}

	// 아이디 중복체크
	@RequestMapping(value = "/idchk.do", method = RequestMethod.POST)
	@ResponseBody
	public int idchk(PersonVO vo) {
//		System.out.println("vo 값 담겼음");
//		System.out.println(vo);
//		Gson gson = new Gson();
//		vo.setState(userService.idchk(vo));
//		System.out.println("서비스에서 값 담겨 넘어옴");
		return userService.idchk(vo);
	}

	// 회원개입-개인
	@RequestMapping(value = "/joinPs.do", method = RequestMethod.POST)
	public String Join(PersonVO vo) {
		userService.insertUser(vo);
//		return "/jsp/join/joinConfirmed.jsp";
		return "/joinCfm.do";
	}

	// 회원가입-업체
	@RequestMapping(value = "/joinBs.do", method = RequestMethod.POST)
	public String Join(BusinessVO vo) {
		userService.insertUser(vo);
		return "/index.do";
	}

	// 가입완료
	@RequestMapping(value = "/joinCfm.do", method = RequestMethod.POST)
	public String joinCfm(AccountVO vo, Model model) {
		model.addAttribute("joinCfm", userService.joinCfm(vo));
		return "/jsp/join/joinConfirmed.jsp";
	}

	// 개인 프로필 편집 (비밀번호 변경)
	@RequestMapping(value = "/updatePspwd.do", method = RequestMethod.POST)
	@ResponseBody
	public String UpdatePw(PersonVO vo, HttpSession session) {
		userService.updatePw(vo);
		AccountVO result = userService.getUser(vo);
		session.setAttribute("user", result);
		Gson gson = new Gson();
		String password = gson.toJson(vo.getPassword());

		return password;

	}

	// 개인 프로필 편집 - 세션
	@RequestMapping(value = "/updatePs.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Update(PersonVO vo, HttpSession session) {
		userService.updateUser(vo);
		AccountVO result = userService.getUser(vo);
		session.setAttribute("user", result);
		return "/myBio.do";
	}

	// 업체 프로필 편집 (비밀번호 변경)
	@RequestMapping(value = "/updateBspwd.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String UpdatePw(BusinessVO vo, HttpSession session) {
		userService.updatePw(vo);
		AccountVO result = userService.getUser(vo);
		session.setAttribute("user", result);
		Gson gson = new Gson();
		String password = gson.toJson(vo.getPassword());
		return password;

	}

	// 업체 프로필편집 - 세션
	@RequestMapping(value = "/updateBs.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String Update(BusinessVO vo, HttpSession session) {
		userService.updateUser(vo);
		AccountVO result = userService.getUser(vo);
		session.setAttribute("user", result);
		return "/bsBio.do";
	}

	// 이메일 체크 sns에서 로그인할때 디비에 있는지 확인하려고 만든 컨트롤러이다
	@RequestMapping(value = "/findemail.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int emailchk(String email) {
		return userService.emailchk(email);
	}
	// 일반유저 로그인
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String Login(AccountVO vo, HttpSession session) {
			AccountVO result = userService.getUser(vo);
			if (result == null) {
				return "fail";
			} else {
				session.setAttribute("user", result);
				return result.getMtype()+"";					
			}
	}

	// 소셜로그인
	@RequestMapping(value = "/loginSNS.do", method = RequestMethod.POST)
	@ResponseBody
	public String kakaologin(AccountVO vo, HttpSession session, HttpServletResponse response) {
		// 로그인 성공했을 때
		AccountVO result = userService.method(vo);
		if (vo != null) {
			session.setAttribute("user", result);
			return "success";
		} else {
			return "fail";
		}
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletResponse response) {
//		Cookie c = null ;
//        c.setMaxAge(0);        
//		response.addCookie(c);
		session.invalidate();
		return "redirect:/index.do";
	}

	// 일반사양관리
	@RequestMapping(value = "/selectComspec.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String SelcetComspec(BusinessVO vo) {
		Gson gson = new Gson();
		String comspec = gson.toJson(userService.getComspec(vo));
		// System.out.println("test:" + comspec);
		return comspec;
	}

	// 일반설비관리
	@RequestMapping(value = "/selectCoinspec.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String SelcetCoinspec(BusinessVO vo) {//여기도 bno 하나만 전달해서 처리가능함 
		Gson gson = new Gson();
		String coinspec = gson.toJson(userService.getCoinspec(vo));
		return coinspec;
	}

	// 일반(사양,설비)관리 update
	@RequestMapping(value = "/updateSpec.do", method = RequestMethod.POST)
	public String Update(BusinessVO vo) {
		userService.updateSpec(vo);
		if (vo.getBizType() == 1) {
			return "/jsp/mypageBiz/comspec.jsp";
		}
		return "/jsp/mypageBizCoin/coinspec.jsp";
	}

	// 아이디찾기
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	public String findId(AccountVO vo, Model model,HttpServletResponse response) throws IOException {
		vo=userService.findId(vo);
		if(vo!=null) {
			model.addAttribute("userId", vo);
			return "/jsp/login/findIdConfirmed.jsp";			
		}else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('해당 정보로 가입된 내역이 없습니다.'); history.go(-1);</script>");
            out.flush();
            return "/jsp/login/find.jsp";
		}
	}

	// 비밀번호찾기
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public String findPw(AccountVO vo, Model model) {
		model.addAttribute("userPw", userService.findPw(vo));
		return "/jsp/login/findPwSendMail.jsp";
	}

	/* 이메일 인증 */
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		/* 뷰(View)로부터 넘어온 데이터 확인 */
//		System.out.println("이메일 데이터 전송 확인");
//		System.out.println("인증번호 : " + email);
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
//		System.out.println("인증번호 " + checkNum);
		/* 이메일 보내기 */
		String setFrom = "kkaekkt@naver.com"; // bean에 지정해둔 계정
		String toMail = email; // 받는메일 테스트 이후 받아온 email변수로 변경

		String title = "[kkaekkt] 깨끝 인증 메일입니다.";
		String content = "kkaekkt을 이용해주셔서 감사합니다.<br>아래 인증번호를 인증번호 확인란에 입력해주세요.<br><br><h1>" + checkNum + "</h1>";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);
		return num;
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/deletePs.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteUser(AccountVO vo) {
		Gson gson = new Gson();
	      return gson.toJson(userService.deleteUser(vo));
		//return userService.deleteUser(vo);
				
	}
	// 비번변경
	@RequestMapping(value = "/updatePw.do", method = RequestMethod.POST)
	public String updatePw(AccountVO vo) {
		userService.updatePw(vo);
		return "/jsp/login/login.jsp";
	}

	@RequestMapping(value = "/mymark.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String getUserDetail(HttpSession session,Model model) {
		Gson gson = new Gson();
		AccountVO account = (AccountVO) session.getAttribute("user");
		model.addAttribute("userDetail", userService.getPerson(account.getMno()))
			 .addAttribute("likedBsList",gson.toJson(userService.getLikedBs(account.getMno())));
		return "/jsp/mypageUser/mymark.jsp";
	}
	// 개인 프로필 정보 get
	@RequestMapping(value = "/myBio.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String getPerson(HttpSession session, Model model) {
		AccountVO account = (AccountVO) session.getAttribute("user");
		model.addAttribute("person", userService.getPerson(account.getMno()));
		return "/jsp/mypageUser/mybio.jsp";
	}
	// 업체 프로필 정보 get
	@RequestMapping(value = "/bsBio.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBusiness(BusinessVO vo, HttpSession session, Model model) {
		AccountVO account = (AccountVO) session.getAttribute("user");
		vo.setMno(account.getMno());
		vo.setBno(account.getBno());
		vo = userService.getBusiness(vo);
		vo.setLikedNum(userService.countLikeBs(vo)); // 프로필편집에서 찜 인원 뽑아와야해서 추가
		vo.setEval(userService.avgGradeBs(vo)); // 프로필편집에서 찜 인원 뽑아와야해서 추가
		model.addAttribute("bs", vo);
		if (vo.getBizType() == 1) {
			return "/jsp/mypageBiz/combio.jsp";
		} else {
			return "/jsp/mypageBizCoin/coinbio.jsp";
		}
	}
	@RequestMapping(value="/getLaundryList.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String getLaundryList(int bno) {
		Gson gson = new Gson();
		return gson.toJson(userService.getLaundryList(bno));
	}
	@RequestMapping(value="/getuserInfo.do", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	@ResponseBody
	public String getuserInfo(int mno) {
		Gson gson = new Gson();
		return gson.toJson(userService.getPerson(mno));
	}
	
	

	
  
}
