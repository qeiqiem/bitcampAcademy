package spms.controls;

import java.util.Map;
import spms.annotation.Component;

@Component("/index.do")
public class IndexController implements Controller{
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		return "redirect:/board/boardlist.do";
	}
}