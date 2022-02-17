package spms.controls;

import java.util.Map;

import spms.annotation.Component;

@Component("/faq.do")
public class FaqController implements Controller {

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		return "/board/FAQ.jsp";
	}

}
