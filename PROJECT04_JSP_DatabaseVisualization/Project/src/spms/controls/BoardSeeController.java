package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BoardDao;
@Component("/board/see.do")
public class BoardSeeController implements Controller,DataBinding {
	
	BoardDao boardDao = null;
	
	public BoardSeeController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		int bno = (Integer)model.get("bno");
		boardDao.addView(bno);
		model.put("post",boardDao.selectOne(bno));
		model.put("comms",boardDao.readComms(bno));
		return "/board/BoardPost.jsp";
	}
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"bno", Integer.class,
			"comm", spms.vo.Comm.class
		};
	}	 
}