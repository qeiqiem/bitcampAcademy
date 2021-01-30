package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Page;
import spms.vo.Post;

@Component("/board/page.do")
public class PageController implements Controller, DataBinding {
	BoardDao boardDao = null;

	public PageController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Post post = (Post)model.get("post");
		Page page = (Page)model.get("page");
		if(page.getMovePage()) {
			model.put("page",boardDao.movedPage(page));
			model.put("posts", boardDao.movedList(post, page));
			return "/board/BoardList.jsp";		
		} else {
			model.put("page",boardDao.searchedPage(page));
			model.put("posts", boardDao.searchedList(post, page));
			return "/board/BoardList.jsp";		
		}
		
	}
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"page", spms.vo.Page.class,
			"post", spms.vo.Post.class
		};
	}
}
