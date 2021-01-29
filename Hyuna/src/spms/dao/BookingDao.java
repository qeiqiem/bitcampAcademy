package spms.dao;

import java.util.List;

import spms.vo.Booking;

public interface BookingDao {
	public List<Booking> selectList() throws Exception;
	public int insert(Booking booking) throws Exception;
}
