package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.MountainDao;
@Component("/mountain/select.do")
public class MountainSelectController implements Controller, DataBinding {
	MountainDao mountainDao = null;
	
	public MountainSelectController setMountainDao(MountainDao mountainDao) {
		this.mountainDao = mountainDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Integer mtno = (Integer)model.get("mtno");
		model.put("mountain", mountainDao.selectOne(mtno));
		return "/mountain/MountainSelect.jsp";
	}
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"mtno", Integer.class
		};
	}

}
