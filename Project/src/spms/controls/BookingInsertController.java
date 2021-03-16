package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BookingDao;
import spms.vo.Booking;

@Component("/booking/insert.do")
public class BookingInsertController implements Controller, DataBinding {

	BookingDao bookingDao = null;
	
	public BookingInsertController setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Booking booking = (Booking)model.get("booking");
		if(booking.getContent() == null) {
			return "/booking/BookingForm.jsp";
		}else {
			bookingDao.insert(booking);
			return "redirect:list.do";
		}
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"booking", spms.vo.Booking.class
		};
	}

}
