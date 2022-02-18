package spms.controls;

import java.util.Map;

import spms.bind.DataBinding;
import spms.dao.BoardDao;
public class BoardDeleteController implements Controller,DataBinding {
	BoardDao boardDao = null;
	
	public BoardDeleteController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		
		Integer no = (Integer)model.get("no");
		boardDao.delete(no);
		return "redirect:/board/boardlist.do";
	}
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"no", Integer.class
		};
	}

}
