package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BookingDao;
import spms.vo.Booking;

@Component("/booking/joinBook.do")
public class BookingJoinBook implements Controller ,DataBinding {
	
	BookingDao bookingDao = null;
	
	public BookingJoinBook setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		Booking booking = (Booking)model.get("booking");
		
		
		if(booking.getNop() <= booking.getMin_nop()) {
//			System.out.println("참가인원 제한");
		}else {
			//업데이트 min_nop, 
			boolean join = bookingDao.joinBook(booking.getBno());
//			System.out.println("참가하셨습니다.");
		}
		return "redirect:list.do";
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"booking", spms.vo.Booking.class
		};
	}

}
