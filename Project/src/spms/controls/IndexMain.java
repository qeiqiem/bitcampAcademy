package spms.controls;

import java.util.Map;

import spms.annotation.Component;

@Component("/index.do")
public class IndexMain implements Controller {

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		return "/index.jsp";
	}

}
