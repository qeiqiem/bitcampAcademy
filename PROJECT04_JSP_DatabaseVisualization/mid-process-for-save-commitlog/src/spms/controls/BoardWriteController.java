package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Post;

@Component("/board/write.do")
public class BoardWriteController implements Controller,DataBinding {

	BoardDao boardDao = null;
	
	public BoardWriteController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}

	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Post post = (Post)model.get("post");
		if(post.getContent()!=null) {
			boardDao.insert(post);
			return "redirect:/board/boardlist.do";
		}else {
			return "/board/BoardWrite.jsp";
		}
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"post", spms.vo.Post.class
		};
	}

}
