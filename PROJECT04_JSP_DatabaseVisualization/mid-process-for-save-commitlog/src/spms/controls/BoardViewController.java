package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BoardDao;
@Component("/board/view.do")
public class BoardViewController implements Controller,DataBinding {
	
	BoardDao boardDao = null;
	
	public BoardViewController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int no = (Integer)model.get("no");
		model.put("post",boardDao.selectOne(no));
		model.put("comms",boardDao.readComms(no));
		return "/board/BoardPost.jsp";
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"no", Integer.class,
			"comm", spms.vo.Comm.class
		};
	}	 
}
