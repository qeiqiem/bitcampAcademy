package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BookingDao;
import spms.vo.Booking;

@Component("/booking/view.do")
public class BookingSelectController implements Controller, DataBinding {
	
	BookingDao bookingDao = null;
	
	public BookingSelectController setBookingDao(BookingDao bookingdao) {
		this.bookingDao = bookingdao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		
		Booking booking  = (Booking)model.get("booking");
		//조회수 
		bookingDao.update(booking);
		Booking selectBno = bookingDao.selectOne(booking.getBno());
		model.put("booking", selectBno);
		model.put("comms",bookingDao.readComms(booking.getBno()));
		return "/booking/BookingSelect.jsp";
	}

	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"booking", spms.vo.Booking.class
		};
	}

}
