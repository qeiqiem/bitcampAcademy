package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.BookingDao;
import spms.vo.Booking;

@Component("/booking/allUpdate.do")
public class BookingAllUpdateController implements Controller, DataBinding {
	
	BookingDao bookingDao = null;
	
	
	public BookingAllUpdateController setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		
		Booking booking = (Booking)model.get("booking");

		if (booking.getIsUpdate() != 0) {//이곳에는 로그인이 들어가야함
			//수정 작업 후 리스트 화면으로 이동
			bookingDao.allUpdate(booking);
			return "redirect:list.do";
		}else {
			//수정 작업 전 수정폼 화면으로 이동
			Booking selectBno = bookingDao.selectOne(booking.getBno());
			model.put("booking", selectBno);
			return "/booking/BookingUpdateForm.jsp";
		}
		
		//로그인 session id (=회원id)랑 현재 상세화면에서 수정했을때 id 같으면 if분기
//		String userID = null;
//		if(session.getAttribute("userID") != null) {
//		if (ssession.get("a").equal(booking.getNname())) {
//			//내가 수정폼 들어간다.
//			model.put("booking", slectBno);
//			return "/booking/BookingUpdateForm.jsp";
//		}else {
//			//다른사람이 수정폼 들어간다. 막아야한다.
//			bookingDao.allUpdate(booking);
//			return "redirect:list.do";
//		}
		
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"booking", spms.vo.Booking.class
		};
	}


}