package spms.controls;

import java.util.Map;

import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Post;

public class BoardUpdateController implements Controller,DataBinding {
	BoardDao boardDao = null;
	
	public BoardUpdateController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Post post = (Post)model.get("post");
		if(post.getContent()==null) {//post 객체에 정보가 없다면,
			int no = (Integer)model.get("no");
			model.put("post",boardDao.selectOne(no));
			return null;//가경씨 프론트 경로 부분
		} else {
			model.put("post",boardDao.update(post));
			return "redirect:/board/boardlist.do";
		}
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"no", Integer.class,
			"post", spms.vo.Post.class
		};
	}

}
