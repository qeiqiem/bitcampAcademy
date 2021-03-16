package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.dao.BookingDao;

@Component("/booking/list.do")
public class BookingListController implements Controller {
	
	BookingDao bookingDao = null;
	
	public BookingListController setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		model.put("bookings", bookingDao.selectList());
		return "/booking/BookingList.jsp";
	}
	
}
