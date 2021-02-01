package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.vo.Member;

@Component("/log/join.do")
public class MemberAddController implements Controller, DataBinding {
	
	MemberDao memberDao = null;
	
	public MemberAddController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Member member = (Member)model.get("member");
		if(member.getId() == null) {
			return "/log/join.jsp";
		}else {
			memberDao.insert(member);	
			return "redirect:/log/login.do";
		}
	}

	@Override
	public Object[] getDataBinders() {
		// key값 이름, 자동으로 생성해야 할 클래스 타입
		return new Object[] {
				"member", spms.vo.Member.class
		};
	}

}
