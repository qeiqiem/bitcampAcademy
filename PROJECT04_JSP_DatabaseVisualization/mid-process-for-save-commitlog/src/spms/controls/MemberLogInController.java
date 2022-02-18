package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.dao.MySqlMemberDao;
import spms.vo.Member;

@Component("/log/login.do")
public class MemberLogInController implements Controller, DataBinding {
	
	MemberDao memberDao = null;
	
	public MemberLogInController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Member loginInfo = (Member)model.get("loginInfo");
		
		if(loginInfo.getId() == null) {
			return "/log/login.jsp";
		}else {
			Member member = memberDao.check(loginInfo.getId(), loginInfo.getPwd());
			if(member != null) {
				HttpSession session = (HttpSession)model.get("session");
				session.setAttribute("loginAc", member);
				return "redirect:/board/boardlist.do";
			}else {
				return "/log/loginFail.jsp";
			}
		}
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"loginInfo", spms.vo.Member.class	
		};
	}

}





