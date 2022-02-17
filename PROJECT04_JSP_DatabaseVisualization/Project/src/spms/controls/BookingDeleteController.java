package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BookingDao;

@Component("/booking/delete.do")
public class BookingDeleteController implements Controller, DataBinding {

	BookingDao bookingDao;
	
	public BookingDeleteController setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
			"bno", Integer.class
		};
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Integer bno = (Integer)model.get("bno");
		bookingDao.delete(bno);
		
		return "redirect:list.do";
	}

}
