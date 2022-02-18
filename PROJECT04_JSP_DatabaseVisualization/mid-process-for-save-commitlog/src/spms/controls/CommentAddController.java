package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BoardDao;
import spms.vo.Comm;
@Component("/comm/add.do")
public class CommentAddController implements Controller, DataBinding {
	BoardDao boardDao = null;
	
	public CommentAddController setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Comm comm = (Comm)model.get("comm");
		boardDao.addComm(comm);
		return "redirect:/"+comm.getTable()+"/view.do?no="+comm.getBno(); //ex) /board/view.do?no=62
	}
	@Override
	public Object[] getDataBinders() {
		// key값 이름, 자동으로 생성해야 할 클래스 타입
		return new Object[] {
				"comm", spms.vo.Comm.class,
		};
	}
}
