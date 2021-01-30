package spms.controls;

import java.util.Map;
import spms.annotation.Component;
import spms.dao.BoardDao;
import spms.vo.Post;
@Component("/board/boardlist.do")
public class BoardListController implements Controller {

	BoardDao boardDao = null;
	
	public BoardListController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Post post = (Post)model.get("post");
			model.put("page", boardDao.initPage());
			model.put("posts", boardDao.selectList());
			return "/board/BoardList.jsp";
	}
}
