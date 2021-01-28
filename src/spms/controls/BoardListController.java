package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Post;
@Component("/board/list.do")
public class BoardListController implements Controller,DataBinding {

	BoardDao boardDao = null;
	
	public BoardListController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Post post = (Post)model.get("post");
		if(post.getTitle()==null) {//
			model.put("posts", boardDao.selectList());
			return "/board/BoardList.jsp";	
		} else {
			String title = post.getTitle();
			model.put("posts", boardDao.searchedList(title));
			return "/board/BoardList.jsp";
		}
	}
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"post", spms.vo.Post.class
		};
	}
}