package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.MountainDao;
@Component("/mountain/list.do")
public class MountainListController implements Controller,DataBinding {

	MountainDao mountainDao = null;
	
	public MountainListController setMountainDao(MountainDao mountainDao) {
		this.mountainDao = mountainDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		model.put("mountains", mountainDao.selectList());
		return "/mountain/MountainList.jsp";
	}
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"mountain", spms.vo.Mountain.class
		};
	}

}
