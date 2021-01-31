package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import spms.annotation.Component;

@Component("/log/logout.do")
public class MemberLogOutController implements Controller {

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession)model.get("session");
		session.invalidate();
		
		return "redirect:/log/login.do";
	}

}





