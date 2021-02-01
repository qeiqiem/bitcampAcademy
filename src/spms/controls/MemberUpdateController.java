package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.vo.Member;

@Component("/log/update.do")
public class MemberUpdateController implements Controller, DataBinding {
	
	MemberDao memberDao = null;
	
	public MemberUpdateController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Member member = (Member)model.get("member");
		if (member.getId()==null) {
			return "/log/MemberUpdate.jsp";
		} else {
			memberDao.update(member);
			HttpSession session = (HttpSession)model.get("session");
			session.setAttribute("loginAc", member);
			return "redirect:/log/info.do";
		}
	}
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"member", spms.vo.Member.class
		};
	}
}
