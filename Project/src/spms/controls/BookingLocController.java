package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BookingDao;

@Component("/booking/loc.do")
public class BookingLocController implements Controller, DataBinding {
	
	BookingDao bookigDao = null;
	
	public BookingLocController setMountainDao(BookingDao bookigDao) {
		this.bookigDao = bookigDao;
		return this;
	}


	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String loc = (String)model.get("loc");
		model.put("bookings", bookigDao.selectLoc(loc.substring(0, 7)));
		return "/mountain/DateRecomm.jsp";
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"loc", String.class
			};
	}
}
