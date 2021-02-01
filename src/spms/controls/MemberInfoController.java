package spms.controls;

import java.util.Map;

import spms.annotation.Component;
@Component("/log/info.do")
public class MemberInfoController implements Controller {
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		return "/log/MemberInfo.jsp";
	}
}
